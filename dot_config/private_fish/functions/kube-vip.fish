function kube-vip --description 'Run kube-vip container'
    docker run --network host --rm ghcr.io/kube-vip/kube-vip:v1.0.0 $argv
end
