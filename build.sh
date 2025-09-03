#!/usr/bin/env sh
TIMESTAMP="${TIMESTAMP:-$(date -u +"%Y%m%d%H%M")}"
set -x

work_dir="/workdir"
build_left_script="set -x;\
    west build --pristine=always -s zmk/app -d './build' -b 'nice_nano_v2' -S 'studio-rpc-usb-uart' -- -DZMK_CONFIG=/app/config -DSHIELD='corne_left nice_view_adapter nice_view'
    "
build_right_script="set -x;\
    west build --pristine=always -s zmk/app -d './build' -b 'nice_nano_v2' -S 'studio-rpc-usb-uart' -- -DZMK_CONFIG=/app/config -DSHIELD='corne_right nice_view_adapter nice_view'
    "
# Make it happen...
eval "${build_left_script}"
cp ${work_dir}/build/zephyr/zmk.uf2 /app/firmware/zmk_${TIMESTAMP}_left.uf2
eval "${build_right_script}"
cp ${work_dir}/build/zephyr/zmk.uf2 /app/firmware/zmk_${TIMESTAMP}_right.uf2
