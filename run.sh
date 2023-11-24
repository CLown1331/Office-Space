#!/bin/bash

g++ gen.cpp -o gen
echo generator compiled
rm -rf Input Output testcase.zip
mkdir -p Input
mkdir -p Output
# exe, filename, seed, t_limit, n_limit, m_limit
# sample
./gen Input/input1.txt 137 3 5 5
./gen Input/input2.txt 452 3 5 5
./gen Input/input3.txt 5457 5 5 5
echo sample input generated
./gen Input/input4.txt 1347 5 25 25
./gen Input/input5.txt 425 5 50 50
./gen Input/input6.txt 557 5 100 100
echo small input generated
./gen Input/input7.txt 13347 10 2000 2000
./gen Input/input8.txt 42325 10 2000 2000
./gen Input/input9.txt 55357 10 2000 2000
echo medium input generated
g++ sol.cpp -o sol
echo solution compiled
# sample
./sol < Input/input1.txt > Output/output1.txt
./sol < Input/input2.txt > Output/output2.txt
./sol < Input/input3.txt > Output/output3.txt
echo sample output generated
./sol < Input/input4.txt > Output/output4.txt
./sol < Input/input5.txt > Output/output5.txt
./sol < Input/input6.txt > Output/output6.txt
echo small output generated
./sol < Input/input7.txt > Output/output7.txt
./sol < Input/input8.txt > Output/output8.txt
./sol < Input/input9.txt > Output/output9.txt
echo medium output generated
zip testcase.zip Input/* Output/* Config.json
echo testcase zipped


echo "# **Sample Input**" > sample.md
echo "\`\`\`" >> sample.md
cat Input/input1.txt >> sample.md
echo "\`\`\`" >> sample.md
echo "\`\`\`" >> sample.md
cat Input/input2.txt >> sample.md
echo "\`\`\`" >> sample.md
echo "\`\`\`" >> sample.md
cat Input/input3.txt >> sample.md
echo "\`\`\`" >> sample.md

echo "" >> sample.md
echo "# **Sample Output**" >> sample.md
echo "\`\`\`" >> sample.md
cat Output/output1.txt >> sample.md
echo "\`\`\`" >> sample.md
echo "\`\`\`" >> sample.md
cat Output/output2.txt >> sample.md
echo "\`\`\`" >> sample.md
echo "\`\`\`" >> sample.md
cat Output/output3.txt >> sample.md
echo "\`\`\`" >> sample.md
