##stacks##
##denovo_map.pl##
##stacks container##

docker pull biocontainers/stacks:v2.2dfsg-1-deb_cv1
docker run -v /Volumenes/SALVA_07/copepod:/stacks -it biocontainers/stacks:v2.2dfsg-1-deb_cv1 bash

##run stacks process_radtags##
stacks process_radtags -P -p ../stacks/isuue2/GBS_raw/ --interleaved -b ../stacks/isuue2/barcodes_copes_iss.tsv \
-o ../stacks/isuue2/process_map_res/ -c -q -r --index_index --renz_1 mspI --renz_2 nsiI
## -P path to samples directory
## -p pair-end
## --intervaled because the pair-end samples are interleaved
## --index_index is the format of the barcodes in the data
## -c clean -q quality -r rescue

##run stacks denovo_map.pl##
stacks denovo_map.pl --samples ../stacks/isuue2/process_map_res/ --popmap ../stacks/isuue2/popmap_tarea_issue.tsv \
-o ../stacks/isuue2/denovo_map_re2 -M 3 -n 2 -m 3 -X "populations: -r 0.50 --min_maf 0.01 --genepop"
## -- popmap population map
## -M the number of mismatches allowed between loci when processing a single individual (default 2).
## -n number of mismatches allowed between loci when building the catalog (default 1).
##-m a minimum number of identical, raw reads required to create a stack.
