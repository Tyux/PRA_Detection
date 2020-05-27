export PATH=/public/home/aiss/Pytorch/Python3.6.8/bin:$PATH
export LD_LIBRARY_PATH=/public/software/apps/DeepLearning/Libs/openssl-1.1.0j/lib/:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=/public/software/apps/DeepLearning/PyTorch/glog-build/lib:/public/software/apps/DeepLearning/PyTorch/gflags-2.1.2-build/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/public/software/apps/DeepLearning/PyTorch/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/public/software/apps/DeepLearning/PyTorch/openblas-0.3.7-build/lib:/public/software/apps/DeepLearning/PyTorch/hiredis-0.12.0-build/lib:/public/software/apps/DeepLearning/PyTorch/opencv-2.4.13.6-build/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/public/software/apps/DeepLearning/PyTorch/lmdb-0.9.24-build/lib:/public/software/apps/DeepLearning/PyTorch/leveldb-1.22-build/lib64:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=/public/software/apps/DeepLearning/PyTorch/gflags-2.1.2-build/lib:/public/software/apps/DeepLearning/PyTorch/glog-build/lib/:$LD_LIBRARY_PATH
export MIOPEN_DEBUG_DISABLE_FIND_DB=1
export CPLUS_INCLUDE_PATH=/public/software/apps/DeepLearning/PyTorch/gflags-2.1.2-build/include:/public/software/apps/DeepLearning/PyTorch/glog-build/include:$CPLUS_INCLUDE_PATH
export C_INCLUDE_PATH=$CPLUS_INCLUDE_PATH

export OMP_NUM_THREADS=6
#export GLOO_SOCKET_IFNAME=ib0,ib1,ib2,ib3
export GLOO_SOCKET_IFNAME=ib0
