export GCSFUSE_REPO=`lsb_release -c -s`

export GOOGLE_APPLICATION_CREDENTIALS=/content/gcp_key.json

echo "deb https://packages.cloud.google.com/apt gcsfuse-$GCSFUSE_REPO main" | sudo tee /etc/apt/sources.list.d/gcsfuse.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-get update
sudo apt-get install gcsfuse

pip install -qq --no-cache-dir -U crcmod

mkdir -p sd-data
mkdir -p sd-ml-data

gcsfuse --implicit-dirs czc-sd-ml-data sd-ml-data
gcsfuse --implicit-dirs czc-sd-data sd-data

gcloud auth activate-service-account --key-file=/content/gcp_key.json
