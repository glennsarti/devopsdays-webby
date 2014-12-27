#!/bin/bash
set -e

S3_BUCKET="devopsdays.org"

################################################################################
# Upload S3
################################################################################
echo "Uploading new assets to s3 bucket $S3_BUCKET using circleci-devopsdays account"
echo "[default]" > ~/.s3cfg
echo "access_key=$S3_ACCESS_KEY" >> ~/.s3cfg
echo "secret_key=$S3_SECRET_KEY" >> ~/.s3cfg

s3cmd_version=1.5.0-beta1
echo "download s3cmd $s3cmd_version"
curl -O -L https://github.com/s3tools/s3cmd/archive/v$s3cmd_version.tar.gz
tar xzf v$s3cmd_version.tar.gz

s3cmd-$s3cmd_version/s3cmd sync --acl-public --progress site/content/ s3://$S3_BUCKET --bucket-location=EU


