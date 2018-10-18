# Qcut_Scan
Bunch of scripts for scanning matching scale choices in lxplus infastructure.

## Operation Overview
The scripts take care of generating the right python fragment from a pre-fabricated hadronizer using cmsDriver.py, and launch the event generation with cmsRun executive. Lastly the DJR (Differential Jet Rate) plots are plotted by a small root macro. The input and output files are hosted in __EOS space__ in lxplus.

## Setup
### Clone
```
git clone https://github.com/SiewYan/Qcut_Scan.git
```
### Adapt LSF scripts
```
cd Qcut_Scan;
emacs -nw cmssw_lsf.job
```
Essential changes:
  - change ```LHE``` (YOUR LHE LOCATION)
  - change ```CODE_SRC``` (CURRENT DIRECTORY)
  - change ```ROOTFILE``` (OUTPUT LOCATION)
  
Customized parameters:
  - ```HADRONIZERTMPL``` (Hadronizer template)
  - ```nevent``` (Number of events generation)

## Launch LSF batch job

before launching collective job, test the working of the script by running
```
./runtest.sh
```
If everything is ok, you may run a collective job (Scanning qcut of one signal sample)
```
##Parameter in the script is self-explanatory
./scan.sh
```

