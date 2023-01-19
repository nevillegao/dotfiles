#!/bin/bash

create_link() {
    SRC_ITEM=$1
    DEST_ITEM=${2:-.$SRC_ITEM}
    DEST_DIR=${3:-$HOME}

    rm -rf "${DEST_DIR}/${DEST_ITEM}"
    ln -sf "${PWD}/${SRC_ITEM}" "${DEST_DIR}/${DEST_ITEM}"

    chmod -R go-rwx "${SRC_ITEM}"
}

install() {
    if [[ "${SHELL}" =~ "bash" ]]; then
        SHELL_EXCLUDE=(
            "zsh.d"
            "zprofile"
        )
    elif [[ "${SHELL}" =~ "zsh" ]]; then
        SHELL_EXCLUDE=(
            "bash.d"
            "bashrc"
            "bash_logout"
            "profile"
            "inputrc"
            "git-prompt-colors.sh"
        )

        OMZ_HOME="${HOME}/.oh-my-zsh"
    fi

    eval 'EXCLUDE=($(cat install.exclude) ${SHELL_EXCLUDE[@]})'

    for i in *; do
        if [[ "${EXCLUDE[@]}" =~ "${i}" ]]; then
            continue
        fi

        if [[ "${i}" == "zsh.d" && -d "${OMZ_HOME}" ]]; then
            OMZ_CUSTOM="${OMZ_HOME}/custom"
            if [[ ! -d "${OMZ_CUSTOM}" ]]; then
                rm -rf "${OMZ_CUSTOM}"
                mkdir "${OMZ_CUSTOM}"
            fi

            for j in "${i}"/*; do
                create_link "${j}" ${j#*/} "${HOME}/.oh-my-zsh/custom"
            done

            continue
        fi

        if [[ "${i}" == "ssh" || "${i}" == "config" ]]; then
            if [[ ! -d "${HOME}/.${i}" ]]; then
                rm -rf "${HOME}/.${i}"
                mkdir "${HOME}/.${i}"
            fi

            for j in "${i}"/*; do
                create_link "${j}"
            done
        else
            create_link "${i}"
        fi
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
        curl -sSLo "${script_dir}/${i}" "https://raw.githubusercontent.com/irssi/scripts.irssi.org/master/scripts/${i}"
        (cd "${script_dir}/autorun" && ln -sf "../${i}")
    done
}


install
vim_plugins
# weechat_plugins
# irssi_plugins
