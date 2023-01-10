handler () {
    set -e
    EVENT_DATA=$1
    REQUEST_ID=$(grep -Fi Lambda-Runtime-Aws-Request-Id "$HEADERS" | tr -d '[:space:]' | cut -d: -f2)
    echo $REQUEST_ID
    echo $EVENT_DATA
    echo $EVENT_DATA | jq -r ."repourl"
    S3BUCKET=$(echo $EVENT_DATA | jq -r ."queryStringParameters"."s3bucket")
    S3OBJECTKEY=$(echo $EVENT_DATA | jq -r ."queryStringParameters"."s3objectkey")
    echo "s3://$S3BUCKET/$S3OBJECTKEY"
    cd /tmp
    mkdir $REQUEST_ID
    cd $REQUEST_ID
    ls
    aws s3 cp s3://$S3BUCKET/$S3OBJECTKEY execute.sh
    sleep 2
    ls
    chmod +x execute.sh
    ./execute.sh 
    cd ..
    rm -rf $REQUEST_ID
    cd ..
    echo "{\"statusCode\": 200, \"body\": \"Execution Successful!!\"}" >&2
}
