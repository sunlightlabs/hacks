# Git config aliases

## How to add these aliases

If you want to add them globally (meaning available wherever you're using git), you want to edit your global git configuration file. For instance, if you want to alias `co` to the git `checkout` command, set an alias by executing:

    git config --global alias.co checkout

Alternatively, you can edit your global `.gitconfig` file directly. It's usually in `$HOME/.gitconfig`, but to be sure, just execute:

    git config --global --edit

and your default editor will open with that file.  To give an example of how to enter a new alias: mine looks like this, after having run the alias command above:
    
    [user]
            email = blannon@gmail.com
            name = Bob Lannon
    [push]
            default = simple
    [alias]
            co = checkout

## Helpful bits for Pull Requests

    pr = "!f() { git fetch origin refs/pull/$1/head:pr/$1; git checkout pr/$1; git merge master; }; f"
    cleanup = "!f() { git branch -D `git branch | grep pr`; }; f"
    good = "!f() { x=$(git rev-parse --abbrev-ref HEAD); git checkout master; git merge $x; }; f"

Workflow is basically, check out the target branch, and run `git pr 302` (where
`302` is the number of a pull request).

## Log views

    plog = "!f() { git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit; }; f"
