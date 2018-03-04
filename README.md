# dir-restore-s3

Docker image to restore S3 archive to directory via [s3cmd](https://github.com/s3tools/s3cmd)

## Motivation

To restore Docker volume or just a directory from backup.

## Usage example

```
docker run --rm \
  -v $(pwd):/restore \
  -e AWS_ACCESS_KEY=xxx \
  -e AWS_SECRET_KEY=xxx \
  caseycs/dir-restore-s3 \
  s3://bucket/directory/file
```
