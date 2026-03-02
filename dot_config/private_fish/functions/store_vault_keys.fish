function store_vault_keys --description 'Store Vault keys in 1Password'
    op item create \
        --category "Secure Note" \
        --title="vault-login" \
        --vault "Home Assistant" \
        "keys.json=(jq -r . /tmp/vault-init.json)" \
        --tags "vault,k3s"
end
