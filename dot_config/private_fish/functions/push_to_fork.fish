function push_to_fork
    set -l remote $argv[1]
    set -l branch $argv[2]
    if test "$remote" != origin
        colour_log "Pushing it to origin/$branch..."
        git push origin $branch
    end
end
