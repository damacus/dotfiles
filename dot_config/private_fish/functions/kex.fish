function kex --wraps='kubectl exec -it' --description 'alias kex=kubectl exec -it'
  kubectl exec -it $argv
end
