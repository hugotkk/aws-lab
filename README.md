# Create 2 ec2 instances with asg

The template will white current IP in security group.

So I can play around on this instance safely.

Please change KeyName to your KeyPair on aws account

```
ip=$(curl ipinfo.io/ip)
aws cloudformation create-stack \
--stack-name test \
--template-body file://lab.yml \
--parameters \
ParameterKey=MyIp,ParameterValue=$ip \
ParameterKey=KeyName,ParameterValue=hugotse \
ParameterKey=InstanceType,ParameterValue=t2.micro \
ParameterKey=ImageId,ParameterValue=ami-02abcf80896e78cc4 \
ParameterKey=NumberOfInstance,ParameterValue=2 \
--capabilities CAPABILITY_NAMED_IAM
```

# SAM Deployment

My upload speed is very slow. It is hard to deploy lambda with docker image on my local machine. So I need to start a ec2 instance to do this job.

I use centos7.9 as OS for this task.

I will use SSM automation to create a AMI with docker, aws, sam, git installed

Then use cloudformation to create an instance for the deployment

# Create iam for ssm automation

This is not great. Because i cannot find out the essential access right to execute this automation task. I just grant Adminstrator right to it.

```
aws cloudformation update-stack --stack-name ssm-automation-iam --template-body file://ssm-automation-iam.yml --capabilities CAPABILITY_NAMED_IAM
```

# Create gloden ami

```
AccountId=$(aws sts get-caller-identity --query 'Account' --output text)
aws ssm start-automation-execution \
--document-name "AWS-UpdateLinuxAmi" \
--parameters \
PostUpdateScript=https://raw.githubusercontent.com/hugotkk/aws-lab/main/bootstrap.sh,\
SourceAmiId=ami-00f8e2c955f7ffa9b,\
AutomationAssumeRole=arn:aws:iam::$AccountId:role/AutomationServiceRole,\
IamInstanceProfileName=ManagedInstanceProfile
```

# Create instance

ami-07ef284fb98013cc8 is an public ami created from previous command. 

I have set it as public but I don't know when I will delete it.

```
ip=$(curl ipinfo.io/ip)
aws cloudformation create-stack --stack-name sam \
--template-body file://sam.yml \
--parameters \
ParameterKey=MyIp,ParameterValue=$ip \
ParameterKey=KeyName,ParameterValue=hugotse \
ParameterKey=ImageId,ParameterValue=ami-07ef284fb98013cc8 \
--capabilities CAPABILITY_NAMED_IAM
```
