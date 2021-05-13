#!/bin/bash
for i in cons3/*;
do
	f=$(basename ${i%.*})
	echo $f
	python "demo/restoration_demo.py" "./configs/restorers/liif/liif_edsr_norm_x2-4_c64b16_g1_1000k_div2k.py" "./liif_edsr_norm_c64b16_g1_1000k_div2k_20210319-329ce255.pth" ./cons3/$f.png ./output/$f.jpg;
done
