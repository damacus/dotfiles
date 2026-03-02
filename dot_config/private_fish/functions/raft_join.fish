function raft_join --description "Join a specified server to Vault's Raft backend" --argument SERVER
    kubectl exec -nvault -ti "vault-$SERVER" -- vault operator raft join http://vault-0.vault-internal:8200
    vault_unseal $SERVER
end
