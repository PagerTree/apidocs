#!/usr/bin/env bash

bundle exec middleman build --clean
aws s3 sync ./build s3://apidocs.pagertree.com --acl public-read --delete --cache-control max-age=604800
