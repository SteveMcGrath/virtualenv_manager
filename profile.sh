# This is a shim to allow for multiple profile script to exist in the
# user's home.  All of the shell scripts in ~/.profile_scripts will
# be loaded into the user's environment.
for SCRIPT_NAME in $(ls $HOME/.profile_scripts/*.sh);do
    source $SCRIPT_NAME
done
unset SCRIPT_NAME