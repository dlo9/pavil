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

# https://wiki.manjaro.org/index.php/Swap#Creating_and_Enabling_a_Swap_Partition
{% import 'lib/swap.sls' as swap with context %}
{{ swap.enable_swap_partition('/dev/sda3') }}