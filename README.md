Magento Deployer
================

Easy deployer script for Magento eCommerce CMS on UNIX systems.

You should have three folders in your webroot directory:
- persistent: The non-versioned files of Magento like shell, core, etc. You should put these files into this folder at once.
- releases: It is an empty folder. It contains the releases from git repository by this deployer script. Do not touc h to this folder.
- links/media and links/var: It contains the big files, images, caches, etc what are non-versioned files.

Deploying:
- If your directory structure is done, run the script by: bash deployer.sh
- The Script will create a new version folder with a timestamp name in the releases folder.
- Your git project will be cloned to new version folder.
- Your persistent folder will be merged into new version folder (by copy).
- Your links/media and links/var folders will be linked into the new version folder.
- The script will create a link with name current what point to your new release folder.
