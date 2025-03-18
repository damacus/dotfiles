function kgp --wraps='kubectl get po' --description 'alias kgp=kubectl get po'
  kubectl get po $argv
end
