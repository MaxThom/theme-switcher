#!/bin/bash
__0_light_theme="org.manjaro.breath-light.desktop";
__1_dark_theme="org.manjaro.breath-dark.desktop";
__2_current_theme="";
__3_folderpath="";
__4_config_filepath="";
function key_exist__0_v0 {
    local t=$1
    grep -q "^${t}=" ${__4_config_filepath}
__AMBER_STATUS=$?;
if [ $__AMBER_STATUS != 0 ]; then
        __AMBER_FUN_key_exist0_v0=0;
        return 0
fi;
    __AMBER_FUN_key_exist0_v0=1;
    return 0
};
function find_config_location__1_v0 {
    __AMBER_VAL_0=$(echo $XDG_CONFIG_HOME);
    __AMBER_STATUS=$?;
if [ $__AMBER_STATUS != 0 ]; then
        echo "error retrieving $XDG_CONFIG_HOME"
fi;
    local xdg_cfg="${__AMBER_VAL_0}";
    if [ $([ "_${xdg_cfg}" != "_" ]; echo $?) != 0 ]; then
        __AMBER_VAL_1=$(echo $HOME);
        __AMBER_STATUS=$?;
if [ $__AMBER_STATUS != 0 ]; then
            echo "error retrieving $HOME$";
            __AMBER_FUN_find_config_location1_v0='';
            return 1
fi;
        local home="${__AMBER_VAL_1}";
        __3_folderpath="${home}""/.config";
        __4_config_filepath="${__3_folderpath}""/theme-switcher.conf"
else
        __3_folderpath="${xdg_cfg}";
        __4_config_filepath="${__3_folderpath}""/theme-switcher.conf"
fi
};
function reconcile_config__2_v0 {
    [ -f "${__4_config_filepath}" ]
__AMBER_STATUS=$?;
if [ $__AMBER_STATUS != 0 ]; then
        echo "creating config file ${__4_config_filepath}";
        mkdir -p "${__3_folderpath}"
__AMBER_STATUS=$?;
if [ $__AMBER_STATUS != 0 ]; then
            echo "error creating folder ${__3_folderpath}"
fi;
        touch "${__4_config_filepath}"
__AMBER_STATUS=$?;
if [ $__AMBER_STATUS != 0 ]; then
            echo "error creating ${__4_config_filepath}"
fi;
        echo "light-theme=" > "${__4_config_filepath}"
__AMBER_STATUS=$?;
if [ $__AMBER_STATUS != 0 ]; then
            echo "error putting content in config file"
fi;
        echo "dark-theme=" >> "${__4_config_filepath}"
__AMBER_STATUS=$?;
if [ $__AMBER_STATUS != 0 ]; then
            echo "error putting content in config file"
fi
fi;
    key_exist__0_v0 "light-theme";
    __AMBER_FUN_key_exist0_v0__69=${__AMBER_FUN_key_exist0_v0};
    if [ ${__AMBER_FUN_key_exist0_v0__69} != 0 ]; then
:
else
        echo "light-theme=" >> "${__4_config_filepath}"
__AMBER_STATUS=$?;
if [ $__AMBER_STATUS != 0 ]; then
            echo "error putting content in config file"
fi
fi;
    key_exist__0_v0 "dark-theme";
    __AMBER_FUN_key_exist0_v0__77=${__AMBER_FUN_key_exist0_v0};
    if [ ${__AMBER_FUN_key_exist0_v0__77} != 0 ]; then
:
else
        echo "dark-theme=" >> "${__4_config_filepath}"
__AMBER_STATUS=$?;
if [ $__AMBER_STATUS != 0 ]; then
            echo "error putting content in config file"
fi
fi
};
function retrieve_themes__3_v0 {
    __AMBER_VAL_2=$(sed -n 's/^light-theme=//p' ${__4_config_filepath});
    __AMBER_STATUS=$?;
if [ $__AMBER_STATUS != 0 ]; then
        echo "Failed to get light theme"
fi;
    __0_light_theme="${__AMBER_VAL_2}";
    __AMBER_VAL_3=$(sed -n 's/^dark-theme=//p' ${__4_config_filepath});
    __AMBER_STATUS=$?;
if [ $__AMBER_STATUS != 0 ]; then
        echo "Failed to get dark theme"
fi;
    __1_dark_theme="${__AMBER_VAL_3}";
    __AMBER_VAL_4=$(sed -n 's/^LookAndFeelPackage=//p' ~/.config/kdeglobals);
    __AMBER_STATUS=$?;
if [ $__AMBER_STATUS != 0 ]; then
        echo "Failed to get current theme"
fi;
    __2_current_theme="${__AMBER_VAL_4}"
};
function print_help__4_v0 {
    echo "Theme-Switcher is a utlity to easily switch between light and dark themes";
    echo "";
    echo "Usage: theme-switcher [COMMAND]";
    echo "";
    echo "Commands:";
    echo "  list - List available themes";
    echo "  current - Get current theme";
    echo "  set-light [current|<theme>] - Set light theme. Current use the current theme";
    echo "  set-dark [current|<theme>] - Set dark theme. Current use the current theme";
    echo "  light - Switch to light theme";
    echo "  dark - Switch to dark theme";
    echo "  switch - Switch between light and dark theme";
    echo "  help - Print this help";
    echo "";
    echo "Configuration:";
    echo "  Configuration file is located at XDG_CONFIG_HOME/theme-switcher.conf";
    echo "  If XDG_CONFIG_HOME is not set, the configuration file is located at HOME/.config/theme-switcher.conf";
    echo "";
    echo "Author: github.com/maxthom";
    echo "Au revoir !"
};
fn=$1
arg=$2
    find_config_location__1_v0 ;
    __AMBER_STATUS=$?;
