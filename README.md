
> **Note:** This is still work in progress. At the moment just a dumping ground for all my configs along with some notes that make sense just to me. 

```
wpa_supplicant -B -i wlp0s20f3 -c <(wpa_passphrase 'SSID' 'PASSWORD')
```

Stuff to do
* sudo mkdir -p /usr/share/backgrounds
* sudo cp monk-wallpaper-zoom-blurred.jpg /usr/share/backgrounds
* sudo mkdir -p /usr/local/bin
* cp monk-wallpaper.jpg /home/venkatn/.background-image
* cp -r config/* /home/venkatn/.config/
* cp .zshrc .tmux.conf .p10k.zsh .Xresources ~/
* update sensitive information 
  * rclone token
  * jbinance api key and secret
  * polybar youtube api key
  * polybar weather api key
* sync_from_cloud

* mkdir
  * ~/downloads
  * ~/opt/scripts
  * ~/play
  * ~/dev/repos

* lxappearance
  * Font = Roboto 11
  * Theme = Adapta Nokto Eta

* betterlockscreen -u ~/.background-image --blur 1.0

* install vscode extension
  * j-james.adapta-nokto-vscode
  * Nix by Baptist BENOIST

* gnucash > preferences > Numbers, Date, Time > Force Prices to display as decimals

* bw login

* "keyctl link @u @s" needs to be executed at startup