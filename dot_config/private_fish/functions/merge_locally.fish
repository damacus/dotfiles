function merge_locally
    set -l remote $argv[1]
    set -l branch $argv[2]
    colour_log "Merging $remote/$branch locally..."
    git fetch $remote
    and git merge --no-edit $remote/$branch
end
