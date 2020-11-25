
# Download the nersc metadata for each genome
wget https://portal.nersc.gov/GEM/genomes/genome_metadata.tsv

# Check the column names 
csvtk headers -t genome_metadata.tsv

# Observe some of the values to have an idea how it is coded 
csvtk cut -f completeness,ecosystem_type,taxonomy  -t genome_metadata.tsv  | csvtk head

# Filter out the values we are interested 
# In my case, MAGs with a completeness over 70 and from Marine environments
csvtk filter -f "completeness>=70" -t genome_metadata.tsv | \
    csvtk grep -t  -p Marine -f ecosystem_type | \
    csvtk  uniq > marine_mags_gemdb.tsv

# Create the dir where we will save all the results 
mkdir faa
mkdir fna
mkdir ffn

# Download individually all the values 
for genome_name in $(cut -f1,1 marine_mags_gemdb.tsv | sort -u );
do
    wget -P faa/ https://portal.nersc.gov/GEM/genomes/faa/${genome_name}.faa.gz;
    wget -P fna/ https://portal.nersc.gov/GEM/genomes/fna/${genome_name}.fna.gz;
    wget -P ffn/ https://portal.nersc.gov/GEM/genomes/ffn/${genome_name}.ffn.gz;

done;



