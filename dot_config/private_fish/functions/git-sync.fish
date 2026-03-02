function git-sync
    set -l branch (git symbolic-ref --short HEAD)
    set -l remote (git remote | grep upstream)
    if test -z "$remote"
        set remote origin
    end

    prune $remote
    and merge_locally $remote $branch
    and push_to_fork $remote $branch
    and git branch -u $remote/$branch
    and git-delete-local-merged
    and colour_log "All done!"

end
