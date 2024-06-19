# AWS Project

## By Nir Tuttnauer and Tomer Mizrahi

## Description
This project involves creating a sample podcaster site where users can manage and enjoy podcasts. The application is built using Next.js for the frontend, Flask for the backend, and RDS for the database. The project utilizes AWS services including Lambda, API Gateway, EC2, and RDS. Terraform is used for infrastructure management.

## Setup and Installation
To set up and run this project, follow the steps below:

1. **Clone the repository**
    ```bash
    git clone "https://github.com/NTTM-Cloud-Solutions/AWS.git"
    cd AWS
    ```

2. **Create an RDS DB**
    - Create an RDS instance in the AWS console or using the AWS CLI.
    - I added a db.sql file to help you create the tables
    - Note the database URL, username, and password for later use.

3. **Create an EC2 instance using the provided installation shell script**
    - Launch an EC2 instance in the AWS console.
    - Use the `install.sh` script provided to set up the instance.

4. **Create an image of the EC2 instance and save the AMI**
    - Once the instance is configured, create an AMI for future use.

5. **Use the init script with Terraform to configure the necessary resources**
    - The `init.sh` script will be used to set up the environment on the EC2 instance.

6. **Run Terraform to apply the configuration**
    - Use Terraform to deploy the necessary AWS resources.
    ```bash
    terraform apply --auto-approve
    ```

**Note**: The specific details for creating the EC2 instance, using the installation shell script, and configuring resources with Terraform may vary depending on your specific setup and requirements.

### install.sh
```bash
#!/bin/bash

# VERY IMPORTANT you need to run this as root... before running the script use: sudo -i

# Log the start of the script
echo "Starting user data script..." > /var/log/user-data.log

# Update package list
sudo apt-get update -y

# Log package list update
echo "Package list updated" >> /var/log/user-data.log

# Install necessary packages
sudo apt-get install -y python3-venv python3-pip git curl
sudo apt-get install -y libmysqlclient-dev pkg-config
sudo apt install -y python3.12-venv npm

# Install NVM
echo "Installing NVM..." >> /var/log/user-data.log
sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash >> /var/log/user-data.log 2>&1

# Configure NVM in profile
export NVM_DIR="$HOME/.nvm"
echo "export NVM_DIR=\"$HOME/.nvm\"" >> /root/.bashrc
echo "[ -s \"$NVM_DIR/nvm.sh\" ] && \. \"$NVM_DIR/nvm.sh\"" >> /root/.bashrc
echo "[ -s \"$NVM_DIR/bash_completion\" ] && \. \"$NVM_DIR/bash_completion\"" >> /root/.bashrc

# Load NVM
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Install Node.js using NVM
echo "Installing Node.js..." >> /var/log/user-data.log
sudo nvm install 18 >> /var/log/user-data.log 2>&1

# Clone the Git repository
GIT_REPO_URL="your git repo here"
DEST_DIR="/root/test-cloud"

if [ -d "$DEST_DIR" ]; then
  echo "Directory $DEST_DIR already exists, stashing local changes and pulling latest changes" >> /var/log/user-data.log
  cd "$DEST_DIR"
  git stash >> /var/log/user-data.log 2>&1
  git pull origin main >> /var/log/user-data.log 2>&1
else
  echo "Cloning repository from $GIT_REPO_URL to $DEST_DIR" >> /var/log/user-data.log
  git clone "$GIT_REPO_URL" "$DEST_DIR" >> /var/log/user-data.log 2>&1
fi

# Define project and environment directories
PROJECT_DIR="/opt/podify"
VENV_DIR="/opt/server/myenv"
PYTHON_SCRIPT="/opt/server/app.py"
REQUIREMENTS_FILE="/opt/server/requirements.txt"

# Copy the cloned repository to the target directory
sudo cp -r "$DEST_DIR/podify" "$PROJECT_DIR"
sudo cp -r "$DEST_DIR/server" /opt/

# Export DATABASE_URL environment variable
export DATABASE_URL='mysql://username:password@podify-db.example.com:3306/db'
echo "Exported DATABASE_URL" >> /var/log/user-data.log

# Check if project directory exists
if [ -d "$PROJECT_DIR" ]; then
  cd "$PROJECT_DIR"
else
  echo "Project directory $PROJECT_DIR does not exist" >> /var/log/user-data.log
  exit 1
fi

# Check if virtual environment exists
if [ -f "$VENV_DIR/bin/activate" ]; then
  source "$VENV_DIR/bin/activate"
else
  # Create a virtual environment if it doesn't exist
  python3 -m venv "$VENV_DIR"
  source "$VENV_DIR/bin/activate"
fi

# Install pip requirements
if [ -f "$REQUIREMENTS_FILE" ]; then
  pip install -r "$REQUIREMENTS_FILE" >> /var/log/user-data.log 2>&1
  echo "Pip requirements installed" >> /var/log/user-data.log
else
  echo "requirements.txt not found in /opt/server/" >> /var/log/user-data.log
  exit 1
fi

# Check if Python script exists and run it
if [ -f "$PYTHON_SCRIPT" ]; then
  # Ensure the Flask app binds to 0.0.0.0
  sed -i "s/app.run(host='127.0.0.1', port=3010)/app.run(host='0.0.0.0', port=3010)/g" "$PYTHON_SCRIPT"
  python3 "$PYTHON_SCRIPT" >> /var/log/user-data.log 2>&1 &
  PYTHON_PID=$!
  echo "Started Python script with PID $PYTHON_PID" >> /var/log/user-data.log
else
  echo "Python script $PYTHON_SCRIPT does not exist" >> /var/log/user-data.log
  exit 1
fi

# Check if package.json exists, build the Next.js app, and start it
if [ -f "package.json" ]; then
  npm install >> /var/log/user-data.log 2>&1
  npm run build >> /var/log/user-data.log 2>&1
  sleep 30
  npm run start >> /var/log/user-data.log 2>&1 &
  NEXT_PID=$!
  echo "Started Next.js with PID $NEXT_PID" >> /var/log/user-data.log
else
  echo "package.json not found in $PROJECT_DIR" >> /var/log/user-data.log
  exit 1
fi

# Sleep for a few seconds to let services start
sleep 10

# Check if Python script is running
if ps -p $PYTHON_PID > /dev/null; then
  echo "Python script is running" >> /var/log/user-data.log
else
  echo "Python script is not running" >> /var/log/user-data.log
fi

# Check if Next.js application is running
if ps -p $NEXT_PID > /dev/null; then
  echo "Next.js application is running" >> /var/log/user-data.log
else
  echo "Next.js application is not running" >> /var/log/user-data.log
fi

# Log the end of the script
echo "User data script finished" >> /var/log/user-data.log
```

