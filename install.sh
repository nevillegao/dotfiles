#!/bin/bash

create_link() {
    rm -rf "${HOME}/.${1}"
    ln -sf "${PWD}/${1}" "${HOME}/.${1}"

    chmod -R go-rwx "${1}"
}

install() {
    eval 'EXCLUDE=($(cat install.exclude))'

    for i in *; do
        if [[ "${EXCLUDE[@]}" =~ "${i}" ]]; then
            continue
        fi

        if [[ "${i}" == "ssh" || "${i}" == "config" ]]; then
            if [[ ! -d "${HOME}/.${i}" ]]; then
                rm -rf "${HOME}/.${i}"
                mkdir "${HOME}/.${i}"
            fi

            for j in ${i}/*; do
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
