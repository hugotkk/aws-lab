# Create 2 ubuntu instances with asg

```
aws cloudformation create-stack \
--stack-name test \
--template-body file://lab.yml \
--parameters \
ParameterKey=MyIp,ParameterValue=192.168.0.1 \
ParameterKey=KeyName,ParameterValue=hugotse \
ParameterKey=InstanceType,ParameterValue=t2.micro \
ParameterKey=NumberOfInstance,ParameterValue=2 \
--capabilities CAPABILITY_NAMED_IAM
```

# Create instance for SAM deployment

```
aws cloudformation create-stack --stack-name sam \
--template-body file://sam.yml \
--parameters ParameterKey=MyIp,ParameterValue=192.168.0.1 \
ParameterKey=KeyName,ParameterValue=hugotse \
--capabilities CAPABILITY_NAMED_IAM
```
