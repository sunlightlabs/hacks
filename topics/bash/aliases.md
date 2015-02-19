# Helpful Bash Aliases

## Edit a random entry in the CWD

    alias vimr='vim "`ls | shuf -n1`"'

## Set up an `__init__.py` for your project

    function pin {                                                                   
        if [ "x$1" = "x" ]; then                                                     
            DIR="./"                                                                 
        else                                                                         
            DIR="$1"                                                                 
        fi                                                                           
        touch ${DIR}/__init__.py                                                     
    }                                                                                

Usage:

`pin foo` to create `foo/__init__.py`

## HTTP Headers

    alias headers='curl -D- -o /dev/null'

