#!/bin/bash

backup_dir=$(mktemp -d)

echo "Created backup dir $backup_dir"

timestamp=`date +%F-%H%M`
# TAR_TARGET=$BACKUP_DIR/mongodb-$TIMESTAMP-$ENV_NS
mongo_out_file=$backup_dir/mongodump-$HOST_NAME-$timestamp

echo "Create dump & tar"
mongodump --forceTableScan --uri=$MONGO_URL -o $mongo_out_file
tar cf $mongo_out_file.tar $mongo_out_file

echo $SERVICE_ACCOUNT_JSON > $backup_dir/service-account.json
gcloud auth activate-service-account --key-file=$backup_dir/service-account.json
gsutil cp $mongo_out_file.tar $GOOGLE_BUCKET/$GOOGLE_FOLDER

echo "Copied dump to Google storage"