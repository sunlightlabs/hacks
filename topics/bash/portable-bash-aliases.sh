# portable bash aliases
## the problem is that a lot of the time you have multiple machines of differing unix flavor and homebrew likes to prefix system commands w/ a 'g' like "gls" and gfind etc .

ha! this is not a reliable way to decide
case `uname -s` in
Darwin)
    export PATH=/usr/local/bin:/usr/local/share/python:$PATH:/opt/local/bin:/opt/local/sbin:/sw/bin:/sw/sbin:/Developer/usr/bin
    DIRCOLORS=gdircolors
    LS_C=gls
    TAR_C=gtar
    RM_C=rmtrash  # strange thing that comes w/ ports pkg osxutils
    CP_C=gcp
    MV_C=gmv
    LN_C=gln
    DF_C=gdf
    FIND_C=gfind
    XARGS_C=gxargs
    VI_C=/Applications/MacVim.app/Contents/MacOS/Vim
    BASH_COMP=/usr/local/etc/bash_completion
    alias eject="diskutil eject"
    ;;

Linux)
    DIRCOLORS=dircolors
    TAR_C=tar
    LS_C=ls
    RM_C="rm -i"
    MV_C=mv
    CP_C=cp
    VI_C=vim
    XARGS_C=xargs
    BASH_COMP=/etc/bash_completion
    ;;

*BSD)
    DIRCOLORS=true
    LS_C=ls
    RM_C=rm
    MV_C=mv
    CP_C=cp
    VI_C=vim
    XARGS_C=xargs
    BASH_COMP=/etc/bash_completion
    ;;
*)
    echo "I'm an unknown OS!: `uname -s`"
    ;;
esac

## then aliases for the things you've defined
alias ls="$LS_C --color=auto -Fh"
alias df="$DF_C"
alias mv="$MV_C -i"
alias ln="$LN_C"
alias tar="$TAR_C"
alias rm="$RM_C"
alias vi="$VI_C"
alias cp="$CP_C"
alias xargs="$XARGS_C"
