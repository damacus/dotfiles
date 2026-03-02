function vault_unseal --description 'Unseal Vault' --argument SERVER
    kubectl exec -nvault -ti "vault-$SERVER" -- vault operator unseal (op read "op://Ironstone Road/vault/unseal_keys_b64")
end
