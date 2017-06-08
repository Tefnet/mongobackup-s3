[![Layers](https://images.microbadger.com/badges/image/tefnet/mongobackup-s3.svg)](http://microbadger.com/images/tefnet/mongobackup-s3)
[![Docker Stars](https://img.shields.io/docker/stars/tefnet/mongobackup-s3.svg?style=flat-square)](https://hub.docker.com/r/tefnet/mongobackup-s3)
[![Docker Pulls](https://img.shields.io/docker/pulls/tefnet/mongobackup-s3.svg?style=flat-square)](https://hub.docker.com/r/tefnet/mongobackup-s3/)

Docker Image for MongoDB AWS S3 backups based on [Alpine Linux](http://www.alpinelinux.org), [mongodump](https://docs.mongodb.com/manual/reference/program/mongodump/) and [awscli](https://github.com/aws/aws-cli)

## Use

### Environment variables

- `MONGO_HOST` - MongoDB hostname.
- `S3_BUCKET` - S3 bucket name where backups will be stored.
- `S3_PATH` - Path in your bucket where backups will be stored.

## IAM Policy

IAM Policy you need to add to IAM user. Please change `BUCKET_NAME` to your S3 bucket name.

```xml
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Stmt1412000000001",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::BUCKET_NAME"
            ]
        },
        {
            "Sid": "Stmt1412000000002",
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:PutObjectAcl"
            ],
            "Resource": [
                "arn:aws:s3:::BUCKET_NAME/*"
            ]
        }
    ]
}
```

