# dotfiles
設定ファイルの管理 
個人用

### ファイルの移動  
(新しく管理するファイルorディレクトリを追加する場合)  
mv [追加するもの] dotfiles
↓
link.shに追加

### 初期setup
```
bash -c "`curl -fsSL https://raw.githubusercontent.com/ktpi2000/dotfiles/master/setup.sh `"
```
実行内容
- dotfilesのダウンロード
- シンボリックリンクの貼り付け
- package install
- ログインシェルをzshに変更
- プラグイン更新
- シェル再起動

### 使い方
cd $HOME  
git clone  
cd dotfiles  
chmod +x dotfilesLink.sh  
./dotfilesLink.sh  

### update
dotfiles内で 
 
git add .  
git commit -m "anything"  
git push origin master  

### sync
remoteの状態と同期する  
git pull 

### memo
dein.vimのアップデート 
:call dein#update()


