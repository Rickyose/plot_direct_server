# Ini sebenarnya tidak direct karena harus di zip dulu plotnya, namun karena harus edit file jika ganti nama jadi makanya namannya tetap
# plot_direct_server PASTIKAN SUDAH ROOT (Ubuntu 20.04, GCloud)

#!/bin/bash

sudo bash -c 'cd && git clone https://github.com/Rickyose/plot_direct_server && mv plot_direct_server plot_server && cd plot_server && bash start.sh'
