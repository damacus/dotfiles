function kfails --description 'Show failing pods and count'
    kubectl get po -owide --all-namespaces | grep "0/" | tee /dev/tty | wc -l
end
