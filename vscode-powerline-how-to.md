# Using `agnoster` theme for VSCode terminal
When using Oh my ZSH and the `agnoster` theme, powerline fonts are required.
If you can't get the fonts to install properly via `apt`, the following commands will help

```sh
git clone https://github.com/abertsch/Menlo-for-Powerline.git
cd Menlo-for-Powerline
sudo mv "Menlo*.tff" /usr/share/fonts
```

## If `sudo mv Menlo*.tff /usr/share/fonts` does not work
Just manually copy the font files one by one for now
```sh
sudo mv Menlo\ Bold\ for\ Powerline.ttf /usr/share/fonts/
sudo mv Menlo\ Bold\ Italic\ for\ Powerline.ttf /usr/share/fonts/
sudo mv Menlo\ for\ Powerline.ttf /usr/share/fonts/
sudo mv Menlo\ Italic\ for\ Powerline.ttf /usr/share/fonts/
```

Based on this [stackoverflow answer](https://stackoverflow.com/a/64040556)
