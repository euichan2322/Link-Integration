# Link-integration
<img src="https://github.com/euichan2322/Link-Integration/blob/dd/logo/sample-diagram.gif" width="1000">


It changes the domain and path of your URL to make it easier to read and search. Using Route 53, S3, and Cloudfront

----

## To use this module

----

### Prerequisites

1. Route 53 Host zone
ex) euichan.com

2. ACM certificates generated in the us-east-1 region
ex) *.euichan.com

3. AWS Privileges
Terraform will import these into data and use them.

----

## To start use module

change directory name /module/sample
If your OS is Linux
```
git clone https://github.com/euichan2322/Link-Integration
cd Link-Integration/
mv module/sample/ module/<your-name>
cd module/<your-name>
sed -i 's/euichan.com/<your domain>/' main.tf
sed -i 's/notion/<your platform>/' main.tf
sed -i '6s|euichan2322.notion.site/206b9e4a2f0e4aef99f4cfaf277fd27b?pvs=4|<your redirect target>|' main.tf
terraform init
terraform apply
```

====

## Precautions

#### 1. S3 bucket name will create your platform.domain
ex) notion.euichan.com
S3 bucket name must be unique all over the world

if same name bucket is exist, 
then change the second line of the S3.tf 

```
    bucket = "${var.platform}.${var.domain}" -> bucket = "<your bucket name>"
```
#### 2. careful region
default region is ap-northeast-2
change the twelfth line of the provider.tf
```
  region = "ap-northeast-2"
```
