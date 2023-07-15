# Script to automate the download of everything needed to use the development environment

# Create folders to persist data from container mounts
echo "Creating volume docker folders..."
mkdir -p ./docker/gogs/data # Change this if necessary
mkdir -p ./docker/jenkins_home # Change this if necessary
mkdir -p ./docker/localstack # Change this if necessary

# Check for curl
if command -v curl > /dev/null; then
    echo "curl is already installed"
else
    echo "curl is not installed, installing now..."
    sudo apt install curl    
fi

# Check for python3
if command -v python3 > /dev/null; then
    echo "python3 is already installed"
else
    echo "python3 is not installed, installing now..."
    sudo apt install python3
fi

# Check for pip
if command -v pip3 > /dev/null; then
    echo "pip3 is already installed"
else
    echo "pip3 is not installed, installing now..."
    sudo apt install python3-pip
fi

# Check for Terraform
if command -v terraform > /dev/null; then
    echo "Terraform is already installed"
else
    echo "Terraform is not installed, installing now..."
    curl -fsSLO https://releases.hashicorp.com/terraform/1.4.6/terraform_1.4.6_linux_amd64.zip
    sudo unzip terraform_1.4.6_linux_amd64.zip -d /usr/local/bin 
    sudo chmod 755 /usr/local/bin/terraform 
    rm terraform_1.4.6_linux_amd64.zip
fi

# Check for Docker
if command -v docker > /dev/null; then
    echo "docker is already installed"
else
    echo "docker is not installed, installing now..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker $USER
fi

# Install docker-compose
if command -v docker-compose > /dev/null; then
    echo "docker-compose is already installed"
else
    echo "docker-compose is not installed, installing now..."
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
fi

# Check for AWS CLI
if command -v aws > /dev/null; then
    echo "AWS CLI is already installed"
else
    echo "AWS CLI is not installed, installing now..."
    sudo apt install awscli
    mkdir -p $HOME/.aws
    touch $HOME/.aws/config
    echo "[profile aws_local]" >> $HOME/.aws/config
    echo "region = eu-west-1" >> $HOME/.aws/config
    echo "output = json" >> $HOME/.aws/config
    echo "aws_access_key_id = test" >> $HOME/.aws/config
    echo "aws_secret_access_key = test" >> $HOME/.aws/config
fi

# Reboot system
echo "All tasks completed. Reboot the system."
#sudo reboot
