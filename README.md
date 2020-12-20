#### Sample Input

```
terraform apply -var="aws_region=us-east-2" \
                -var="aws_vpc_name=myVpc" \
                -var="aws_vpc_subnet_az_2=us-east-2a" \
                -var="aws_vpc_subnet_az_1=us-east-2b" \
                -var="aws_cred_path=/Users/foobar/.aws" \
                -var="aws_rds_user=root" 
                -var="aws_rds_pass=Abcd123456" \
```