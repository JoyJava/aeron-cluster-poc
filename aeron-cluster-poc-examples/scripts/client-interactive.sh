#!/usr/bin/env bash

cd $(dirname $0)
cd ../

JAR_FILE=$(ls target |grep jar)

echo $JAR_FILE

java \
-cp target/${JAR_FILE}:target/lib/* \
-Daeron.dir=/dev/shm/aeron-client-interactive-0 \
-Daeron.threading.mode=SHARED \
-Daeron.cluster.member.endpoints="3=localhost:20113" \
${JVM_OPTS} io.scalecube.acpoc.InteractiveClient
