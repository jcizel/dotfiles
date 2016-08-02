# .bash_profile file
# By Balaji S. Srinivasan (balajis@stanford.edu)
#
# Concepts:
# http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html
#
#    1) .bashrc is the *non-login* config for bash, run in scripts and after
#        first connection.
#
#    2) .bash_profile is the *login* config for bash, launched upon first
#        connection (in Ubuntu)
#
#    3) .bash_profile imports .bashrc in our script, but not vice versa.
#
#    4) .bashrc imports .bashrc_custom in our script, which can be used to
#        override variables specified here.
#
# When using GNU screen:
#
#    1) .bash_profile is loaded the first time you login, and should be used
#       only for paths and environmental settings

#    2) .bashrc is loaded in each subsequent screen, and should be used for
#       aliases and things like writing to .bash_eternal_history (see below)
#
# Do 'man bashrc' for the long version or see here:
# http://en.wikipedia.org/wiki/Bash#Startup_scripts
#
# When Bash starts, it executes the commands in a variety of different scripts.
#
#   1) When Bash is invoked as an interactive login shell, it first reads
#      and executes commands from the file /etc/profile, if that file
#      exists. After reading that file, it looks for ~/.bash_profile,
#      ~/.bash_login, and ~/.profile, in that order, and reads and executes
#      commands from the first one that exists and is readable.
#
#   2) When a login shell exits, Bash reads and executes commands from the
#      file ~/.bash_logout, if it exists.
#
#   3) When an interactive shell that is not a login shell is started
#      (e.g. a GNU screen session), Bash reads and executes commands from
#      ~/.bashrc, if that file exists. This may be inhibited by using the
#      --norc option. The --rcfile file option will force Bash to read and
#      execute commands from file instead of ~/.bashrc.

## -----------------------
## -- 1) Import .bashrc --
## -----------------------

# Factor out all repeated profile initialization into .bashrc
#  - All non-login shell parameters go there
#  - All declarations repeated for each screen session go there
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# Configure PATH
#  - These are line by line so that you can kill one without affecting the others.
#  - Lowest priority first, highest priority last.
export PATH=$PATH
export PATH=$HOME/bin:$PATH
export PATH=/usr/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/heroku/bin:$PATH # Heroku: https://toolbelt.heroku.com/standalone
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# # enable 256 colors
# export TERM=xterm-256color


# Enable OpenBLAS multithreading (makes R run faster)
export OPENBLAS_NUM_THREADS=4
export OPENBLAS_MAIN_FREE=1	# Threading affinity --> turn it off, see https://groups.google.com/forum/#!topic/openblas-users/mr_prPqunZE

# CUDA Library (NVIDIA)
# See: http://docs.nvidia.com/cuda/cuda-getting-started-guide-for-mac-os-x/index.html
export PATH=/Developer/NVIDIA/CUDA-5.5/bin:$PATH
export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-5.5/lib:$DYLD_LIBRARY_PATH
export CUDA_HOME=/usr/local/cuda/
export LD_LIBRARY_PATH=/usr/local/cuda/lib:$LD_LIBRARY_PATH



# Add MySQL Paths for R compatibility
export PKG_CPPFLAGS="-I/usr/local/mysql/include"
export PKG_LIBS="-L/usr/local/mysql/lib/ -lmysqlclient"

export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH


# Necessary to find latex programs
export PATH=$PATH:/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin

# Find stata
export PATH=$PATH:/Applications/Stata/StataMP.app/Contents/MacOS

# Solve problems with loading fortran
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/Cellar/gcc/5.3.0/lib/gcc/5/
