# Reference
- https://cloud.google.com/sdk/gcloud
- https://cloud.google.com/sdk/gcloud/reference

# Show current acount, project etc.
```sh
gcloud config list
```

# Show/select accounts
```sh
gcloud auth list
gcloud auth login
gcloud config set account `ACCOUNT`
```

# Show/select projects
```sh
gcloud projects list

gcloud config set project PROJECT_ID
```

# Compute

## Inspect/list stuff
```sh
# list instances
gcloud compute instances list

# show instance details
gcloud compute instances describe
```

## Create instance
```sh
# EXAMPLE 1: from https://cloud.google.com/ai-platform/deep-learning-vm/docs/quickstart-cli?hl=en_US
export IMAGE_FAMILY="tf-latest-cu92"
export ZONE="us-west1-b"
export INSTANCE_NAME="my-new-instance"
export INSTANCE_TYPE="n1-standard-8"
gcloud compute instances create $INSTANCE_NAME \
        --zone=$ZONE \
        --image-family=$IMAGE_FAMILY \
        --image-project=deeplearning-platform-release \
        --maintenance-policy=TERMINATE \
        --accelerator="type=nvidia-tesla-v100,count=8" \
        --machine-type=$INSTANCE_TYPE \
        --boot-disk-size=120GB \
        --metadata="install-nvidia-driver=True"
```

```sh
# EXAMPLE 2: from https://course.fast.ai/start_gcp.html
export IMAGE_FAMILY="pytorch-latest-gpu" # or "pytorch-latest-cpu" for non-GPU instances
export ZONE="us-west1-b"
export INSTANCE_NAME="my-fastai-instance"
export INSTANCE_TYPE="n2d-highmem-8" # budget: "n2d-highmem-4"
# budget: 'type=nvidia-tesla-T4,count=1'
gcloud compute instances create $INSTANCE_NAME \
        --zone=$ZONE \
        --image-family=$IMAGE_FAMILY \
        --image-project=deeplearning-platform-release \
        --maintenance-policy=TERMINATE \
        --accelerator="type=nvidia-tesla-p100,count=1" \
        --machine-type=$INSTANCE_TYPE \
        --boot-disk-size=200GB \
        --metadata="install-nvidia-driver=True" \
        --preemptible
```

