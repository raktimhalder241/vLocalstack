#!/bin/bash

DOLLAR="$"

createDockerCompose() {
	cat > ../docker-compose.yml <<EOF
version: '2.1'

services:
  localstack:
    container_name: "$DOLLAR{LOCALSTACK_DOCKER_NAME-localstack_main}"
    image: localstack/localstack
    network_mode: bridge
    ports:
      - "4566:4566"
      - "4571:4571"
      - "$DOLLAR{PORT_WEB_UI-8080}:$DOLLAR{PORT_WEB_UI-8080}"
    environment:
      - SERVICES=$DOLLAR{SERVICES- }
      - DEBUG=$DOLLAR{DEBUG- }
      - DATA_DIR=$DOLLAR{DATA_DIR- }
      - PORT_WEB_UI=$DOLLAR{PORT_WEB_UI- }
      - LAMBDA_EXECUTOR=$DOLLAR{LAMBDA_EXECUTOR- }
      - KINESIS_ERROR_PROBABILITY=$DOLLAR{KINESIS_ERROR_PROBABILITY- }
      - DOCKER_HOST=unix:///var/run/docker.sock
      - HOST_TMP_FOLDER=$DOLLAR{TMPDIR}
    volumes:
      - "$DOLLAR{TMPDIR:-/tmp/localstack}:/tmp/localstack"
      - "/var/run/docker.sock:/var/run/docker.sock"
EOF
}