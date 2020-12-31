#!/usr/bin/env python3

import argparse
import os
import shutil
import logging as log
from pathlib import Path


log.basicConfig(format='%(levelname)s: %(message)s', level=log.INFO)


root_dir = os.path.dirname(__file__)
home = str(Path.home())



def cmd_exists(cmd):
    return shutil.which(cmd) is not None


def create_symlink(src, dst):
    if os.path.exists(src):
        log.info(f"{dst} -> {src}")
        if os.path.exists(dst):
            os.unlink(dst)
        os.symlink(src, dst)
    else:
        raise ValueError(f"{src} already exists")


def nvim():
    log.info('Configuring neovim')
    nvim_configs = 'neovim'
    nvim_configs_dst = f"{home}/.config/nvim"
    create_symlink(f"{root_dir}/{nvim_configs}", nvim_configs_dst)
    if cmd_exists('nvim'):
        vim_plug_url = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' 
        log.info('Installing vim-plug')
        os.system('curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs ' + vim_plug_url)
        log.info('Installing neovim plugins')
        os.system('nvim --headless +PlugInstall +qall')

def tmux():
    log.info('Configuring Tmux')
    if cmd_exists('tmux'):
        tmux_config = f"{home}/.tmux.conf"
        if os.path.exists(tmux_config):
            os.rename(tmux_config, tmux_config + '.old')
        create_symlink(f"{root_dir}/tmux/tmux.conf", f"{home}/.tmux.conf")
    else:
        log.error("Tmux is not on the PATH")


def git(editor='vim', email=None, user_name=None):
    log.info('Configuring git')
    git_properties = [
              ('core.editor', editor),
              ('user.email', email),
              ('user.name', user_name)
            ]
    if cmd_exists('git'):
        for property, value in git_properties:
            if value:
                os.system(f"git config --global {property} {value}")
    else:
        log.error("git is not on the PATH")


def configure():
    parser = argparse.ArgumentParser()
    parser.add_argument("--email", help="Git Email address")
    parser.add_argument("--editor", help="Git editor")
    parser.add_argument("--name", help="Git name")
    args = parser.parse_args()
    log.info('Configuration start')
    nvim()
    tmux()
    git(args.editor, args.email, args.name)


if __name__ == "__main__":
    try:
        configure()
    except Exception:
        log.exception("Failed to configure system")
