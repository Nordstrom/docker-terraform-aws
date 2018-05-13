url=http://169.254.169.254/latest/meta-data/iam/security-credentials/$roleArn
curl $url -o "creds.json"
access_key_id=`jq '.AccessKeyId' creds.json | sed 's/^"\(.*\)"$/\1/'`
secret_access_key=`jq '.SecretAccessKey' creds.json | sed 's/^"\(.*\)"$/\1/'`
token=`jq '.Token' creds.json | sed 's/^"\(.*\)"$/\1/'`
export AWS_PROFILE=default
mkdir ~/.aws
echo [default] > credentials
echo aws_access_key_id=$access_key_id >> credentials
echo aws_secret_access_key=$secret_access_key >> credentials
echo aws_session_token=$token >> credentials
echo aws_security_token=$token >> credentials
mv credentials ~/.aws/credentialsi
/bin/terraform
