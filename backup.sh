#!/bin/sh

# backup variables
BACKUP_DUMP_DIR="${BACKUP_DUMP_DIR:-"/dump"}"
BACKUP_TARBALL_DIR="${BACKUP_TARBALL_DIR:-"/backups"}"
BACKUP_FILENAME="backup-$(date "+%Y%m%d-%H%M%S").tar.gz"
BACKUP_COUNTS="${BACKUP_COUNTS:-7}"

# aws variables
AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID:-"XXXXXXXXXXXXXXXXXXXX"}"
AWS_DEFAULT_REGION="${AWS_DEFAULT_REGION:-"us-east-1"}"
AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY:-"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"}"
AWS_SYNC_BUCKETNAME="${AWS_SYNC_BUCKETNAME:-"my_backet_name"}"

# create tarball directory
mkdir -p ${BACKUP_TARBALL_DIR}

# create tarball
tar zcvf ${BACKUP_TARBALL_DIR}/${BACKUP_FILENAME} -C ${BACKUP_DUMP_DIR} . > /dev/null 2&>1

# delete dumpfiles
rm -rf ${BACKUP_DUMP_DIR}/*

# delete expired tarballs
rm -f $(ls -t ${BACKUP_TARBALL_DIR}/* | tail -n+$(expr ${BACKUP_COUNTS} + 1))

# sync s3
aws s3 sync --delete --exact-timestamps ${BACKUP_TARBALL_DIR} "s3://${AWS_SYNC_BUCKETNAME}"
