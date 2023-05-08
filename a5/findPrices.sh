dataset=./vgsales.csv
outputFile=./average.txt

awk 'BEGIN{FS=","}{if(NR > 1 && $6 > 0){print $6}}' $dataset > ./na_price
awk 'BEGIN{FS=","}{if(NR > 1 && $7 > 0){print $7}}' $dataset > ./eu_price
awk 'BEGIN{FS=","}{if(NR > 1 && $8 > 0){print $8}}' $dataset > ./jp_price
awk 'BEGIN{FS=","}{if(NR > 1 && $9 > 0){print $9}}' $dataset > ./other_price
awk 'BEGIN{FS=","}{if(NR > 1 && $10 > 0){print $10}}' $dataset > ./global_price

count=0
for i in ./*_price
do
	if [ $count -eq 0 ];
	then
		count=$(($count+1))
		awk '{ sum += $1 } END { if (NR > 0) printf("%.2f\n", sum / NR) }' $i > ./avg_price.dat
	else
		awk '{ sum += $1 } END { if (NR > 0) printf("%.2f\n", sum / NR) }' $i >> ./avg_price.dat
	fi
done

for i in other_price
do
	awk '{count[$1]++} END {for(price in count) print price, count[price] | "sort -nr"}' $i > prices.dat
done
