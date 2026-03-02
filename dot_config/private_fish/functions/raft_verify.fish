function raft_verify --description 'Get the status of a Raft node' --argument SERVER
    kubectl exec -nvault -ti "vault-$SERVER" -- vault login (op read "op://Ironstone Road/vault/root_token")
    kubectl exec -nvault -ti "vault-$SERVER" -- vault operator raft list-peers
end
