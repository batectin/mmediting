#!/bin/bash
for k in {1..200}
do
	clear && clear;
	echo $k;
	i=0;
	for f in cons/*;
	do
		# echo $f;
		mv $f ./cons2;
		i=$((i+1));
		# echo $i;
		if [ $i -gt 99 ]; then
			break;
		fi;
	done
	python "demo/restoration_video_demo.py" "./configs/restorers/iconvsr/iconvsr_reds4.py" "./iconvsr_reds4_20210413-9e09d621.pth" ./cons2/ ./output;
	mv ./cons2/* ./cons3;
done
