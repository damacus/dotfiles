if status is-interactive
    # Commands to run in interactive sessions can go here
    source /Users/damacus/.config/op/plugins.sh
    fzf --fish | source
end

if type -q direnv
  direnv hook fish | source
end

if type -q asdf
  fish_add_path --prepend "$HOME/.asdf/shims"

  if not contains $_asdf_shims $PATH
      set -gx --prepend PATH $_asdf_shims
  end
  set --erase _asdf_shims
end

if type -q task
  task --completion fish | source
end

fish_add_path -p ~/.cargo/bin/

abbr -a g git
abbr -a gl 'git pull --prune'
abbr -a glg "git log --graph --decorate --oneline --abbrev-commit"
abbr -a glga "glg --all"
abbr -a gp 'git push origin HEAD'
abbr -a gpa 'git push origin --all'
abbr -a gd 'git diff'
abbr -a gc 'git commit -s'
abbr -a gca 'git commit -sa'
abbr -a gco 'git checkout'
abbr -a gb 'git branch -v'
abbr -a ga 'git add'
abbr -a gaa 'git add -A'
abbr -a gcm 'git commit -sm'
abbr -a gcam 'git commit -sam'
abbr -a gs 'git switch'
abbr -a gwc 'git switch -c'
abbr -a gsm 'git switch (git main-branch)'
abbr -a gsms 'git switch (git main-branch); and git sync'
abbr -a gst 'git status'
abbr -a gss 'git status -sb'
abbr -a ggp 'git push origin'

abbr -a vim nvim
abbr -a cat bat
abbr -a l 'eza -lh --icons'
abbr -a ll 'eza -l --icons'
abbr -a ug update_git
abbr -a d docker

if test -d terraform
  abbr -a tf terraform
  abbr -a tfp 'terraform plan'
  abbr -a tfa 'terraform apply'
  abbr -a tfi 'terraform init'
end

if type -q kitchen
    abbr -a kitchen 'bundle exec kitchen'
    abbr -a kl 'bundle exec kitchen list'
    abbr -a kt 'bundle exec kitchen test'
    abbr -a kc 'bundle exec kitchen converge'
    abbr -a kd 'bundle exec kitchen destroy'
    abbr -a kli 'bundle exec kitchen login'
    abbr -a kv 'bundle exec kitchen verify'
end

if test -d /Users/damacus/.codeium/windsurf/bin
    fish_add_path /Users/damacus/.codeium/windsurf/bin
end
