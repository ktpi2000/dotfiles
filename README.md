# dotfiles
設定ファイルの管理

### ファイルの移動  
(新しく管理するファイルorディレクトリを追加する場合)  
mv [追加するもの] dotfiles  


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
githubの状態と同期する  
git pull 

### memo
dein.vimのアップデート 
:call dein#update()
