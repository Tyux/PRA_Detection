#!/bin/bash
export OMP_NUM_THREADS=6

module load apps/PyTorch/1.3.0a0/hpcx-2.4.1-gcc-7.3.1
lrank=$OMPI_COMM_WORLD_LOCAL_RANK
comm_rank=$OMPI_COMM_WORLD_RANK
comm_size=$OMPI_COMM_WORLD_SIZE

APP="python3 `pwd`/train.py -j 8 --epochs=26 --batch-size=2 --lr=0.02 --dist-url tcp://${1}:34568 --world-size=${comm_size} --rank=${comm_rank} --output-dir `pwd`/1node_test"
case ${lrank} in
[0])
  export HIP_VISIBLE_DEVICES=0
  export UCX_NET_DEVICES=mlx5_0:1
  export UCX_IB_PCI_BW=mlx5_0:50Gbs
  echo GLOO_SOCKET_IFNAME=ib0 numactl --cpunodebind=0 --membind=0 ${APP}
  GLOO_SOCKET_IFNAME=ib0 numactl --cpunodebind=0 --membind=0 ${APP}
  ;;
[1])
  export HIP_VISIBLE_DEVICES=1
  export UCX_NET_DEVICES=mlx5_1:1
  export UCX_IB_PCI_BW=mlx5_1:50Gbs
  echo GLOO_SOCKET_IFNAME=ib0 numactl --cpunodebind=1 --membind=1 ${APP}
  GLOO_SOCKET_IFNAME=ib0 numactl --cpunodebind=1 --membind=1 ${APP}
  ;;
[2])
  export HIP_VISIBLE_DEVICES=2
  export UCX_NET_DEVICES=mlx5_2:1
  export UCX_IB_PCI_BW=mlx5_2:50Gbs
  echo GLOO_SOCKET_IFNAME=ib0 numactl --cpunodebind=2 --membind=2 ${APP} 
  GLOO_SOCKET_IFNAME=ib0 numactl --cpunodebind=2 --membind=2 ${APP}
  ;;
[3])
  export HIP_VISIBLE_DEVICES=3
  export UCX_NET_DEVICES=mlx5_3:1
  export UCX_IB_PCI_BW=mlx5_3:50Gbs
  echo GLOO_SOCKET_IFNAME=ib0 numactl --cpunodebind=3 --membind=3 ${APP}
  GLOO_SOCKET_IFNAME=ib0 numactl --cpunodebind=3 --membind=3 ${APP}
  ;;
esac
