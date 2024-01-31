#!/bin/bash
#SBATCH -p gpu         # Partition to submit to (fast / gpu)
#SBATCH -n 3
#SBATCH -c 4         # Number of cpu per task (per default 1 cpu with 2Go Ram per task)
#SBATCH --mem=2G       # Memory pool for all cores (see also --mem-per-cpu)
#SBATCH --job-name="DSPlant"   #Name of the job 
#SBATCH -o log.DSPlant.%j.out   # File to which STDOUT will be written
#SBATCH -e log.DSPlant.%j.err   # File to which STDERR will be written

fast5dir="/ssd_workspace/jpeter/ssData/Guppy_basecalling/Col0_100GY_2022/workspace_single"
ref="/home/jpeter/DATA/ReferenceGenomes/TAIR10/TAIR10_chr_all.fas"
input="/ssd_workspace/jpeter/ssData/Guppy_basecalling/Col0_100GY_2022/workspace_single"
model="model.dp2.CNN.arabnrice2-1_120m_R9.4plus_tem.bn13_sn16.both_bilstm.epoch6.ckpt"
resfile="/ssd_workspace/jpeter/ssData/Guppy_basecalling/Col0_100GY_2022/col0_100GY.fast5s.C.call_mods.tsv"

#conda activate tombo
#srun --exclusive -N1 -n1 tombo resquiggle $fast5dir $ref --processes 10 --num-most-common-errors 5 --corrected-group RawGenomeCorrected_000 --basecall-group Basecall_1D_000 --overwrite --ignore-read-locks --dna

#conda activate deepsignalpenv
deepsignal_plant call_mods --input_path $input --model_path $model --result_file $resfile --corrected_group RawGenomeCorrected_000 --reference_path $ref --motifs C --nproc 30 --nproc_gpu 6 

fast5dir="/ssd_workspace/jpeter/ssData/Guppy_basecalling/Col0_2022/workspace_single"
ref="/home/jpeter/DATA/ReferenceGenomes/TAIR10/TAIR10_chr_all.fas"
input="/ssd_workspace/jpeter/ssData/Guppy_basecalling/Col0_2022/workspace_single"
model="model.dp2.CNN.arabnrice2-1_120m_R9.4plus_tem.bn13_sn16.both_bilstm.epoch6.ckpt"
resfile="/ssd_workspace/jpeter/ssData/Guppy_basecalling/Col0_2022/col0.fast5s.C.call_mods.tsv"

#conda activate tombo
#srun --exclusive -N1 -n1 tombo resquiggle $fast5dir $ref --processes 10 --num-most-common-errors 5 --corrected-group RawGenomeCorrected_000 --basecall-group Basecall_1D_000 --overwrite --ignore-read-locks --dna

#conda activate deepsignalpenv
deepsignal_plant call_mods --input_path $input --model_path $model --result_file $resfile --corrected_group RawGenomeCorrected_000 --reference_path $ref --motifs C --nproc 30 --nproc_gpu 6 

