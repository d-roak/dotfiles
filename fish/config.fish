
set -x GOPATH $HOME/go
set -x PATH $PATH:$GOPATH/bin:$HOME/.local/bin

source ~/dotfiles/alias

# suppress greeting
set fish_greeting

# Theme colors
set fish_color_normal 5f5f5f
set fish_color_command 5f87ff
set fish_color_quote brown
set fish_color_redirection normal
set fish_color_end bcbcbc
set fish_color_error red --bold
set fish_color_param 5f87ff
set fish_color_comment red
set fish_color_match cyan
set fish_color_search_match --background=purple
set fish_color_operator cyan
set fish_color_escape cyan
set fish_color_cwd 00875f
set color_turquoise 40e0d0
set color_limegreen 88ca5e
set color_orange ffa500
set color_red red
set fish_pager_color_prefix cyan
set fish_pager_color_completion normal
set fish_pager_color_description 555 yellow
set fish_pager_color_progress cyan
set fish_pager_color_secondary

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'no'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch $color_turquoise
set __fish_git_prompt_color_stagedstate $color_limegreen
set __fish_git_prompt_color_dirtystate $color_orange
set __fish_git_prompt_color_untrackedfiles $color_red
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_stateseparator ''
set __fish_git_prompt_char_stagedstate ' ✚ '
set __fish_git_prompt_char_dirtystate ' ● '
set __fish_git_prompt_char_untrackedfiles ' ● '
set __fish_git_prompt_char_stashstate ''
set __fish_git_prompt_char_upstream_ahead ''
set __fish_git_prompt_char_upstream_behind ''
set __fish_git_prompt_char_upstream_equal ''

if status is-interactive
and not set -q TMUX
    exec tmux
end

function fish_prompt
  set last_status $status

  set_color $color_limegreen
  printf '%s' (prompt_pwd)
  set_color normal

  if [ -d .git ]
    printf ' on%s' (__fish_git_prompt)
  end

  printf '\n$'
  set_color normal
end

