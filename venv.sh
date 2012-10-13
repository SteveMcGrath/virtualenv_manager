# VirtualEnv Management shim for Python.  This function is designed
# to make creating, activating, and switching between virtualenvs as
# simple as possible.
function venv {
    ACTION=$1
    OPTION=$2
    VENV_BASE=$HOME/.virtualenvs

    # If there isnt a .virtualenvs folder, then we will create one
    # here.  This will be the entry point where all virtualenvs are
    # built.
    if [ ! -d $VENV_BASE ];then
        mkdir -p $VENV_BASE
    fi

    case $ACTION in
        create)
            virtualenv $VENV_BASE/$OPTION
            ;;
        activate)
            source $VENV_BASE/$OPTION/bin/activate
            ;;
        switch)
            deactivate
            source $VENV_BASE/$OPTION/bin/activate
            ;;
        delete)
            deactivate
            rm -rf $VENV_BASE/$OPTION
            ;;
        list)
            ls $VENV_BASE
            ;;
        *)
            echo "Looking for help?"
            echo -e "Options are \033[36mcreate\033[0m, \033[36mactivate\033[0m, \033[36mswitch\033[0m, \033[36mdelete\033[0m, and \033[36mlist\033[0m"
            echo "deactivate will let you leave the virtualenv"    
    esac    
}