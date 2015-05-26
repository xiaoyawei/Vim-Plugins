# Vim-Plugin

The `Vim-Plugin` involves the configuration of vim for convenient C++ coding. It is mostly inspired by [Use vim as IDE](https://github.com/yangyangwithgnu/use_vim_as_ide) (author: [yangyangwithgnu](mailto: yangyangwithgnu@yeah.net)), which is written in *汉语*.

The `Vim-Plugin` is purely out of personlay use and held by github for convenient personal access. Of course, you are also welcome to check it for reference.

## Minimum Requirement

- `vim 7.4`
- `python 2.7`
- `clang 3.3`

## File List

The `vim-plugin` includes the follwing files/folders:

- `.vimrc`. The config for `vim`.
- `indexer_files`. The config for `indexer`. Each project's path info should be specified in `indexer_files`. This file should be placed at `~`.
- `.ycm_extra_conf.py`. The config for `YouCompleteMe`. You should adjust the `flag` part of it according to your project. This file should be placed at the root path of the project.
- `.vim`. All the necessary plugins as well as three color themes. The `YouCompleteMe` plugin needs further configuration.
- You may also want to check `~/.vim/bundle/ultisnips/mysnippets/cpp.snippets` to see the coding templates.
- `libstd.man.tar.bz2`. The manual for *Standard C++*. Extract the `man3` folder from it into `/usr/share/man/`.

## YouCompleteMe

The `YouCompleteMe` plugin primarily serves for smart completion and statical syntatics based on syntax analysis of your C++ codes. First you need to obtain the dependencies by

~~~
cd ~/.vim/bundle/YouCompleteMe/ 
git submodule update --init --recursive
~~~

After that, please download the latest `LLVM` from the [LLVM official website](http://llvm.org/releases/download.html) and extract it into `~/Downloads/clang+llvm`. Then compile the shared libraries of `YouCompleteMe` by

~~~
cd ~/Downloads/
mkdir ycm_build 
cd ycm_build 
cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=~/Downloads/clang+llvm/ . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
make ycm_support_libs
~~~

You need `cmake` to execute the above scripts.

## Other Info

### A Minor Issue

In `.vimrc`, the `ctags` of *C++ Standard Library* is included by

~~~
set tags+=/usr/include/c++/4.8/stdcpp.tags
~~~

In `.ycm_extra_conf.py`, the `flag` list also contains `'/usr/include/c++/4.8/'`. Please replace them based on the path of your own *C++ Standard Library*.

### Usage

This document actually serves as a personal reminder of vim configuration for myself. Please check [Use vim as IDE](https://github.com/yangyangwithgnu/use_vim_as_ide) about all the functions for convenient C++ coding. If you cannot read Chinese but are eager to learn about it, please consult your Chinese colleagues or pick up some Chinese first :)