# Installs wordpress in webroot via temp-directory using WordPress git repo
#
# @note 
# Only use this installer if the user want to control WP core updates by himself
# if we want to controll the updates then use johnpbloch/wordpress-core composer package and edit .gitignore
#
# @info
# we keep this out of composer because we can controll our package updates via composer and we dont
# want to get any conflics. Another important reason is we don't want to store wp-content out of the webroot
# when a client controlls the updates.
#
# @usage
# simply run: sh install-wordpress.sh
#
# @author
# Michel Verhoeven <michel@woweb.nl>

mkdir temp-wp
cd temp-wp
echo "Temporary directory created, starting downloading WP..."
git clone https://github.com/WordPress/WordPress.git .
git checkout tags/6.5
echo "WP downloaded, starting moving files..."
# delete files we dont need
rm -rf wp-content
rm wp-config-sample.php
if [ -d ".git" ]; then 
rm -rf .git 
fi
cd ..
mv -v temp-wp/* webroot/
echo "Files moved started cleanup..."
rm -rf temp-wp
echo "WP installed in webroot, job done!"
