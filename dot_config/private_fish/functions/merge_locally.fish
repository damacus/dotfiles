function merge_locally
    set remote $argv[1]
    set branch $argv[2]
    colour_log "Merging $remote/$branch locally..."
    git fetch $remote
    and git merge --no-edit $remote/$branch
end
