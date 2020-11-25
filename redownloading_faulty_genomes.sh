ls faa/ | sed 's/.faa.gz//g' | sort > gen_faa.txt
ls fna/ | sed 's/.fna.gz//g' | sort > gen_fna.txt
ls ffn/ | sed 's/.ffn.gz//g' | sort > gen_ffn.txt

csvtk cut -f genome_id -t marine_mags_gemdb.tsv | csvtk del-header | sort -u  > all_genome_ids.txt

wc -l all_genome_ids.txt
wc -l gen_faa.txt 
wc -l gen_fna.txt
wc -l gen_ffn.txt 

echo "How many had problems?"
diff -u gen_faa.txt all_genome_ids.txt | grep -E "^\+[0-9]" | wc -l
diff -u gen_fna.txt all_genome_ids.txt | grep -E "^\+[0-9]" | wc -l
diff -u gen_ffn.txt all_genome_ids.txt | grep -E "^\+[0-9]" | wc -l


diff -u gen_faa.txt all_genome_ids.txt | grep -E "^\+[0-9]" | sed 's/\+//g' > new_faa.txt 
diff -u gen_fna.txt all_genome_ids.txt | grep -E "^\+[0-9]" | sed 's/\+//g' > new_fna.txt 
diff -u gen_ffn.txt all_genome_ids.txt | grep -E "^\+[0-9]" | sed 's/\+//g' > new_ffn.txt 


# This is uuuuugllyyy but I won't spend more time in it :) 
for genome_name in $(cat new_faa.txt);
do
    wget -P faa/ https://portal.nersc.gov/GEM/genomes/faa/${genome_name}.faa.gz;

done;

for genome_name in $(cat new_fna.txt);
do
    wget -P fna/ https://portal.nersc.gov/GEM/genomes/fna/${genome_name}.fna.gz;

done;

for genome_name in $(cat new_ffn.txt);
do
    wget -P ffn/ https://portal.nersc.gov/GEM/genomes/ffn/${genome_name}.ffn.gz;
done;


rm gen_* 
rm new* 
rm all_genome_ids.txt
