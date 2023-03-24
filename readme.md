1. Dockerイメージ作成&起動してzshに入る
```
./create
```

2. nvim起動してdeinのインストールを待つ

3. もう一回nvim起動してcocのフォルダ生成を待つ

4. tmuxに入り prefix + I でプラグインをインストール

5. exitして、
```
docker ps -a
```
で、IDを確認し
```
docker commit <container-id> <任意のイメージ名>
```