### init.sh
```bash
#!/bin/bash

# Log the start of the script
echo "Starting user data script..." > /var/log/user-data.log

# Update package list
sudo apt-get update -y

# Log package list update
echo "Package list updated" >> /var/log/user-data.log

# Define project and environment directories
PROJECT_DIR="/opt/podify"
VENV_DIR="/opt/server/myenv"
PYTHON_SCRIPT="/opt/server/app.py"
REQUIREMENTS_FILE="/opt/server/requirements.txt"

# Copy the cloned repository to the target directory
sudo cp -r "$DEST_DIR/podify" "$PROJECT_DIR"
sudo cp -r "$DEST_DIR/server" /opt/

# Export DATABASE_URL environment variable
export DATABASE_URL='mysql://username:password@podify-db.example.com:3306/db'
echo "Exported DATABASE_URL" >> /var/log/user-data.log

# Check if project directory exists
if [ -d "$PROJECT_DIR" ]; then
  cd "$PROJECT_DIR"
else
  echo "Project directory $PROJECT_DIR does not exist" >> /var/log/user-data.log
  exit 1
fi

# Check if virtual environment exists
if [ -f "$VENV_DIR/bin/activate" ]; then
  source "$VENV_DIR/bin/activate"
else
  # Create a virtual environment if it doesn't exist
  python3 -m venv "$VENV_DIR"
  source "$VENV_DIR/bin/activate"
fi

# Install pip requirements
if [ -f "$REQUIREMENTS_FILE" ]; then
  pip install -r "$REQUIREMENTS_FILE" >> /var/log/user-data.log 2>&1
  echo "Pip requirements installed" >> /var/log/user-data.log
else
  echo "requirements.txt not found in /opt/server/" >> /var/log/user-data.log
  exit 1
fi

# Check if Python script exists and run it
if [ -f "$PYTHON_SCRIPT" ]; then
  # Ensure the Flask app binds to 0.0.0.0
  sed -i "s/app.run(host='127.0.0.1', port=3010)/app.run(host='0.0.0.0', port=3010)/g" "$PYTHON_SCRIPT"
  python3 "$PYTHON_SCRIPT" >> /var/log/user-data.log 2>&1 &
  PYTHON_PID=$!
  echo "Started Python script with PID $PYTHON_PID" >> /var/log/user-data.log
else
  echo "Python script $PYTHON_SCRIPT does not exist" >> /var/log/user-data.log
  exit 1
fi

# Check if package.json exists, build the Next.js app, and start it
if [ -f "package.json" ]; then
  npm install >> /var/log/user-data.log 2>&1
  npm run start >> /var/log/user-data.log 2>&1 &
  NEXT_PID=$!
  echo "Started Next.js with PID $NEXT_PID" >> /var/log/user-data.log
else
  echo "package.json not found in $PROJECT_DIR" >> /var/log/user-data.log
  exit 1
fi

# Sleep for a few seconds to let services start
sleep 10

# Check if Python script is running
if ps -p $PYTHON_PID > /dev/null; then
  echo "Python script is running" >> /var/log/user-data.log
else
  echo "Python script is not running" >> /var/log/user-data.log
fi

# Check if Next.js application is running
if ps -p $NEXT_PID > /dev/null; then
  echo "Next.js application is running" >> /var/log/user-data.log
else
  echo "Next.js application is not running" >> /var/log/user-data.log
fi

# Log the end of the script
echo "User data script finished" >> /var/log/user-data.log
```

## Usage
This project is a sample podcaster site for managing and adding or removing podcasts for users to enjoy. It involves a frontend built with Next.js, a backend with Flask, and a database managed by RDS, all running on AWS.
