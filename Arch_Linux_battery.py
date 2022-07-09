# Arch linux battery script - inspired by romeo-folie

# This script is based on the 40%-80% battery 
# The 40 80 battery rule can still be used today but it is no longer the best rule to apply 
# to improve laptop battery life because laptops nowadays are now 
# built with batteries that are able to do well in one full charge cycle. 
# While you can still use the 40 80 rule, it won’t always apply to newer batteries.


from threading import Timer
from notifypy import Notify

status = "/sys/class/power_supply/BAT0/status"
level = "/sys/class/power_supply/BAT0/capacity"

def battery():
    with open(status, 'r') as f:
        for line in f:
            if 'Discharging' in line:
                with open(level, 'r') as f2:
                    perc = int(f2.read())
                    if perc <= 40:
                        mess = Notify()
                        mess.title = '[+]Battery Reminder[+]'
                        mess.message = 'PLUG IN THE BATTERY!'
                        mess.send()
            elif 'Charging' in line:
                with open(level, 'r') as f2:
                    perc = int(f2.read())
                    if perc >= 80:
                        mess = Notify()
                        mess.title = '[+]Battery Reminder[+]'
                        mess.message = 'UNPLUG THE BATTERY!'
                        mess.send()

    reminder = Timer(5.0, battery).start()

if __name__ == "__main__":
    battery()