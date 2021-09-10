#! /bin/bash

source ./SetUpHCPPipeline.sh

sub=$1
hcppipe=/Users/SEAlab/Desktop/HCP_pipeline/HCPpipelines-4.2.0
hcpdir=/Users/Sealab/Documents/PPM/Data
preprocdir=/Users/Sealab/Documents/PPM/fMRIproc/preprocessing
templatedir=${hcppipe}/global/templates

#${hcppipe}/FreeSurfer/scripts/FreeSurferHiresWhite.sh ${sub} ${hcpdir}/${sub}/T1w ${hcpdir}/${sub}/T1w/${sub}/mri/T1w.nii.gz NONE

${hcppipe}/fMRIVolume/GenericfMRIVolumeProcessingPipeline.sh --path=${hcpdir} --subject=${sub} --fmritcs=${preprocdir}/lomo_proc_func/_${sub}/merged_func_ss.nii.gz --fmriname=rest --fmrires=2 --biascorrection=NONE --dcmethod=NONE --gdcoeffs=NONE --processing-mode=LegacyStyleData

${hcppipe}/fMRISurface/GenericfMRISurfaceProcessingPipeline.sh --path=${hcpdir} --subject=${sub} --fmriname=rest --lowresmesh=32 --fmrires=2 --smoothingFWHM=2 --grayordinatesres=2 #--regname=FS
