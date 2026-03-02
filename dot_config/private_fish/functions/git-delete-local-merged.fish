function git-delete-local-merged
    if not git rev-parse --is-inside-work-tree &>/dev/null
        echo "Not a git repository" >&2
        return 1
    end

    set -l main_branch (git-main-branch)
    set -l current_branch (git branch --show-current)

    colour_log "Removing merged branches..."
    set -l merged (git branch --merged $main_branch \
        | string trim \
        | string match -v "$main_branch" \
        | string match -v "$current_branch" \
        | string match -v '\* *')

    if test (count $merged) -gt 0
        git branch -d $merged
    end

    colour_log "Removing squash-merged branches..."
    for branch in (git for-each-ref refs/heads/ --format="%(refname:short)")
        test "$branch" = "$main_branch"; and continue
        test "$branch" = "$current_branch"; and continue
        contains -- $branch $merged; and continue

        set -l base (git merge-base $main_branch $branch 2>/dev/null); or continue
        set -l hash (git rev-parse "$branch^{tree}" 2>/dev/null); or continue
        set -l commit (git commit-tree $hash -p $base -m _ 2>/dev/null); or continue

        if test (git cherry $main_branch $commit 2>/dev/null) = "- $commit"
            git branch -D $branch
        end
    end
end
