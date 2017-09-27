#!/bin/bash
#set -euxo pipefail
set -ux

bioprojectID=$1
outFile=$2

esearch -db bioproject -query $bioprojectID | elink -target biosample | esummary | xtract -pattern DocumentSummary -block Attribute -if Attribute@attribute_name -equals "disease state" -element Attribute > tmp.meta

esearch -db bioproject -query $bioprojectID | elink -target biosample | esummary | xtract -pattern DocumentSummary -element Identifiers | awk '{print $4}' > tmp.ids

#rm -f tmp.accessions
#while read idval
#for idval in `cat tmp.ids`
#do
#	echo $idval
#	esearch -db sra -query $idval | esummary | xtract -pattern DocumentSummary -ACC @acc -block DocumentSummary -element "&ACC"  | awk '{ print $5; }' >> tmp.accessions
#done

#paste tmp.accessions tmp.meta > $outFile
paste tmp.ids tmp.meta > $outFile
#rm tmp.meta tmp.ids

