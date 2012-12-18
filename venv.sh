# VirtualEnv Management shim for Python.  This function is designed
# to make creating, activating, and switching between virtualenvs as
# simple as possible.
function venv {
    local action option venv_base
    action=$1
    option=$2
    venv_base=$HOME/.virtualenvs

    # If there isnt a .virtualenvs folder, then we will create one
    # here.  This will be the entry point where all virtualenvs are
    # built.
    if [ ! -d $venv_base ];then
        mkdir -p $venv_base
    fi

    case $action in
        create)
            virtualenv $venv_base/$option
            ;;
        activate)
            source $venv_base/$option/bin/activate
            ;;
        switch)
            deactivate
            source $venv_base/$option/bin/activate
            ;;
        delete)
            deactivate
            rm -rf $venv_base/$option
            ;;
        list)
            ls $venv_base
            ;;
        deactivate)
            deactivate
            ;;
        *)
            echo 'venv [action] [option]'
            echo ''
            echo '    Python Virtual Environment Management Tool'
            echo '-----------------------------------------------------'
            echo ''
            echo 'create        Creates a new Python VirtualEnv'
            echo 'activate      Activates the specified venv'
            echo 'switch        Switched from one VirtualEnv to another'
            echo 'deactivate    Deactivates the current VirtualEnv'
            echo 'delete        Deletes the specified VirtualEnv'
            echo 'list          List the available VirtualEnvs'
            ;;
    esac
}

function _venv {
    local venv_base venv_list venv_opts cur prev
    venv_base=$HOME/.virtualenvs
    venv_list=$(ls $venv_base)
    venv_opts="create activate switch delete list deactivate"
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    # If there isnt a .virtualenvs folder, then we will create one
    # here.  This will be the entry point where all virtualenvs are
    # built.
    if [ ! -d $venv_base ];then
        mkdir -p $venv_base
    fi

    case $prev in
        activate)
            COMPREPLY=($(compgen -W "$venv_list" -- $cur))
            return 0
            ;;
        switch)
            COMPREPLY=($(compgen -W "$venv_list" -- $cur))
            return 0
            ;;
        delete)
            COMPREPLY=($(compgen -W "$venv_list" -- $cur))
            return 0
            ;;
        *)
        ;;
    esac
    COMPREPLY=($(compgen -W "$venv_opts" -- $cur))
    return 0
}
complete -F _venv venv