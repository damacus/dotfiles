function kgno --wraps='kubectl get no --sort-by=.metadata.creationTimestamp' --description 'alias kgno=kubectl get no --sort-by=.metadata.creationTimestamp'
  kubectl get no --sort-by=.metadata.creationTimestamp $argv
        
end
