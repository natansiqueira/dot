# dot

My personal tweaks on **macOS**. Tweak it as you like it, [dotfiles are meant to be forked](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked).

Includes:
- homebrew to install GUI applications and CLI tools
- terminal & shell settings
- macOS system preferences

## let's go
**1.** Check for software updates.
```sh
$ sudo softwareupdate -i -r
```

**2.** Install Xcode Command Line Tools.
```sh
$ xcode-select --install
```

**3.** Install it all.
> don't just like _run_ this, [check the file contents!](bootstrap.sh).

```sh
$ curl -L https://raw.github.com/natanounatan/dot/master/bootstrap.sh | sh
```

**4.** Set Bash as the default shell
> Append `/opt/homebrew/bin/bash` to your `/etc/shells` file.
> You can replace vim with your favorite text editor.
```sh
$ sudo vim /etc/shells
```
Save & exit then restart your Terminal

Have fun!

<img width="842" alt="Terminal with bash shell" src="https://github.com/natanounatan/dot/assets/141770869/f1b4e3f0-0cb7-4230-9105-8fd6850d46c1">

# thanks to...
* [Diéssica](https://github.com/diessica/dotfiles) for the base for these repository and where I got to know what dotfiles are
* [Rob](https://github.com/rwxrob/dot) for the scripts and bash files structure and organization

###### LICENSE
[![CC0](http://mirrors.creativecommons.org/presskit/buttons/88x31/svg/cc-zero.svg)](http://creativecommons.org/publicdomain/zero/1.0/)
