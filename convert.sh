convert -density 150 input.pdf -rotate "$([ $((RANDOM % 2)) -eq 1 ] && echo -)0.$(($RANDOM % 4 + 5))" -attenuate 0.4 +noise Multiplicative -attenuate 0.03 +noise Multiplicative -sharpen 0x1.0 -colorspace Gray output.pdf

convert -density 150 input.pdf -rotate "$([ $((RANDOM % 2)) -eq 1 ] && echo -)0.$(($RANDOM % 4 + 5))" -attenuate 0.4 +noise Multiplicative -flatten -attenuate 0.03 +noise Multiplicative -sharpen 0x1.0 -colorspace Gray output.pdf

convert -density 300 -gaussian-blur 1 -quality 80% -attenuate 0.2 +noise Multiplicative -colorspace Gray ../input.pdf ouput_%02d.jpg

convert -gaussian-blur 1 ../input.pdf ouput_%02d.png

convert -attenuate 0.2 ../sample/b_ouput_0* ouput_%02d.png

convert -density 300 -attenuate 0.4 +noise Multiplicative -colorspace Gray  -gaussian-blur 10 ../sample/output.pdf ouput_%02d.png


convert  -gaussian-blur 10 -density 300 -attenuate 0.4 +noise Multiplicative -colorspace Gray  ../sample/output.pdf ouput_%02d.png

convert -colorspace Gray -gaussian-blur 10 -density 300  -quality 5% -attenuate 0.4 +noise Multiplicative -sharpen 0x1.0  -threshold 40% -gaussian-blur 10  -attenuate 0.4 +noise Multiplicative -sharpen 0x1.0 -threshold 70% -gaussian-blur 1 ../sample/output.pdf ouput_%02d.jpg


convert -colorspace Gray -gaussian-blur 10 -density 300  -quality 8% -attenuate 0.4 +noise Multiplicative -sharpen 0x1.0  -threshold 40% -gaussian-blur 10  -attenuate 0.4 +noise Multiplicative -sharpen 0x1.0 -threshold 57% -gaussian-blur 1 ../sample/output.pdf ouput_%02d.jpg


convert -threshold 90% -resize 40% -quality 30% ../image/ouput_0*.jpg SCAN_%02d.jpg

for file in ../image/ouput_*.jpg
	do  convert -threshold 90% -rotate "$([ $((RANDOM % 2)) -eq 1 ] && echo -)0.$(($RANDOM % 6 ))" -resize 40% "$file" SCAN_$(basename "$file").png
done

for file in ../image/ouput_*.jpg
do 
	convert -threshold 90% -rotate "$([ $((RANDOM % 2)) -eq 1 ] && echo -)0.$(($RANDOM % 6 ))" -resize 40% -quality 30% "$file" SCAN_$(basename "$file")
done
