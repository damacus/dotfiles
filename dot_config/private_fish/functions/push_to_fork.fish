function push_to_fork
    set remote $argv[1]
    set branch $argv[2]
    if ! test "$remote" = "origin"
        colour_log "Pushing it to origin/$branch..."
        git push origin $branch
    end
end
