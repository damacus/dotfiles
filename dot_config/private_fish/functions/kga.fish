function kga --wraps='kubectl get --all-namespaces' --description 'alias kga=kubectl get --all-namespaces'
  kubectl get --all-namespaces $argv
        
end
