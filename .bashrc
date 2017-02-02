# .bashrc

# User specific aliases and functions

#alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

#修改vim
alias rm=TrashSth
alias r=TrashSth
alias rls='ls /data/My_trash'
alias urm=undel
alias cleartrash=ClearTrash
TrashSth()
{
    mv $@ /data/My_trash
}
undel()
{
    mv -i /data/My_trash/$@ ./
}
ClearTrash()
{
     read -p "clear sure?[y/n]" confirm
     [ $confirm == 'y' ] || [ $confirm == 'Y' ] && /bin/rm -rf /data/My_trash/*
}
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
