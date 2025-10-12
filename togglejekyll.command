#!/bin/zsh

# For local development of CB museum site. 
# toggles jekyll and Safari, starts and closes.

# Check for a running Jekyll process
if ps aux | grep -v 'grep' | grep -q 'jekyll serve'; then
  echo "Jekyll is currently running. Stop jekyll"
  pkill -f jekyll
  osascript -e "tell application \"Safari\" to quit"
else
  echo "Jekyll is not running. Start jekyll"
  bundle exec jekyll serve --detach > /dev/null
  sleep 0.1
  open http://127.0.0.1:4000
fi

