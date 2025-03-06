function kdrain --wraps='kubectl drain --ignore-daemonsets --delete-local-data' --description 'alias kdrain=kubectl drain --ignore-daemonsets --delete-local-data'
  kubectl drain --ignore-daemonsets --delete-local-data $argv
        
end
