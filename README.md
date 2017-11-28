# packer-terraform-aws-ami
Build AWS AMI with Packer and Terraroform


# Usage

Clone the repositóry

```
$ git clone  https://github.com/petersonwsantos/packer-terraform-aws-ami.git
$ cd packer-terraform-aws-ami

```

Run container with cli tools for building (terraform, packer and awscli).
```  
$ docker run -ti  \
--mount type=bind,source="$(pwd)",target=/code  \
petersonwsantos/build-ec2-ami \
bash
```

Configure awscli  [_*1_]
```
container_#> aws configure
```

Build AMI
```
container_#> sh build-ami.sh

```
Verfify in your AWS Console / EC2 / AMI.


Remove terraform resources on AWS
Attention: The AMI created will not be deleted from AWS. Please enter the console and manually delete it in Console / Ec2 / AMI.

```
container_#> terraform destroy -force
```

Finish

----------

[_*1_] Note: If you already have awscli configured on your terminal it is possible to mount the aws configuration file for the container.
( -v ~/.aws:/root/.aws ) -> With this option you do not need to run aws configure.

Example:

```  
  $ docker run -ti  \
  --mount type=bind,source="$(pwd)",target=/code  \
  -v ~/.aws:/root/.aws \
  petersonwsantos/build-ec2-ami \
  bash

  ```
