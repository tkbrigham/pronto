#! /bin/bash

begin=0
interval=1

minute() {
  date +"%M"
}

offset() {
  expr `minute` - $begin
}

min_mod() {
  expr `offset` % $interval
}

run() {
  while true; do
    if [ $(min_mod) -eq 0 ]; then
      min=`minute`
      bundle exec rake snp
      #echo "SCRAPED AT `date +'%H:%M'`"

      while [ `minute` -eq $min ]; do
        sleep 1
      done
    else
      #echo "not the right minute ($(expr $interval - `min_mod`) remain)"
      sleep 1
    fi
  done
}

run
