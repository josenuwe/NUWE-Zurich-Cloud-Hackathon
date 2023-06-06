# User guide

For this challenge the following files will be provided: auto-install.sh and client_data.json. 
The auto-install.sh file will install everything needed to start development, except for the dependencies that will be used during development. Once it is run and everything is complete, it should be installed:
- cURL
- Python3
- Pip
- Terraform
- Docker
- Docker-compose
- Localstack
- AWS CLI

The use of this script is completely optional, the user can choose to install what is needed or other things as they are needed.

Localstack will also be left ready to go.

## Localstack
Localstack is a fully functional AWS-based local cloud stack, i.e. it emulates AWS along with all its functionalities. In this case, we will be using the Community version and it has limitations, but all the proposed tasks can be performed with this version.
AWS CLI works with localstack, just add the --endpoint-url parameter and specify localstack, for example:
```bash
aws --endpoint-url=http://localhost:4566 s3 mb s3://first-bucket
```
That being said, the most important part is how do you start localstack?
Simple, just run it:
```bash
localstack start -d
```
Localstack will be running in a container, with port 4566 open where the requests will be made.

In case you have chosen not to use the automatic installation script, you can get a version of Localstack directly from its official repository using docker-compose.
More information: https://docs.localstack.cloud/overview/

## Warning
The script is intended to work in Linux environments, it has been tested on Ubuntu 22.04. It is recommended to use a fresh install, as the next phase of the challenge will continue this one.
It is also recommended to create a snapshot as soon as the OS installation is complete and another one after running the script if it worked correctly, so you can easily revert to a previous version if something goes wrong.

## FAQ
- Can I use any OS other than Linux?
Yes, you can use any operating system you wish, but it is highly recommended to use Linux.
- Can I develop the challenge using the real version of AWS?
Yes, but it is recommended to use Localstack as it will not cost you anything, it is faster to test what you want and you don't have to worry if you need to do a lot of testing.
- Is it mandatory to use Terraform?
No, but it is recommended as it is very versatile and can work with many providers.
- What will I get if I complete the test successfully?
If you complete the test successfully, you will get access to the on-site phase in Barcelona, where the technical team from Zurich and NUWE will be present.
- Do I have to save the files created? 
Yes, the next phase of the challenge will continue this and some tasks may require the use of them.