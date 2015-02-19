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

## Listing files

### ...with human-readable sizes

    alias lh='ll -h'

### ...with human-readable sizes and reverse-sorted by modification time

    alias lhtr="ls -lhtr"

## Networking

### speedtest

    alias speedtest="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip"

### get your machine's IP address

    alias ipconfig="sudo ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | cut -d\  -f1"

### host a simple local server from current working dir

    alias pyserve="python -m SimpleHTTPServer"
