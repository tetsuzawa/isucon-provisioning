# isucon-provisioning

spot instanceでisucon環境作る君です

AWS上にkey pairを持ってる前提です


AWS_PROFILE
https://github.com/tetsuzawa/isucon-provisioning/blob/440bd7db73c3c556d4d36530af6e8f5a661b5bf6/stacks/Makefile#L7


key pair
https://github.com/tetsuzawa/isucon-provisioning/blob/440bd7db73c3c556d4d36530af6e8f5a661b5bf6/stacks/isucon12-qualify/key_pair.tf#L3

をよしなに書き換えて使ってください。


# 実行方法


生成

```
make -C stacks SCOPE=isuconXX-qualify apply
```

破壊

```
make -C stacks SCOPE=isuconXX-qualify destroy
```


# メモ

isucon本番と同じ環境にするには ssh keyのインストールとかを事前にやっておく必要がある。
