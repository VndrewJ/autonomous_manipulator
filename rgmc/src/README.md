# Robotic Grasping and Manipulation Competition (2020 OUTDATED)
Robotic Grasping and Manipulation Competition repository

### Git cheatsheet:

- Clone repo and initialize nested submodules:
```console
git clone -b <branch name> --recurse-submodules <repo url>
```

- Add submodule with a specific branch
```console
git submodule add -b <branch name> <repo url>
```

- If submodule was added to current project, make sure to run command bellow to update any nested submodules:
```console
git submodule update --init --recursive
```