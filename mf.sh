#!/bin/bash
for ((k=1; k<=$1; k++));
do
    if (($k % 5 == 0)); then
        clear && clear;
    fi;
	echo $k;
	i=0;
	for f in cons/*;
	do
		# echo $f;
		mv $f ./cons2;
		i=$((i+1));
		# echo $i;
		if [ $i -gt $2 ]; then
			break;
		fi;
	done
	python "demo/restoration_video_demo.py" "./configs/restorers/iconvsr/iconvsr_vimeo90k_bd.py" \
        "./iconvsr_vimeo90k_bd_20210414-5f38cb34.pth" ./cons2/ ./output;
	#mv ./cons2/* ./cons3;
done
