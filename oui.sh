PROMPT_COMMAND=__prompt_command
# PATH="/mingw64/bin:/usr/bin:/c/Users/Enzo/bin:/c/Program Files (x86)/Common Files/Oracle/Java/javapath:/c/WINDOWS/system32:/c/WINDOWS:/c/WINDOWS/System32/Wbem:/c/WINDOWS/System32/WindowsPowerShell/v1.0:/c/WINDOWS/System32/OpenSSH:/c/ProgramData/chocolatey/bin:/cmd:/c/Program Files/TortoiseGit/bin:/c/Program Files/Microsoft VS Code/bin:/c/tools/python:/c/Program Files/nodejs:/c/Program Files/Microsoft/Web Platform Installer:/c/Program Files (x86)/GNU/GnuPG/pub:/c/Program Files/dotnet:/c/Program Files (x86)/Microsoft SQL Server/140/Tools/Binn:/c/Program Files/Microsoft SQL Server/140/Tools/Binn:/c/Program Files (x86)/Microsoft SQL Server/140/DTS/Binn:/c/Program Files/Microsoft SQL Server/140/DTS/Binn:/c/Program Files/Microsoft SQL Server/Client SDK/ODBC/130/Tools/Binn:/c/Program Files (x86)/Microsoft SQL Server/150/DTS/Binn:/c/Program Files/Microsoft SQL Server/130/Tools/Binn:/c/Program Files (x86)/dotnet:/c/Program Files/Microsoft SQL Server/Client SDK/ODBC/170/Tools/Binn:/c/Users/Enzo/AppData/Local/Programs/Python/Python38/Scripts:/c/Users/Enzo/AppData/Local/Programs/Python/Python38:/c/Users/Enzo/AppData/Local/Microsoft/WindowsApps:/c/Program Files/kdiff3:/c/Users/Enzo/AppData/Roaming/npm:/c/Users/Enzo/.dotnet/tools:/c/Users/Enzo/AppData/Local/GitHubDesktop/bin:/c/Users/Enzo/AppData/Local/Microsoft/WindowsApps:/c/Users/Enzo/scripts:/c/tools/python"

actualzoom=`cat C:/Users/Enzo/scripts/data/zoom_data`
heure=`cat C:/Users/Enzo/scripts/data/heure`
path=`cat C:/Users/Enzo/scripts/data/path`
branch=`cat C:/Users/Enzo/scripts/data/branch`
sexit=`cat C:/Users/Enzo/scripts/data/sexit`
cpath=`cat C:/Users/Enzo/scripts/data/cpath`
cbranch=`cat C:/Users/Enzo/scripts/data/cbranch`
cheure=`cat C:/Users/Enzo/scripts/data/cheure`
CDPATH=.:~:~/src:~/Projects:~d/User/Enzo/Projects:d/User/Enzo/Epitech:d/User/Enzo
shopt -s cdspell
complete -d cd
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

## PS1 ##

__prompt_command() {
    local EXIT="$?"
    PS1=""

# Ajout du retour du dernier executable lancé
    if [ "$sexit" == "1" ]; then
        if [ $EXIT != 0 ]; then
            PS1+="\e[31m\$?"
        else
            PS1+="\e[32m\$?"
        fi
    fi

# Ajout de l'heure dans le PS1
    if [ "$heure" == "1" ]; then
        PS1+=" \e[39m- $cheure$(date +'%H:%M:%S')"
    fi

# Ajout du path actuel dans le PS1
    if [ "$path" == "1" ]; then
        PS1+=" \e[39m- $cpath\w"
    fi

# Ajout du nom de la branche git dans le PS1
    if [ "$branch" == "1" ]; then
        PS1+=" \e[39m- $cbranch$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')"
    fi

# Ajout du > bleu puis écriture normale
    PS1+=" \e[34m>"

# Ajout d'un espace et retour à une écriture normale
    PS1+=" \e[39m"
}

# change le ps1 avec des toggles

