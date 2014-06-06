#!/bin/bash
# ============================================================
# @project Magento Light Deployer
# @description Easy deployer script on UNIX systems to Magento
# @link https://github.com/DoveID/Magento-Deployer
# @author DoveID
# ============================================================

echo "Config setup"

# You should edit this path variables ========================
# current (webroot)
current="/var/www/mysite.com/webroot/current"
# git path
gitrepo="https://github.com/MyGitUserName/MyProject.git"
# persistent folder (persistent files of magento)
persistentfolder="/var/www/mysite.com/persistent"
# media folder
mediafolder="/var/www/mysite.com/links/media"
# var folder
varfolder="/var/www/mysite.com/h/links/var"
# release folder
timestamp=$(date +%Y%m%d_%H%M%S)
releasefolder="/var/www/mysite.com/releases/$timestamp"
# ============================================================

# Do not modify the following lines  =========================
echo "Start createing new release"

# create release folder
mkdir $releasefolder

# clone from git to release folder
git clone $gitrepo $releasefolder

# merge persistent folder into release folder
cp -R $persistentfolder/. $releasefolder

echo "Put new version to LIVE"

# link var folder and media folder into new release folder
ln -s $varfolder $releasefolder/var
ln -s $mediafolder $releasefolder/media

# link current folder to new release folder
unlink $current
ln -s $releasefolder $current

echo "New version has been deployed"
# ============================================================
