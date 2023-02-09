# TODO

[ ] - keyboard integration
[ ] - finish fzf
[ ] - sessioniser sorta thing

## win32yank.exe
- ~~install this to `/usr/local/bin/` and chmod executable~~ - apparently this doesn't work anymore
- Work-around [here](https://github.com/equalsraf/win32yank/issues/9). Essentially use `scoop` (windows pkgman) to install win32yank, then just symlink in wsl.

```
sudo ln -s "/mnt/c/Users/${user}/scoop/shims/win32yank.exe" "/usr/local/bin/win32yank.exe"
```

## STOW

- Clone the repo 
- `stow -t ~ . --adopt` - adopt will change the files to those that already exist e.g. .bashrc
- `git reset --hard`  - "revert" changes to match repo files
- Install oh-my-zsh because everything is broken until you do that

## git fetch from origin

Run the following and see what the output is: 

```
git config --get remote.origin.fetch
+refs/heads/*:refs/remotes/origin/*
```

if that doesn't work then set: 

```
git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
```