update() {
    if [ -z "$1" ]; then
        echo "Veuillez mettre un paramètre : update -h"
        return 1
    fi
    if [ "$1" == "info" ] || [ "$1" == "-h" ] || [ "$2" == "info" ] || [ "$2" == "-h" ]; then
        echo "1         :   activé / true
"
        echo "branch    :   $branch"
        echo "sexit     :   $sexit"
        echo "path      :   $path"
        echo "heure     :   $heure"
        echo ""
        echo "Liste des couleurs possible en argument :"
        echo -e "- \e[39mDefault\e[39m"
        echo -e "- \e[30mBlack\e[39m"
        echo -e "- \e[31mRed\e[39m"
        echo -e "- \e[32mGreen\e[39m"
        echo -e "- \e[33mYellow\e[39m"
        echo -e "- \e[34mBlue\e[39m"
        echo -e "- \e[35mMagenta\e[39m"
        echo -e "- \e[36mCyan\e[39m"
        echo -e "- \e[37mGray\e[39m"
        return 0
    fi
    if [ ! -z "$2" ]; then
        colorps $1 $2
        source C:/Users/Enzo/.bashrc
        clear
        return 0
    fi
    if [ "$1" == "all" ]; then
        echo "1" > C:/Users/Enzo/scripts/data/sexit
        echo "1" > C:/Users/Enzo/scripts/data/branch
        echo "1" > C:/Users/Enzo/scripts/data/path
        echo "1" > C:/Users/Enzo/scripts/data/heure
        heure=`cat C:/Users/Enzo/scripts/data/heure`
        path=`cat C:/Users/Enzo/scripts/data/path`
        branch=`cat C:/Users/Enzo/scripts/data/branch`
        sexit=`cat C:/Users/Enzo/scripts/data/sexit`
    fi
    if [ "$1" == "none" ]; then
        echo "0" > C:/Users/Enzo/scripts/data/sexit
        echo "0" > C:/Users/Enzo/scripts/data/branch
        echo "0" > C:/Users/Enzo/scripts/data/path
        echo "0" > C:/Users/Enzo/scripts/data/heure
        heure=`cat C:/Users/Enzo/scripts/data/heure`
        path=`cat C:/Users/Enzo/scripts/data/path`
        branch=`cat C:/Users/Enzo/scripts/data/branch`
        sexit=`cat C:/Users/Enzo/scripts/data/sexit`
    fi
    if [ "$1" == "sexit" ]; then
        if [ "$sexit" == "0" ];then
            sexit="1"
        else
            sexit="0"
        fi
    fi
    if [ "$1" == "path" ]; then
        if [ "$path" == "0" ];then
            path="1"
        else
            path="0"
        fi
    fi
    if [ "$1" == "heure" ]; then
        if [ "$heure" == "0" ];then
            heure="1"
        else
            heure="0"
        fi
    fi
    if [ "$1" == "branch" ]; then
        if [ "$branch" == "0" ];then
            branch="1"
        else
            branch="0"
        fi
    fi
    echo "$sexit" > C:/Users/Enzo/scripts/data/sexit
    echo "$branch" > C:/Users/Enzo/scripts/data/branch
    echo "$path" > C:/Users/Enzo/scripts/data/path
    echo "$heure" > C:/Users/Enzo/scripts/data/heure
}

alias heure="update heure"
alias branch="update branch"
alias sexit="update sexit"
alias path="update path"
alias all="update all"
alias none="update none"
alias psinfo="update info"

# donne le nom de la branch actuel

br() {
    # echo -e "\e[32m"
    echo -e "\e[33m$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')"
}

## ALIAS GENERIQUES ##

alias c="clear"
alias oc="c ||"
alias lsc="clear && ls"
alias cls="lsc"
alias csl="lsc"
alias lcs="lsc"
alias slc="lsc"
alias scl="lsc"
alias clsf="c && lsf"

alias sb="source C:/Users/Enzo/.bashrc"
alias cb="code C:/Users/Enzo/.bashrc && rb"

alias e="c || "

alias tree="tree1 ."

## CD DIR ##
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"

alias proj="cd D:/Users/Enzo/Projects"
alias cproj="code D:/Users/Enzo/Projects"

alias epi="cd D:/Users/Enzo/Epitech"
alias cepi="code D:/Users/Enzo/Epitech"

alias pop="cd C:/Sites/Lucca/static/poplee"
alias cpop="code C:/Sites/Lucca/static/poplee"

alias back="cd C:/Sites/Poplee.Talent/back"
alias cback="code C:/Sites/Poplee.Talent/back"

alias front="cd C:/Sites/Poplee.Talent/front"
alias cfront="code C:/Sites/Poplee.Talent/front"

alias qa="cd C:/Sites/DevOps/QA/netcore/PopleeTalent"
alias cqa="code C:/Sites/DevOps/QA/netcore/PopleeTalent"

