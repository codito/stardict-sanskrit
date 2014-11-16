touch tars/tars.MD
rm tars/tars.MD
touch tars/tars.MD
for dir in */
do
	base=$(basename "$dir")
	cd $dir
	tar -czf "${base}.tar.gz" `ls *.idx *.dict *.ifo *.syn`
	mv "${base}.tar.gz" ../tars/
	cd ..
	if [ ! -f "$dir/${base}.tar.gz" ]; then
	  echo "<https://github.com/vvasuki/stardict-sanskrit/raw/master/sa-head/tars/${base}.tar.gz>" >> tars/tars.MD
	fi
done
