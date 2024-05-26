# lua-heroism

<!-- NOTE: UPDATE THIS OPENER WITH OTHER DEPENDANCIES AS NEEDED! -->
A full game written in Lua using [Love2D](https://love2d.org/)! This project has been something I've wanted to make for a long time now, and I'm really happy that I finally started. I'm using Lua since it's a fast language that I know and am comfortable using, I'm also generally very productive in Lua.

This is an open-ended role-playing game where the player ...

# Dependancies

If you want to play or contribute to the game, you'll need to make sure you have the dependancies. Of course we rely on Lua 5.4, so you'll definitely need to have it installed.

### Installing Lua for Windows

For installing on Windows, you'll have to go to the <i>LuaBinaries</i> SourceForge page [here](https://sourceforge.net/projects/luabinaries/files/5.4.2/Tools%20Executables/). Once there, scroll down and download the "<i>lua-5.4.2_Win(whatever bit your computer supports)_bin.zip</i>" file.

Extract that zip file and rename it to whatever you can remember it as (eg: lua or Lua). Put it somewhere safe (I recommend <i>\Program Files\</i>), and copy that folder's location.

In the search bar, search up "Edit the system enviorment variables", and select the first option. Click on the button where it says "Enviorment Variables", and edit the Path variable (should be located near the top on user variables). Make a new variable and paste the location you copied earlier. Now you have offically installed Lua on Windows!

### Installing Lua for Linux

#### Build from Source

TODO: Fill out.

#### Install from the Terminal

You'll want to get your terminal open for these steps. The commands may vary slightly depending on your distribution of choice.

Debian/Ubuntu: `sudo apt-get install lua5.4`

OpenSUSE: `sudo zypper install lua54`

RHEL/CentOS: `sudo yum install lua`

Fedora: `sudo dnf install lua`

Arch: `sudo pacman -Sy lua`

If there are other commands or package managers I'm missing, please edit this README with them and open a pull request please!

### Installing Lua for MacOS

#### Build from Source

TODO: Fill out.

#### Homebrew

In your terminal, make sure `brew` is up to date; `brew update`. Once you've confirmed this, simply type;

`brew install lua`

And it should work its magic.

---

### Install Love 2D (For Contributers)

Go to the [Love2d](https://love2d.org/) website, and download the file depending on your OS.

TODO: Finish (maybe make platform specific)
