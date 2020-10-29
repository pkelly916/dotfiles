#!/bin/sh

# terminate already running bar instances
killall -q polybar

polybar_proc=$(pgrep -u $UID -x polybar)

for i in ${polybar_proc} ; do
	kill -9 $i
done

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# launch top bars with multi-monitor support
if type "xrandr"; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		MONITOR=$m polybar --reload top &
		sleep 1
		MONITOR=$m polybar --reload top-second &
	done
else
	polybar top & 
	sleep 1
	polybar top-second &
fi

# echo "Bars launched..."
