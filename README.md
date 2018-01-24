# VIM repo cloner

A simple utility to help me setup my vim setup whenever I install it on a new machine.

I use pathogen to install my Vim plugins and, for virtually all of them, the code is on GitHub. The problem is that everytime I install Vim on a new computer, I need to remember, find and clone all these repositories. _These utilities solve that_.

Here's what you can do:

 * __getting a list of repos__: _get_repos.sh_ will list all your repos. Use it to create a list of all the plugins you are using.
 * __updating your repos__:  _pull_repos.sh_ will update all your plugins. The argument is the bundle directory.
 * __reinstalling all your repos__: _clone_repos.sh_ clones the repos listed in a file (which it takes as an argument).

This is useful to me, and I put it up here because it might be useful to you too.

_repo_list.txt_ is __my__ list of plugins and _.vimrc_ is __my__ .vimrc, so that I have some backups :)




