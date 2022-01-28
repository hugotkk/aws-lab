
```
aws cloudformation create-stack --stack-name first-cfn --template-body file://lab.yml --parameters ParameterKey=MyIp,ParameterValue= ParameterKey=KeyName,ParameterValue=hugotse
```

```
aws cloudformation update-stack --stack-name first-cfn --template-body file://lab.yml --parameters ParameterKey=MyIp,ParameterValue= ParameterKey=KeyName,ParameterValue=hugotse
```
