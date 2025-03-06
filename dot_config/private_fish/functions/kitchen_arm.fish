function arm --wraps='set -xU KITCHEN_LOCAL_YAML kitchen.arm.yml' --description 'alias arm set -xU KITCHEN_LOCAL_YAML kitchen.arm.yml'
    set -xU KITCHEN_LOCAL_YAML kitchen.arm.yml $argv
end
