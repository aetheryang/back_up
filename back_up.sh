#! /bin/bash
#################################################################################
#     File Name           :     back_up.sh
#     Created By          :     aetheryang
#     Creation Date       :     [2016-05-17 21:11]
#     Last Modified       :     [2016-05-17 22:56]
#     Description         :     Auto back up files.
#################################################################################


if [ $# = 0 ]; then
  echo "wrong parameter"
  exit
fi
access_date=`stat $1  | grep Modify  | awk '{print $2}'  | sed -e 's/-/_/g'`
access_time=`stat $1  | grep Modify  | awk '{print $3}'  | cut -d"." -f1 | sed -e 's/:/_/g'`
file_name=` echo $1 | sed -e 's/\.[^\.]*$//g'`
file_suffix=` echo $1 | sed -e 's/.*\.//g'`
new_name=$file_name"__"$access_date"__"$access_time"."$file_suffix
out_put_dir='.'
cp $1 $out_put_dir/$new_name

