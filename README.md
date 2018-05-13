# backup-aws-s3

DockerHub: https://hub.docker.com/r/girigiribauer/backup-aws-s3/



## How to use (docker run)

If your dump file is `./tmp/dump/`, you type it.

docker run \
  --rm \
  -v $PWD/tmp:/storage \
  -e BACKUP_COUNTS=3 \
  -e AWS_ACCESS_KEY_ID=XXXXXXXXXXXXXXXXXXXX \
  -e AWS_SYNC_BUCKETNAME="my_bucket_name/backups" \
  -e AWS_SECRET_ACCESS_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx \
  girigiribauer/backup-aws-s3



## Environment Variables

### `BACKUP_DIR`

default: `/storage`

Backup base directory.

### `BACKUP_DUMP_DIR`

default: `${BACKUP_DIR}/dump`

Backup dump directory, tarball source here.

### `BACKUP_TARBALL_DIR`

default: `${BACKUP_DIR}/backups`

Backup tarball target directory.

### `BACKUP_COUNTS`

default: 7

Backup tarball counts. Expired files are deleted.

### `AWS_ACCESS_KEY_ID`

default: `XXXXXXXXXXXXXXXXXXXX` (**should override**)

Your aws access key here.

### `AWS_DEFAULT_REGION`

default: `us-east-1`

Your region here.

### `AWS_SECRET_ACCESS_KEY`

default: `xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx` (**should override**)

Your aws secret access key here.

### `AWS_SYNC_BUCKETNAME`

default: `my_backet_name` (**should override**)

Your bucket name here. You can write sub directories. (don`t need `s3://`)
