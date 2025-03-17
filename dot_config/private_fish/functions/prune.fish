function prune
    set remote $argv[1]
    colour_log "Pruning $remote..."
    git remote prune "$remote"
end
