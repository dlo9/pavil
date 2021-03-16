AUR:
  pkg.installed:
    - pkgs:
      - yay
  file.managed:
    - name: /home/david/.config/yay/config.json
    - user: david
    - group: david
    - makedirs: true
    - contents: |
        {
          "aururl": "https://aur.archlinux.org",
          "buildDir": "$HOME/.cache/yay",
          "editor": "",
          "editorflags": "",
          "makepkgbin": "makepkg",
          "makepkgconf": "",
          "pacmanbin": "pacman",
          "pacmanconf": "/etc/pacman.conf",
          "tarbin": "bsdtar",
          "redownload": "no",
          "rebuild": "no",
          "answerclean": "",
          "answerdiff": "",
          "answeredit": "",
          "answerupgrade": "",
          "gitbin": "git",
          "gpgbin": "gpg",
          "gpgflags": "",
          "mflags": "",
          "sortby": "votes",
          "gitflags": "",
          "removemake": "yes",
          "requestsplitn": 150,
          "sortmode": 0,
          "completionrefreshtime": 7,
          "sudoloop": true,
          "timeupdate": false,
          "devel": false,
          "cleanAfter": false,
          "gitclone": true,
          "provides": true,
          "pgpfetch": true,
          "upgrademenu": true,
          "cleanmenu": false,
          "diffmenu": false,
          "editmenu": false,
          "combinedupgrade": false,
          "useask": false
        }
AUR Dependencies:
  pkg.group_installed:
    - name: base-devel

# https://wiki.manjaro.org/index.php/Swap#Creating_and_Enabling_a_Static_Swapfile
Enable hibernation:
  cmd.run:
    - name: |
        sudo fallocate -l 16G /swapfile
        sudo mkswap /swapfile
        sudo chmod u=rw,go= /swapfile
        sudo swapon /swapfile
        echo "/swapfile none swap defaults 0 0" | tee -a /etc/fstab
    - creates:
      - /swapfile
