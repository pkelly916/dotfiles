#!/bin/zsh

# terminate already running bar instances
killall -q polybar

polybar_proc=$(pgrep -u $UID -x polybar)

for i in ${polybar_proc} ; do
	kill -9 $i
done

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

echo "Bars closed..."
