function kdp --wraps='kubectl describe po' --description 'alias kdp=kubectl describe po'
  kubectl describe po $argv
end
