#!/usr/bin/env zsh

emulate -L zsh

setopt RE_MATCH_PCRE

zmodload zsh/datetime

local status_code date
local tn_title="lsyncd notifier"

while read line; do
  echo $line

  if [[ $line =~ "Finished a list after exitcode: (\d+)" ]]; then
    status_code=$match[1]
    date=$(strftime "%Y-%m-%d %H:%M:%S" $EPOCHSECONDS)
    zsh -c "reattach-to-user-namespace terminal-notifier -title '${tn_title}' -message 'Sync finished with status ${status_code}'"
  fi
done
