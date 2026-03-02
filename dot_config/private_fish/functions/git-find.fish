function git-find
    git symbolic-ref refs/remotes/origin/HEAD | string replace -r '^refs/remotes/origin/' ''
end
