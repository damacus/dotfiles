function knrunning --wraps='kubectl get pods --field-selector=status.phase!=Running' --description 'alias knrunning=kubectl get pods --field-selector=status.phase!=Running'
    kubectl get pods --field-selector=status.phase!=Running $argv
end
