function git-main-branch
    git-find
    or begin
        # this fixes cases in which, somehow, the remotes/origin/main file disappeared.
        # fetch will create it again, and the find will then work again
        git fetch --prune origin >/dev/null 2>&1
        git-find
    end
end
