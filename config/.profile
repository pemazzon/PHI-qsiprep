# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi


LD_LIBRARY_PATH="/opt/ants/lib:$LD_LIBRARY_PATH"

export XDG_RUNTIME_DIR=/tmp/runtime-${USER}

# Change the value for FREESURFER_HOME if you have
# installed Freesurfer into a different location

#only execute if ghostfs is mounted
if mount |grep -q GhostFS
then
    export PATH=/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin:/opt/art/bin:/opt/convert3d-nightly/bin:/opt/conda/envs/qsiprep/bin:/opt/freesurfer/bin:/bin:/opt/freesurfer/tktools:/opt/freesurfer/mni/bin:/opt/dsi-studio:/opt/dsi-studio/dsi_studio_64:/opt/conda/envs/fslqsiprep/bin:/usr/local/nvidia/bin:/usr/local/cuda/bin:/opt/ants/bin:/opt/mrtrix3-latest/bin:/opt/3Tissue/bin:/usr/local/bin:/src/TORTOISEV4/bin
    export NVARCH=x86_64
    export NV_CUDA_CUDART_VERSION=12.2.140-1
    export NV_CUDA_COMPAT_PACKAGE=cuda-compat-12-2
    export CUDA_VERSION=12.2.2
    export LD_LIBRARY_PATH=/opt/conda/envs/qsiprep/lib/python3.10/site-packages/nvidia/cudnn/lib:/opt/freesurfer/lib:/opt/ants/lib:/usr/local/nvidia/lib:/usr/local/nvidia/lib64
    export NVIDIA_VISIBLE_DEVICES=all
    export NVIDIA_DRIVER_CAPABILITIES=compute,utility
    export NV_CUDA_LIB_VERSION=12.2.2-1
    export NV_NVTX_VERSION=12.2.140-1
    export NV_LIBNPP_VERSION=12.2.1.4-1
    export NV_LIBNPP_PACKAGE=libnpp-12-2=12.2.1.4-1
    export NV_LIBCUSPARSE_VERSION=12.1.2.141-1
    export NV_LIBCUBLAS_PACKAGE_NAME=libcublas-12-2
    export NV_LIBCUBLAS_VERSION=12.2.5.6-1
    export NV_LIBCUBLAS_PACKAGE=libcublas-12-2=12.2.5.6-1
    export NV_LIBNCCL_PACKAGE_NAME=libnccl2
    export NV_LIBNCCL_PACKAGE_VERSION=2.19.3-1
    export NCCL_VERSION=2.19.3-1
    export NV_LIBNCCL_PACKAGE=libnccl2=2.19.3-1+cuda12.2
    export NVIDIA_PRODUCT_NAME=CUDA
    export FSLDIR=/opt/conda/envs/fslqsiprep
    export FSLOUTPUTTYPE=NIFTI_GZ
    export FSLMULTIFILEQUIT=TRUE
    export FSLLOCKDIR=
    export FSLMACHINELIST=
    export FSLREMOTECALL=
    export FSLGECUDAQ=cuda.q
    export FSL_DEPS=libquadmath0
    export FSL_BUILD=
    export ANTSPATH=/opt/ants/bin
    export ANTS_DEPS=zlib1g
    export DSI_STUDIO_DEPS="libqt5charts5 libqt5opengl5 libqt5svg5 libqt5gui5 libqt5widgets5 libqt5sql5 libqt5network5"
    export QT_PLUGIN_PATH=/usr/lib/x86_64-linux-gnu/qt5/plugins
    export QML2_IMPORT_PATH=/usr/lib/x86_64-linux-gnu/qt5/qml
    export MRTRIX3_DEPS="bzip2 ca-certificates curl libpng16-16 libblas3 liblapack3"
    export FSL_DIR=/opt/conda/envs/fslqsiprep
    export FS_OVERRIDE=0
    export FIX_VERTEX_AREA=
    export FSF_OUTPUT_FORMAT=nii.gz
    export FREESURFER_HOME=/opt/freesurfer
    export SUBJECTS_DIR=/opt/freesurfer/subjects
    export FUNCTIONALS_DIR=/opt/freesurfer/sessions
    export MNI_DIR=/opt/freesurfer/mni
    export LOCAL_DIR=/opt/freesurfer/local
    export MINC_BIN_DIR=/opt/freesurfer/mni/bin
    export MINC_LIB_DIR=/opt/freesurfer/mni/lib
    export MNI_DATAPATH=/opt/freesurfer/mni/data
    export PERL5LIB=/opt/freesurfer/mni/lib/perl5/5.8.5
    export MNI_PERL5LIB=/opt/freesurfer/mni/lib/perl5/5.8.5
    export FREESURFER_DEPS="bc ca-certificates curl libgomp1 libxmu6 libxt6 tcsh perl"
    export SYNB0_ATLASES=/opt/synb0/atlases
    export AFNI_INSTALLDIR=/usr/local/bin
    export AFNI_IMSAVE_WARNINGS=NO
    export TORTOISE_DEPS=libfftw3-3
    export C3DPATH=/opt/convert3d-nightly
    export MKL_NUM_THREADS=1
    export OMP_NUM_THREADS=1
    export MRTRIX_NTHREADS=1
    export KMP_WARNINGS=0
    export CRN_SHARED_DATA=/niworkflows_data
    export ARTHOME=/opt/art
    export DIPY_HOME=${HOME}/.dipy
fi
