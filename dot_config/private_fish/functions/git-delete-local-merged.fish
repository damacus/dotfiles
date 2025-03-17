function git-delete-local-merged
    set main_branch (git-main-branch)

    colour_log "Removing merged branches..."
    set branches (git branch --merged | grep -v "^\*" | grep -v $main_branch | tr -d '\n')
    if test -n $branches
        echo "$branches" | xargs git branch -d
    end

    colour_log "Removing branches squashed or merged into $main_branch..."
    git for-each-ref refs/heads/ --format="%(refname:short)" | while read branch
        set base (git merge-base $main_branch $branch)
        set hash (git rev-parse "$branch^{tree}")
        set commit (git commit-tree $hash -p $base -m _)
        if test (git cherry $main_branch $commit) = "- $commit"
            git branch -D $branch
        end
    end
end