if [ $__AMBER_STATUS != 0 ]; then
        echo "error finding config file location. set location with $XDG_CONFIG_HOME or $HOME"
fi;
    __AMBER_FUN_find_config_location1_v0__125=${__AMBER_FUN_find_config_location1_v0};
    echo ${__AMBER_FUN_find_config_location1_v0__125} > /dev/null 2>&1;
    reconcile_config__2_v0 ;
    __AMBER_FUN_reconcile_config2_v0__128=${__AMBER_FUN_reconcile_config2_v0};
    echo ${__AMBER_FUN_reconcile_config2_v0__128} > /dev/null 2>&1;
    retrieve_themes__3_v0 ;
    __AMBER_FUN_retrieve_themes3_v0__129=${__AMBER_FUN_retrieve_themes3_v0};
    echo ${__AMBER_FUN_retrieve_themes3_v0__129} > /dev/null 2>&1;
    if [ $([ "_${fn}" != "_light" ]; echo $?) != 0 ]; then
        if [ $([ "_${__0_light_theme}" != "_" ]; echo $?) != 0 ]; then
            echo "light theme is not set";
            exit 1
fi;
        lookandfeeltool -a ${__0_light_theme}
__AMBER_STATUS=$?;
if [ $__AMBER_STATUS != 0 ]; then
            echo "Failed to set light theme"
fi;
        echo "${__0_light_theme}"
elif [ $([ "_${fn}" != "_dark" ]; echo $?) != 0 ]; then
        if [ $([ "_${__1_dark_theme}" != "_" ]; echo $?) != 0 ]; then
            echo "dark theme is not set";
            exit 1
fi;
        lookandfeeltool -a ${__1_dark_theme}
__AMBER_STATUS=$?;
if [ $__AMBER_STATUS != 0 ]; then
            echo "Failed to set light theme"
fi;
        echo "${__1_dark_theme}"
elif [ $([ "_${fn}" != "_set-light" ]; echo $?) != 0 ]; then
        if [ $([ "_${arg}" != "_current" ]; echo $?) != 0 ]; then
            sed -i.bak -E "s/^(light-theme=).*/\1${__2_current_theme}/" ${__4_config_filepath}
__AMBER_STATUS=$?;
if [ $__AMBER_STATUS != 0 ]; then
                echo "error setting light theme"
fi;
            echo "${__2_current_theme}"
else
            sed -i.bak -E "s/^(light-theme=).*/\1${arg}/" ${__4_config_filepath}
