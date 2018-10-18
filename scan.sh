#!/bin/bash

LHEDIR=/eos/user/s/shoh/LHE/MonojetMatch1JetsDM ##YOUR LHE LOCATION
queue=1nd
ONESAMPLE=1
ZP=3000
DM=200
HS=90

Scan () {
    echo "SCAN Qcut on one sample: $file"
    XQCUT=`(grep "xqcut" ${LHEDIR}/$file)`
    echo ${XQCUT}
    for qcut in $(seq 20 5 120) #scanning from 20 to 120 GeV in step of 5
    do
	 echo "./makejob.sh ${model} ${chi} ${phi} ${hs} ${qcut} ${queue}"  
         #./makejob.sh ${model} ${chi} ${phi} ${hs} ${qcut} ${queue}
    done
}

for file in `(ls ${LHEDIR})`
do
    model=`(echo $file | awk -F '_' '{print $1}')`
    phi=`(echo $file | awk -F '-|_' '{print $4}')`
    chi=`(echo $file | awk -F '-|_' '{print $8}')`
    hs=`(echo $file | awk -F '-|_' '{print $6}')`

    if [ "$ONESAMPLE" == "1" ];then
	if [ "$chi" == "$DM" ] && [ "$phi" == "$ZP" ] && [ "$hs" == "$HS" ]; then
	    Scan
	fi
    else
	echo "Scan All"
	Scan
    fi
done
