# sudo aliases
## i do a lot of things as root . these are convience aliases so that i don't type "sudo" every time i want to do something as root . 

```bash
# Hopefully this will make sudo sane.

# utility commands
alias sucp="sudo cp -i"
alias schgrp="sudo chgrp"
alias schmod="sudo chmod"
alias schown="sudo chown"
alias sln="sudo ln"
alias smkdir="sudo mkdir"
alias srmdir="sudo rmdir"
alias smv="sudo mv -i"
alias srm="sudo rm -i"
alias scat="sudo cat"
alias stouch="sudo touch"

# development
alias scvs="sudo cvs"
alias smake="sudo make"
alias star="sudo tar"
alias svi="sudo vim"

# system stuff
alias sapt\-get="sudo apt-get"
alias saptitude="sudo aptitude"
alias syum="sudo yum"
alias srpm="sudo rpm"
alias sdpkg="sudo dpkg"
alias sport="sudo port"
alias spkgadd="sudo pkgadd"
alias fix\-journal="sudo e2fsck -fy /dev/hda2"
alias sminicom="sudo minicom"
alias smount="sudo mount"
alias sumount="sudo umount"
alias skill="sudo kill"
alias skillall="sudo killall"
alias reboot="sudo reboot"
alias halt="sudo halt"
alias poweroff="sudo poweroff"

# networking things
alias sifconfig="sudo ifconfig"
alias dhclient="sudo dhclient"
alias tcpdump="sudo tcpdump"
alias ethereal="sudo ethereal"
alias snmap="sudo nmap"
alias mtr="sudo mtr"
#alias kismet="sudo kismet"

# deal w/ kernel
alias lilo="sudo lilo"
alias modprobe="sudo modprobe"
alias insmod="sudo insmod"
alias rmmod="sudo rmmod"

cdmkdir () {
    mkdir "$*";
    cd "$*";
}

    if [ $SHELL = "/bin/bash" ]
    then
        if [ -f $BASH_COMP ]
        then
            source $BASH_COMP
            # completion
            complete -f -X '!*.@(c|cpp|c++)'            fmake
            complete -F _ssh                                            scrssh
            complete -F _ssh                                            suitcase
            complete -F _apt_get        $filenames              sapt-get
            complete -F _longopt        $filenames              scat
            complete -F _chgrp          $default                schgrp
            complete -F _chown          $default                schown
            complete -F _longopt        $filenames              sucp
            complete -F _cvs            $default                scvs
            complete -F _dpkg           $filenames              sdpkg
            complete -F _ifconfig                                       sifconfig
            complete -F _kill                                           skill
            complete -F _killall                                        skillall
            complete -F _make -X '+($*|*.[cho])' $filenames smake
            complete -F _mount          $default                smount
            complete -F _longopt        $filenames              smv
            complete -F _longopt        $filenames              srm
            complete -F _rpm            $filenames              srpm
            complete -F _tar            $filenames              star
            complete -f -X '*.@(o|so|so.*|a|tar|?(t)gz|?(t)bz2|rpm|zip|ZIP|gif|GIF|jp?(e)g|JP?(E)G|mp3|MP3|mpg|MPG|avi|AVI|asf|ASF' svi
            complete -F _umount         $dirnames               sumount
        fi
    fi
    unset BASH_COMP
```
