# gcp-configuration

gcloud compute instances create --boot-disk-size=10GB --image=ubuntu-1604-xenial-v20200317 --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --zone=europe-west1-b my-reddit-app --metadata-from-file startup-script=C:\Users\Vadim\start.sh