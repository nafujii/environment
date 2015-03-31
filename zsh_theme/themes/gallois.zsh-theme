ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

#Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  local cb=$(current_branch)
  if [ -n "$cb" ]; then
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX$(parse_git_dirty)%{$fg_bold[yellow]%}$(work_in_progress)%{$reset_color%}"
  fi
}

rbenv_version() {
  rbenv version 2> /dev/null | awk '{print $1}'
}

# Combine it all into a final right-side prompt
# RPS1='$(git_custom_status)$(ruby_prompt_info) $EPS1'

# rbenv
#PROMPT='%{$fg[cyan]%}[%~% ]%{$fg[red]%}[ruby-$(rbenv_version)]%{$reset_color%}$(git_custom_status)
#%(?.%{$fg[green]%}.%{$fg[red]%})%B$%b '

PROMPT='%{$fg[cyan]%}[%~% ]$(git_custom_status)
%(?.%{$fg[green]%}.%{$fg[red]%})%B$%b '
