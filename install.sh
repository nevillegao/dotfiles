#!/usr/bin/env bash

install() {
    for i in *; do
        if [[ "${i}" == $(basename $0) ]]; then
            continue
        fi

        if [[ "${i}" == "ssh_config" ]]; then
            if [[ ! -d "${HOME}/.ssh" ]]; then
                rm -rf "${HOME}/.ssh"
                mkdir "${HOME}/.ssh"
            fi

            rm -rf "${HOME}/.ssh/config"
            ln -sf "${PWD}/${i}" "${HOME}/.ssh/config"
        else
            rm -rf "${HOME}/.${i}"
            ln -sf "${PWD}/${i}" "${HOME}/.${i}"
        fi

        chmod -R go-rwx "${i}"
    done
}

vim_plugins() {
    # Clean up
    info_dir="${HOME}/.vim"
    if [[ ! -d "${info_dir}" ]]; then
        rm -rf "${info_dir}"
    fi
    mkdir -p "${info_dir}/undo"

    # Install 'vim-plug'
    curl -fLo "${info_dir}/autoload/plug.vim" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    # Install plugins
    vim -i NONE +PlugInstall +qall
}

weechat_plugins() {
    # Clean up
    declare -A dir=(["pl"]="perl")
    for i in ${!dir[@]}; do
        script_dir="weechat/${dir[$i]}"
        rm -rf "${script_dir}"
        mkdir -p "${script_dir}/autoload"
    done

    declare -a weechat_plugins=(buffers.pl beep.pl)
    for i in ${weechat_plugins[@]}; do
        ext=${i##*.}
        script_dir="weechat/${dir[${ext}]}"
        curl -sSLo "${script_dir}/${i}" "https://weechat.org/files/scripts/${i}"
        (cd "${script_dir}/autoload" && ln -sf "../${i}")
    done
}

irssi_plugins() {
    # Clean up
    script_dir="irssi/scripts"
    rm -rf "${script_dir}"
    mkdir -p "${script_dir}/autorun"

    declare -a irssi_plugins=(nickcolor.pl)
    for i in ${irssi_plugins[@]}; do
        svn export "https://github.com/irssi/scripts.irssi.org.git/trunk/scripts/${i}" "${script_dir}/${i}"
        (cd "${script_dir}/autorun" && ln -sf "../${i}")
    done
}

install
vim_plugins
# weechat_plugins
# irssi_plugins
