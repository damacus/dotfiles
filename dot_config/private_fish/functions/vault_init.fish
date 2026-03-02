function vault_init --description 'Initialize Vault' --argument SERVER
    kubectl exec -nvault -ti "vault-$SERVER" -- vault operator init -key-shares=1 -key-threshold=1 -format=json >/tmp/vault-init.json

    op item create \
        --category "Secure Note" \
        --title="vault-keys" \
        "keys.json=(jq -r . /tmp/vault-init.json)"

end
