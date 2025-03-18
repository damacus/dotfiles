function krm --wraps='kubectl delete' --description 'alias krm=kubectl delete'
  kubectl delete $argv
end
