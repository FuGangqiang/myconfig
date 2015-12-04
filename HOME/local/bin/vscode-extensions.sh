#!/bin/sh

extension_fpath=~/Backup/Git/myconfig/HOME/config/Code/extensions.sh

case "$1" in
    list)
        code --list-extensions
    ;;
    install)
        sh $extension_fpath
        ;;
    save)
        code --list-extensions | xargs -L 1 echo code --install-extension > $extension_fpath
        ;;
    cat)
        cat $extension_fpath
    ;;
    clean)
        rm -rf ~/.vscode-oss/extensions
        ;;
    *)
        echo $"Usage: $0 {list|install|save|cat|clean}"
        exit 1
esac
