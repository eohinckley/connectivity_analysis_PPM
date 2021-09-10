#! /bin/bash

subject=$1
data_dir=/Users/SEAlab/Documents/PPM/Data
atlas=/Users/SEAlab/Documents/PPM/gordon/Gordon333_FreesurferSubcortical.32k_fs_LR.dlabel.nii

# Resampling to 32k space
wb_command -cifti-resample ${data_dir}/${subject}/MNINonLinear/Results/rest/rest_Atlas.dtseries.nii COLUMN ${atlas} COLUMN ADAP_BARY_AREA CUBIC ${data_dir}/${subject}/MNINonLinear/Results/rest/rest_Atlas.32k_fs_LR.dtseries.nii

# Parcellating the time series (converting from dense time series to parcel time series)
wb_command -cifti-parcellate ${data_dir}/${subject}/MNINonLinear/Results/rest/rest_Atlas.32k_fs_LR.dtseries.nii ${atlas} COLUMN ${data_dir}/${subject}/MNINonLinear/Results/rest/rest_Atlas.GORDparcel.32k_fs_LR.ptseries.nii -only-numeric

# Creating correlation matrix from parcel time series
wb_command -cifti-correlation ${data_dir}/${subject}/MNINonLinear/Results/rest/rest_Atlas.GORDparcel.32k_fs_LR.ptseries.nii ${data_dir}/${subject}/MNINonLinear/Results/rest/rest_Atlas.GORDparcel.32k_fs_LR.pconn.nii
