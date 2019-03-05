MY=(
    [ROLE]=app
    [RUN_AS]=www
    [PHP_MODS]="${PHP_MODS:-}"
)

passthrough_unless "php-fpm" "$@"

[[ -z "${MY[PHP_MODS]}" ]] || {
    apt-get update
    apt-get install ${MY[PHP_MODS]}
}

run "$@"
