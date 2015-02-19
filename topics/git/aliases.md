# Git config aliases

## Helpful bits for Pull Requests

    pr = "!f() { git fetch origin refs/pull/$1/head:pr/$1; git checkout pr/$1; git merge master; }; f"
    cleanup = "!f() { git branch -D `git branch | grep pr`; }; f"
    good = "!f() { x=$(git rev-parse --abbrev-ref HEAD); git checkout master; git merge $x; }; f"

Workflow is basically, check out the target branch, and run `git pr 302` (where
`302` is the number of a pull request).
