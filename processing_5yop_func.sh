#! /bin/bash

source ./SetUpHCPPipeline.sh

sub=$1
condition=$2
hcppipe=/home/usr/camachoc/Desktop/HCPpipelines-4.1.3
hcpdir=/data/perlman/moochie/user_data/CamachoCat/5YOP/proc/hcp_proc
preprocdir=/data/perlman/moochie/user_data/CamachoCat/5YOP/proc/preprocessing
rawdir=/data/perlman/moochie/study_data/5YOP/MRI_processing
templatedir=${hcppipe}/global/templates

${hcppipe}/fMRIVolume/GenericfMRIVolumeProcessingPipeline.sh --path=${hcpdir} --subject=${sub} --fmritcs=${preprocdir}/lomo_proc_func/${sub}/${condition}/merged_func.nii.gz --fmriname=${condition} --fmrires=2 --biascorrection=NONE --dcmethod=NONE --gdcoeffs=NONE

${hcppipe}/fMRISurface/GenericfMRISurfaceProcessingPipeline.sh --path=${hcpdir} --subject=${sub} --fmriname=${condition} --lowresmesh=32 --fmrires=2 --smoothingFWHM=2 --grayordinatesres=2 #--regname=FS
