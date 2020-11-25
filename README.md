# download_GEMdb
Simple scripts to filter the Genome Earth Microbiome DB, selecting  and downloading MAGs of interest.

This is just an example in which I filtered for genome completeness and ecosystem. From here you can create your versions.

# Programs needed 

I used [csvtk](https://github.com/shenwei356/csvtk) to explore the dataset and select the variables of interest.

# How to use

The script [parsing_genomes.sh](https://github.com/adriaaula/download_GEMdb/blob/main/parsing_genomes.sh) downloads the genomes based in the specifications you want to filter out. And the script [redownloading](https://github.com/adriaaula/download_GEMdb/blob/main/redownloading_faulty_genomes.sh) checks if some of the
files run into trouble and downloads it again. 
