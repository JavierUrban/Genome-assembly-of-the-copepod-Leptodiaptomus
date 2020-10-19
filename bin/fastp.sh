#!/bin/bash

##fastp is a software that performs a rapid assessment of quality and trimming of raw sequences in FASTQ format
fastp -i ../meta-data/20190402_AAlcantara.fastq -o ../results/20190402_AAlcantara_fastp.fastq --verbose --thread=8 \
--qualified_quality_phred=7 --low_complexity_filter --complexity_threshold=40 --correction \
--overlap_len_require=30 --overlap_diff_limit=3 --trim_poly_x --poly_x_min_len=20 --trim_poly_g \
--poly_g_min_len=20 --overrepresentation_analysis --overrepresentation_sampling=20 --report_title=report_qc \
--html=report_qc_html
