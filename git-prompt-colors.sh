override_git_prompt_colors() {
    GIT_PROMPT_THEME_NAME="Custom"

    GIT_PROMPT_START_USER="${PS1%%\$*} "
    GIT_PROMPT_START_ROOT="${PS1%%#*} "
    GIT_PROMPT_END_USER="$ "
    GIT_PROMPT_END_ROOT="# "
    GIT_PROMPT_LEADING_SPACE=0
    GIT_PROMPT_PREFIX="("
    GIT_PROMPT_SUFFIX=")"
}

reload_git_prompt_colors "Custom"
