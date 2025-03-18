function kfails --wraps='kubectl get po -owide --all-namespaces | grep "0/" | tee /dev/tty | wc -l' --description 'alias kfails=kubectl get po -owide --all-namespaces | grep "0/" | tee /dev/tty | wc -l'
  kubectl get po -owide --all-namespaces | grep "0/" | tee /dev/tty | wc -l $argv
        
end
