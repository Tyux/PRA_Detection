#!/bin/bash
#SBATCH -p caspra
#SBATCH -N 1
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=8
#SBATCH --gres=dcu:4
#SBATCH -J torch_detect
#SBATCH -o ./log/output.%j
#SBATCH -e ./log/output.%j
module load apps/PyTorch/1.3.0a0/hpcx-2.4.1-gcc-7.3.1
which mpirun
which python3

hostfile=./$SLURM_JOB_ID
scontrol show hostnames $SLURM_JOB_NODELIST > ${hostfile}
rm `pwd`/hostfile-dl -f

#hostfile=./node_list
for i in `cat $hostfile`
do
    echo ${i} slots=4 >> `pwd`/hostfile-dl-$SLURM_JOB_ID
done
np=$(cat $hostfile|sort|uniq |wc -l)

np=$(($np*4))

nodename=$(cat $hostfile |sed -n "1p")
echo $nodename
dist_url=`echo $nodename | awk '{print $1}'`


echo mpirun -np $np --hostfile hostfile-dl-$SLURM_JOB_ID --bind-to none `pwd`/single_process.sh $dist_url

mpirun -np $np --hostfile hostfile-dl-$SLURM_JOB_ID --bind-to none `pwd`/single_process.sh $dist_url
