function git-fetch-merge
    set remote (git remote | grep upstream)
    set branch $argv[1]
    
    if test -z $remote
        set remote origin
    end
    
    if test -z $branch
        set branch (git main-branch)
    end
    
    colour_log "Fetching and merging $remote/$branch..."
    and git fetch $remote
    and git merge $remote/$branch
end
