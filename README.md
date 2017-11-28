# Build AWS AMI with Packer and Terraroform


Buid 
======

1. Clone the repositóry

```
$ git clone  https://github.com/petersonwsantos/packer-terraform-aws-ami.git
$ cd packer-terraform-aws-ami

```

2. Run container with cli tools for building (terraform, packer and awscli).
```  
$ docker run -ti  \
--mount type=bind,source="$(pwd)",target=/code  \
petersonwsantos/build-ec2-ami \
bash
```

3. Configure awscli  [_*note_]
```
container_#> aws configure
```

4. Build AMI
```
container_#> sh build-ami.sh

```
5. Verfify in your AWS Console / EC2 / AMI.



Remove 
=======

1. Remove terraform resources on AWS

```
container_#> terraform destroy -force
```
2. Please enter the AWS console and manually delete AMI created. 


Finish

----------

[_*note_] Note: If you already have awscli configured on your terminal it is possible to mount the aws configuration file for the container.

( -v ~/.aws:/root/.aws ) -> With this option you do not need to run aws configure.

Example:

```  
  $ docker run -ti  \
  --mount type=bind,source="$(pwd)",target=/code  \
  -v ~/.aws:/root/.aws \
  petersonwsantos/build-ec2-ami \
  bash

  ```
