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
	python "demo/restoration_video_demo.py" "./configs/restorers/basicvsr/basicvsr_reds4.py" \
        "./iter_300000.pth" ./cons2/ ./output;
#	python "demo/restoration_video_demo.py" "./configs/restorers/tdan/tdan_vimeo90k_bix4_ft_lr5e-5_400k.py" \
#        "./tdan_vimeo90k_bix4_20210528-739979d9.pth" ./cons2/ ./output;
	mv ./cons2/* ./cons3;
done
