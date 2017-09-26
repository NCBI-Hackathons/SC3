#!/bin/bash

display_usage() { 
echo "Usage: $0 clinvar.vcf.gz [GENE] or [DISEASE] ";
echo "";
echo "[GENE] = GENE ID ";
echo "[DISEASE] = name of associated disase in clinvar";
echo "";
echo " program takes clinvar database and a gene or disase";
echo " and outputs a list of RSids of CLINVAR=5 ";
echo "";
echo " must list the clinvar.vcf.gz download file must have one of Gene or Disease";
echo "";
echo " program will automatically check to see if you have the";
echo " latest version of clinvar from NCBI site and automatically";
echo " download the file if it does not match file on ftp site ";
echo "";
}

# if less than two arguments supplied, display usage 
	if [  $# -le 1 ] 
	then 
		display_usage
		exit 1
	fi 
 
# check whether user had supplied -h or --help . If yes display usage 
	if [[ ( $# == "--help") ||  $# == "-h" ]] 
	then 
		display_usage
		exit 0
	fi 


ADDRESS="ftp.ncbi.nlm.nih.gov"
SRC_DIR="pub/clinvar/vcf_GRCh37/"
command="open -e \"get $SRC_DIR$1.md5 ; exit \" \"$ADDRESS\""
command2="open -e \"get $SRC_DIR$1 ; exit \" \"$ADDRESS\""

file1=`md5 -q $1`
if [ ! -e $1.md5 ]; then
    lftp -c "$command" 
fi
file2=`cut -d* -f1 $1.md5`

if [ ! -e $1 ]; then
    lftp -c "$command2"
fi

echo "Checking file: $1"

echo "Using MD5 file: $1.md5"
echo $file1
echo $file2

if [ $file1 != $file2 ]
then
  echo "md5 sums mismatch"
  mv $1 $1.old
  lftp -c "$command2"
else
  echo "checksums OK"
fi



#actual search

if [ "$3" = 5 ]; then 
  zgrep $2 $1 | grep CLNSIG=5 | awk '{print $8}' | awk -F  ";" '/1/ {print $1}' | awk -F  "=" '/1/ {print $2}' >> $2-$3.snps
  echo "SNPs written to $2-$3.snps"
else
  zgrep $2 $1 | awk '{print $8}' | awk -F  ";" '/1/ {print $1}' | awk -F  "=" '/1/ {print $2}' >> $2.snps
  echo "SNPs written to $2.snps"
fi

