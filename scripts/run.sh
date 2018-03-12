#!/bin/bash

echo "building.."
stack build
echo "build successful!"

echo "starting server on http://localhost:8080/users"
stack exec "s-servant-rest-api"