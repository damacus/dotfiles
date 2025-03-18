function kdebug --wraps='kubectl run -i -t debug --rm --image=caarlos0/debug --restart=Never' --description 'alias kdebug=kubectl run -i -t debug --rm --image=caarlos0/debug --restart=Never'
  kubectl run -i -t debug --rm --image=caarlos0/debug --restart=Never $argv
end
