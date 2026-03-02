function kimg --description 'Get container images from a deployment'
    kubectl get deployment --output=jsonpath='{.spec.template.spec.containers[*].image}' $argv
end