alias lu="cd C:/Sites/Lucca"
alias clu="code C:/Sites/Lucca"

alias pp="cd C:/Sites/Lucca/static/paymonitor"

alias txt="code \"C:\Users\Enzo\Desktop\save au cas ou.txt\""

## COMMANDES UTILES ##

alias ls="ls --color=always"

alias list="find . -print | grep -i"
alias ns="front && ng serve"
alias ba="front && npm run build && back && dotnet build"
alias ra="back && rc && dotnet restore && ba"
alias ltl="lucca translate lokalise"
alias npmperdu="npm install && npm start"

## GIT ##

alias gs="git status"
alias gp="git pull"
alias rc="git checkout rc && gp"
alias master="git checkout master && gp"
alias gc="rc && git checkout -b"
alias gd="git diff-tree --no-commit-id --name-only -r"

## SCRIPT / FONCTIONS ##

# zoom le vs ou dezoom

zoom() {
    nextzoom="$1"
    if [ "$actualzoom" == "0" ] && [ "$1" == "-" ]; then
        echo "Dezoom impossible, vous etes au minimum (0)"
        return 1
    fi
    if [ -z "$1" ]; then
        echo "Veuillez mettre un argument"
        return 1
    fi
    if [ "$1" == "+" ]; then
        nextzoom=""
        nextzoom=$[$actualzoom+1]
    fi
    if [ "$1" == "-" ]; then
        nextzoom=""
        nextzoom=$[$actualzoom-1]
    fi
    local path="C:/Users/Enzo/AppData/Roaming/Code/User/settings.json"
    local file=`cat $path`
    local string="\"window.zoomLevel\": 0.$nextzoom,"
    echo "${file//"\"window.zoomLevel\": 0.$actualzoom,"/$string}" > C:/Users/Enzo/AppData/Roaming/Code/User/settings.json
    actualzoom=$nextzoom
    echo "$actualzoom" > "C:/Users/Enzo/scripts/data/zoom_data"
    echo "Zoom actuel: $nextzoom"
}

alias scripts="script"
alias sc="script"
alias sl="script"
alias scriptlist="script"

# affiche les fichiers modifs du dernier commit

gdl() {
    if [ "$1" == "-h" ]; then
        echo "\
UTILISATION :
    gdl
    
DESCRIPTION :
    gdl affiche les fichiers modifiés du dernier commit"
        return 0
    fi
    local isgit=$(git rev-parse --is-inside-work-tree)
    if [ "$isgit" != "true" ]; then
        return 1
    fi
    gd $(git rev-parse --verify HEAD)
}

# Source auto du bashrc pour appliquer les changements dès la sauvegarde du fichier

reloadb() {
    if [ "$1" == "-h" ]; then
        echo "\
UTILISATION :
    reloadb
    rb
    cb (permet d'ouvrir le .bashrc de n'importe ou et de lancer le reload auto)
    
DESCRIPTION :
    Reloadb fait un source du .bashrc dès que votre .bashrc est sauvegardé avec des modifications"
        return 0
    fi

    local file=`cat C:/Users/Enzo/.bashrc`
    local save=`cat C:/Users/Enzo/.bashrc`
    local exit="0"

    echo -e "\e[39mLancement du reload auto du bashrc :"
    printf "\n"
    echo -e "\e[34mPour quitter appuyez sur la touche\e[31m q\e[39m"
    printf "\n"
    while [ "$exit" == "0" ]
    do
        file=`cat C:/Users/Enzo/.bashrc`
        if [ "$file" != "$save" ]; then
            save=`cat C:/Users/Enzo/.bashrc`
            source C:/Users/Enzo/.bashrc
        fi
        IFS= read -r -t 0.5 -n 1 -s key && var="key"
        if [ "$key" == "q" ]; then
            return 0
        fi
    done
}

alias rb="reloadb"

# On donne le nom d'un fichier, la fonction va chercher ce fichier,
# et faire un cd dans le directory du cd si il n'y en a qu'un, sinon ça liste les possibilités

