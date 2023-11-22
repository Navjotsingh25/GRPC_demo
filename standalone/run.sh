#!/usr/bin/env bash

if ! command -v protoc &> /dev/null
then
    echo "protoc must be installed to run this script"
    exit 1
fi

protoc --include_imports --descriptor_set_out wiremock-data/grpc/services.dsc ExampleServices.proto
/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home/bin/java -cp wiremock-standalone-3.3.1.jar:wiremock-grpc-extension-standalone-0.4.0.jar wiremock.Run --port 8000 --root-dir wiremock-data