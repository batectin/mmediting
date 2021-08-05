#!/bin/bash
for ((k=1; k<=$1; k++));
do
    if (($k % 5 == 0)); then
        clear && clear;
    fi;
	echo $k;
	i=1;
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
	python  "demo/restoration_video_demo.py" \
             "./configs/restorers/basicvsr_plusplus/basicvsr_plusplus_c64n7_8x1_600k_reds4.py"  \
             "./basicvsr_plusplus_c64n7_8x1_600k_reds4_20210217-db622b2f.pth" ./cons2/ ./output;
     mv cons2/* cons3;
done;