findarg() {
    if [ "$1" == "-h" ]; then
        echo "\
UTILISATION :
    findarg [Nom du fichier]
    j [Nom du fichier]

    j est un racourci de findarg
    
    -h  Aide
    -o  Ouvre tous les fichier avec ce nom 

DESCRIPTION :
    La fonction demande le nom d'un fichier en argument pour aller dans le dossier de ce fichier
    Elle va chercher le nom du fichier dans le dossier et sous dossiers actuel
    Si il y a aucune ou plusieurs possibilités cela va le montrer"
        return 0
    fi

    local red='\e[1;31m'
    local nor='\e[1;39m'
    local found_dir=""

    if [ "$1" != "-o" ]; then
        found_dir=$(dirname $(find . -print | grep -i $1))
    else
        found_dir=$(find . -print | grep -i $2 | grep -v .png)
    fi
    if [ -z "$found_dir" ]; then
        echo -e "${red}Aucun fichier avec ${nor}\"$1\" ${red}dans son nom n'est présent dans ce dossier et ses sous dossiers :/"
    else
        if [ "$1" == "-o" ]; then
            code $(find . -print | grep -i $2 | grep -v .png)
        else
            cd $found_dir
        fi
        if [ $? == 1 ]; then
            echo -e "${red}Il y a trop de fichiers comportant ce nom, voici la liste des fichiers ayant ${nor}\"$1\" ${red}dans leur nom :${nor}"
            find . -print | egrep -i --color=always "$1"
        fi
    fi
}

alias j="findarg"
alias oj="findarg -o"

# Add / commit et push tous les fichiers modifiés

addcompush() {
    if [ "$1" == "-h" ]; then
        echo "\
UTILISATION :
    addcompush [Nom du commit]
    pa [Nom du commit]

    pa est un alias de addcompush

DESCRIPTION :
    Addcommpush permet de add, commit et push tous les fichiers modifiés, avec un message si mit en argument"
        return 0
    fi
    local red='\e[1;31m'
    local nor='\e[1;39m'
    local key=""

    echo -e "${red}Etes vous sûr de vouloir push tous ces fichiers ?${nor}"
    git status
    echo -e "${red}Avec le message : ${nor}
    $1
    [O/N]
"
    while true; do
        read -rsn1 key
        echo "${key}"
        if [ "$key" == "o" ] || [ "$key" == "O" ]; then
            echo "push ahah"
            git add .
            git commit -m "$1"
            git push
            return 0
        else
            return 0
        fi
    done
    return 0
}

alias pa="addcompush"

# donne l'heure et s'actualise, press q to quit

d() {
    if [ "$1" == "-h" ]; then
        echo "\
UTILISATION :
    d
    
DESCRIPTION :
    d Affiche l'heure de votre pc
    /!\ La fonction banner et indispensable pour faire fonctionner ce script"
        return 0
    fi
    local exit="0"
    local save="$(date +'%H:%M:%S')"

    while [ "$exit" == "0" ]
    do
        if [ "$save" != "$(date +'%H:%M:%S')" ]; then
            clear
            banner "$(date +'%H:%M:%S')"
            save="$(date +'%H:%M:%S')"
        fi
    IFS= read -r -t 0.01 -n 1 -s key && var="key"
        if [ "$key" == "q" ]; then
            return 0
        fi
    done
}

# git pull de rc et master puis reviens sur la branche active

rl() {
    if [ "$1" == "-h" ]; then
        echo "\
UTILISATION :
    rl
    
DESCRIPTION :
    Rl fait un git pull de rc et master puis reviens sur la branche active"
        return 0
    fi
    local branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
    rc
    local EXIT="$?"
    if [ "$EXIT" != "0" ]; then
        return 1
    fi
    master
    EXIT="$?"
    if [ "$EXIT" != "0" ]; then
        return 1
    fi
    git checkout "$branch"
    EXIT="$?"
    if [ "$EXIT" != "0" ]; then
        return 1
    fi
}

# Affiche les fichiers modifié sur la branche active

fm() {
    if [ "$1" == "-h" ]; then
        echo "\
UTILISATION :
    fm
    
DESCRIPTION :
    Fm Affiche les fichiers modifié sur la branche active par rapport a rc suivant les commits"
        return 0
    fi
    local branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
    local c1=$(git rev-list --simplify-by-decoration -1 HEAD)
    local c2=$(git log master..$branch --oneline | tail -1)
    c2="$( cut -d ' ' -f 1 <<< "$c2" )"
    c2="$(git log --pretty=%P -n 1 $c2)"
    git log --decorate --pretty=oneline --reverse --name-status "$c2".."$c1"
}

## MESSAGE POUR LE RELOAD ##

echo -e "\e[32m.bashrc reloaded ! - \e[34m`date`\e[39m"
