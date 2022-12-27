#!/bin/sh

mkdir -p schema-generated
./tools/merge-schema.py schema-device device.notification.yml device_notification.json
./tools/merge-schema.py schema-device device.method.yml device_method.json
./tools/merge-schema.py schema-admin admin.method.yml admin_method.json

mkdir -p uReader
./tools/generate-reader.uc device_notification.json
./tools/generate-reader.uc device_method.json
./tools/generate-reader.uc admin_method.json

mkdir -p docs
generate-schema-doc --config expand_buttons=true schema-generated/device_notification.json docs/device_notification.html
generate-schema-doc --config expand_buttons=true schema-generated/device_method.json docs/device_method.html
generate-schema-doc --config expand_buttons=true schema-generated/admin_method.json docs/admin_method.html
