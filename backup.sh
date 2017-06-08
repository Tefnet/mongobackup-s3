#!/bin/sh
set -e
BACKUP_NAME="mongodump_$(date -u +%Y-%m-%d_%H-%M-%S).gz"

[ -z "${MONGO_HOST}" ] && { echo "Please specify MONGO_HOST" > /dev/stderr; exit 1;}
[ -z "${S3_BUCKET}" ] && { echo "Please specify S3_BUCKET" > /dev/stderr; exit 1;}
[ -z "${S3_PATH}" ] && { echo "Please specify S3_PATH" > /dev/stderr; exit 1;}

echo "Backing up mongodb://${MONGO_HOST} to s3://${S3_BUCKET}/${S3_PATH}/${BACKUP_NAME}"
mongodump -h ${MONGO_HOST} --archive --gzip | aws s3 cp - s3://${S3_BUCKET}/${S3_PATH}/${BACKUP_NAME}
echo "Backup complete"
