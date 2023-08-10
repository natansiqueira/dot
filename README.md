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

# thanks to...
[Diéssica](https://github.com/diessica/dotfiles) for the base for these repository and where I got to know what dotfiles are
[Rob](https://github.com/rwxrob/dot) for the scripts and bash files structure and organization

###### LICENSE
[![CC0](http://mirrors.creativecommons.org/presskit/buttons/88x31/svg/cc-zero.svg)](http://creativecommons.org/publicdomain/zero/1.0/)
