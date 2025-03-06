function kimg --wraps=kubectl\ get\ deployment\ --output=jsonpath=\'\{.spec.template.spec.containers\[\*\].image\}\' --description alias\ kimg=kubectl\ get\ deployment\ --output=jsonpath=\'\{.spec.template.spec.containers\[\*\].image\}\'
  kubectl get deployment --output=jsonpath='{.spec.template.spec.containers[*].image}' $argv
        
end
