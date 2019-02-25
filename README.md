# dotfiles
設定ファイルの管理

### 使い方
cd $HOME  
git clone  
chmod + dotfilesLink.sh  
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
