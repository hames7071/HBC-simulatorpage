# remove existing temporary production directory, if any
rm -rf production

# activate default configs for my personal gcloud account
gcloud config configurations activate default
# set project to proper value
gcloud --quiet config set project ihbc

# copy everything in a new production directory but exclude git directories
rsync -d -r --exclude='production' --exclude='.git' ./* ./production

# copy production directory to google storage
gsutil -m rsync -d -r production gs://ihbc-code/website/production

# remove temporary production directory
rm -rf production