__AMBER_STATUS=$?;
if [ $__AMBER_STATUS != 0 ]; then
                echo "error setting light theme"
fi;
            echo "${arg}"
fi
elif [ $([ "_${fn}" != "_set-dark" ]; echo $?) != 0 ]; then
        if [ $([ "_${arg}" != "_current" ]; echo $?) != 0 ]; then
            sed -i.bak -E "s/^(dark-theme=).*/\1${__2_current_theme}/" ${__4_config_filepath}
__AMBER_STATUS=$?;
if [ $__AMBER_STATUS != 0 ]; then
                echo "error setting dark theme"
fi;
            echo "${__2_current_theme}"
else
            sed -i.bak -E "s/^(dark-theme=).*/\1${arg}/" ${__4_config_filepath}
__AMBER_STATUS=$?;
if [ $__AMBER_STATUS != 0 ]; then
                echo "error setting dark theme"
fi;
            echo "${arg}"
fi
elif [ $([ "_${fn}" != "_switch" ]; echo $?) != 0 ]; then
        if [ $([ "_${__0_light_theme}" != "_" ]; echo $?) != 0 ]; then
            echo "light theme is not set";
            exit 1
elif [ $([ "_${__1_dark_theme}" != "_" ]; echo $?) != 0 ]; then
            echo "dark theme is not set";
            exit 1
elif [ $([ "_${__2_current_theme}" != "_${__0_light_theme}" ]; echo $?) != 0 ]; then
            lookandfeeltool -a ${__1_dark_theme}
__AMBER_STATUS=$?;
if [ $__AMBER_STATUS != 0 ]; then
                echo "failed to set dark theme"
fi;
            echo "${__1_dark_theme}"
elif [ $([ "_${__2_current_theme}" != "_${__1_dark_theme}" ]; echo $?) != 0 ]; then
            lookandfeeltool -a ${__0_light_theme}
__AMBER_STATUS=$?;
if [ $__AMBER_STATUS != 0 ]; then
                echo "failed to set light theme"
fi;
            echo "${__0_light_theme}"
else
            lookandfeeltool -a ${__0_light_theme}
__AMBER_STATUS=$?;
if [ $__AMBER_STATUS != 0 ]; then
                echo "failed to set light theme"
fi;
            echo "${__0_light_theme}"
fi
elif [ $([ "_${fn}" != "_list" ]; echo $?) != 0 ]; then
        lookandfeeltool --list
__AMBER_STATUS=$?;
if [ $__AMBER_STATUS != 0 ]; then
            echo "Failed to list themes"
fi
elif [ $([ "_${fn}" != "_current" ]; echo $?) != 0 ]; then
        echo "${__2_current_theme}"
elif [ $([ "_${fn}" != "_help" ]; echo $?) != 0 ]; then
        print_help__4_v0 ;
        __AMBER_FUN_print_help4_v0__221=${__AMBER_FUN_print_help4_v0};
        echo ${__AMBER_FUN_print_help4_v0__221} > /dev/null 2>&1
elif [ $([ "_${fn}" != "_--help" ]; echo $?) != 0 ]; then
        print_help__4_v0 ;
        __AMBER_FUN_print_help4_v0__224=${__AMBER_FUN_print_help4_v0};
        echo ${__AMBER_FUN_print_help4_v0__224} > /dev/null 2>&1
elif [ $([ "_${fn}" != "_-help" ]; echo $?) != 0 ]; then
        print_help__4_v0 ;
        __AMBER_FUN_print_help4_v0__227=${__AMBER_FUN_print_help4_v0};
        echo ${__AMBER_FUN_print_help4_v0__227} > /dev/null 2>&1
elif [ $([ "_${fn}" != "_-h" ]; echo $?) != 0 ]; then
        print_help__4_v0 ;
        __AMBER_FUN_print_help4_v0__230=${__AMBER_FUN_print_help4_v0};
        echo ${__AMBER_FUN_print_help4_v0__230} > /dev/null 2>&1
else
        print_help__4_v0 ;
        __AMBER_FUN_print_help4_v0__233=${__AMBER_FUN_print_help4_v0};
        echo ${__AMBER_FUN_print_help4_v0__233} > /dev/null 2>&1
fi