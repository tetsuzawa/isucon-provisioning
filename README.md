# isucon-provisioning

# 実行方法

1. AWS PROFILEの設定

```shell
export AWS_PROFILE=<your profile>
```

2. 生成

```shell
make -C stacks SCOPE=isuconXX-qualify apply
```

3. 破壊

```shell
make -C stacks SCOPE=isuconXX-qualify destroy
```
