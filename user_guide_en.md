# User's Guide 

For this phase of the challenge the following files will be provided:
- **Dockerfile**: creates a custom Jenkins image with everything needed to automate the deployment through a pipeline.
- **docker-compose.yml**: automates the deployment of the development environment.
- **auto-install.sh**: installs everything needed to work with the development environment:
    - cURL
    - Python3
    - Pip
    - Terraform
    - Docker
    - Docker-compose
    - AWS CLI
    
    It also creates folders for data persistence of the created containers, creates the **docker** group and adds the current user to that group.
- **app.py**: WebApp to upload images that are stored in an S3 Bucket.
- **index.html**

Once the script is completed, run the following command:

```bash
docker-compose up --build -d
```

At the end of the process, three containers should have been created:
- **Gogs**
- **Jenkins**
- **Localstack**

The use of these scripts is completely optional, the user can choose to install what is needed or other things as they are needed.

You will also see that there is a folder called **localstack_pro** with another docker-compose inside. You will need to use it for Block 2, as the **Community** version does not have all the necessary functionality.

## Localstack
Localstack is a fully functional AWS-based local cloud stack, i.e. it emulates AWS along with all its functionalities. For this challenge, the Community version can be used in **Block 1**. For **Block 2** it will be necessary to enter the API Key provided to use the Pro version of Localstack.

AWS CLI works with localstack, just add the --endpoint-url parameter and specify the localstack one, for example:

```bash
aws --endpoint-url=http://localhost:4566 s3 mb s3://first-bucket
```
or use the version provided by Localstack: **awslocal**. You can also use the official version of **AWS CLI** by creating an **alias** if you do not want to add --endpoint-url continuously.

There are several options to start Localstack, in this case, a docker-compose is provided and you don't need to do anything else.
In case you do not use the provided files, you will have to install localstack manually and run it:

```bash
localstack start -d
```

## Warning
All files provided are intended to work with Linux, they have been tested on Ubuntu 22.04. It is recommended to use a fresh install to avoid conflicts.
It is also recommended to create a snapshot immediately after completing the OS installation and another one after running the script if it worked correctly, so you can easily revert to a previous version if something goes wrong.

## FAQ
- Can I use any OS other than Linux?
Yes, you can use any operating system you want, but it is highly recommended to use Linux.
- Can I develop the challenge using the real version of AWS?
Yes, but it is recommended to use Localstack as it will not have any cost, it is faster to test what you want and you don't have to worry if you need to do a lot of testing.
- Is it mandatory to use Terraform?
No, but it is recommended as it is very versatile and can work with many vendors.
- Is it mandatory to complete both blocks?
No, it is not mandatory to complete both blocks, but it is recommended to get the highest possible score.
- How important is the report?
The report is one of the most important parts of the challenge. It is where the solution to the problem posed is explained, which will be reviewed by the Zurich team as well.