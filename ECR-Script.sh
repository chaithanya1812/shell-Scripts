#!/bin/bash

# Asking for Registry && Repo_Name  &&  Tag Details of Image
# Enter registry details
# Enter Image Repo name
# Enter Image Tag
##############################
R="\e[31m"
G="\e[32m"
N="\e[0m"

echo -e "Enter Registry_Name::\c"
read Registry_Name

echo -e "\nEnter Image Repo_Name::\c"
read Repo_Name

echo -e "\nEnter Image Tag_Number::\c"
read TAG

echo -e "\nEnter ECR Region_name::\c"
read Region_Name
# Searching for images

aws ecr list-images  --repository-name ${Repo_Name} --region ${Region_Name} | jq -r  '.imageIds[].imageTag' | grep "${TAG}" > /dev/null

if [[ $? -eq 0 ]]; then
    echo -e "$R Image found with this ${TAG}"
    echo -e  "Don't Build the Image with this ${TAG} $N"
else
      echo -e "$G Image Not found with this ${TAG}"
      echo -e  " Go & Build the Image with this ${TAG} $N"
fi
