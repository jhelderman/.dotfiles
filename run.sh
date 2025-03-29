#!/usr/bin/env bash

script_dir=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
filter=""
dry="0"
while getopts "f:d" opt; do
    case $opt in
        f)
            filter=$OPTARG
            ;;
        d)
            dry="1"
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            ;;
    esac
done

log() {
    if [ "$dry" == "1" ]; then
        echo "DRY RUN: $@"
    else
        echo $@
    fi
}

execute() {
    if [ "$dry" == "1" ]; then
        echo "DRY RUN: $@"
    else
        echo "Executing: $@"
        $@
    fi
}
log "Script dir: $script_dir"
log "Filter: $filter"

cd $script_dir
scripts=$(find $script_dir/scripts -type f)

for script in $scripts; do
    if echo $script | grep -qv "$filter"; then
        log "Skipping $script"
        continue
    fi
    execute $script
done
