function yolo --description 'Create and immediately merge a PR'
    gh pr create -f $argv; and gh pr merge -sd --admin
end
