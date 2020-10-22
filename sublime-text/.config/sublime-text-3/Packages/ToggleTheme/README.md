#Toggle Theme

##Introduction
Why use this plugin? Instead of having to manually click Preferences->Color Scheme->Some Colors, you can simply press F12 (CMD+F12 on OSX) in order to toggle between two themes. If you enable the theme switcher, you can also easily toggle between themes that compliment your color schemes.

##Features
* Command Pallete - You can now use the command palette to toggle, or open the default and user settings files.
* Menu file - You can now use the Menu to open the default and user settings files.
* Hotkey - You can now use hotkey to toggle between themes (default to F12).

##Installation
If we want to manually install it, two solutions:
* Remove the "package-metadata.json" file (package control tracj only package which have this file)
* Change package control user configuration with "remove_orphaned": false


###Package Control \(preferred\)
***It cannot be install using package control yet.***

1. Install the [Package Control][packagecontrol] plugin if you haven't already.
2. Simply press CTRL-SHIFT-P from inside Sublime Text, then type PCI, and press enter. This will open the package installation browser.
3. Type 'ThemeToggle' then press enter.

Congratulations. The plugin is now installed. Test it by pressing F12 a few times.

##Notes
* This plugin will overwrite the following settings in your Preferences.sublime-settings (USER) file:
  * color_scheme
  * theme (if theme switching is enabled)

[st2]: http://www.sublimetext.com/ "Sublime Text 2"
[st3]: http://www.sublimetext.com/3 "Sublime Text 3"
