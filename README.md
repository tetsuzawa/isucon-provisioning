# isucon-provisioning

# 使い方

1. AWS PROFILEの設定

```shell
export AWS_PROFILE=<your profile>
```

2. 生成

```shell
make -C stacks SCOPE=isuconXX-qualify apply
```

> [!NOTE]
> 以下のコマンドで立ち上げたインスタンスのPublic IPアドレスを取得できます。
> 
> ```console
> $ aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query 'Reservations[*].Instances[?Tags[?Key==`Name` && starts_with(Value, `isu_`)]].[Tags[?Key==`Name`]|[0].Value, PublicIpAddress]' --output text | awk '{print $1 "=" $2}'
> isu_1=xxx.xxx.xxx.xxx
> isu_2=xxx.xxx.xxx.xxx
> isu_3=xxx.xxx.xxx.xxx
> isu_bench=xxx.xxx.xxx.xxx
> ```


3. 破壊

```shell
make -C stacks SCOPE=isuconXX-qualify destroy
```
