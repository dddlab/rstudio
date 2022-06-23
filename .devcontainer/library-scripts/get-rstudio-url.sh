#/bin/bash

jupyter lab list | grep http | sed 's/codespaces-[^:]*/127.0.0.1/;s|?token|rstudio/?token|' | cut -d' ' -f1