#!/bin/sh

cp -rf cmssw_lsf.job CMSSW_$1_mphi_$3_mchi_$2_mhs_$4_qcut_$5.job
rm -rf temp

#$1
sed s/INPUT1/$1/g CMSSW_$1_mphi_$3_mchi_$2_mhs_$4_qcut_$5.job > temp
mv temp CMSSW_$1_mphi_$3_mchi_$2_mhs_$4_qcut_$5.job
#$2
sed s/INPUT2/$2/g CMSSW_$1_mphi_$3_mchi_$2_mhs_$4_qcut_$5.job > temp
mv temp CMSSW_$1_mphi_$3_mchi_$2_mhs_$4_qcut_$5.job
#$3
sed s/INPUT3/$3/g CMSSW_$1_mphi_$3_mchi_$2_mhs_$4_qcut_$5.job > temp
mv temp CMSSW_$1_mphi_$3_mchi_$2_mhs_$4_qcut_$5.job
#$4
sed s/INPUT4/$4/g CMSSW_$1_mphi_$3_mchi_$2_mhs_$4_qcut_$5.job > temp
mv temp CMSSW_$1_mphi_$3_mchi_$2_mhs_$4_qcut_$5.job

#$5
sed s/INPUT5/$5/g CMSSW_$1_mphi_$3_mchi_$2_mhs_$4_qcut_$5.job > temp
mv temp CMSSW_$1_mphi_$3_mchi_$2_mhs_$4_qcut_$5.job

##
chmod a+x CMSSW_$1_mphi_$3_mchi_$2_mhs_$4_qcut_$5.job

## Send job
#bsub -R "rusage[mem=4000]" -q $6 -o Log_$1_mphi_$3_mchi_$2_mhs_$4_qcut_$5 CMSSW_$1_mphi_$3_mchi_$2_mhs_$4_qcut_$5.job
