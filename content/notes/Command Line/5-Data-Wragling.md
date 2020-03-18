---
title: 5. Data Wragling
date: 2020-03-17
weight: 5
---

## Text handling

```sh
more
less
tac
head -n5
tail -n5
sed 's/.*Disconnected from//' # or gsed in mac
sed 's/[ab]//g'
sed -E 's/.*Disconnected from (invalid )?user .* //'
wc -l
sort -nk1,1 # numeric, column 1 to 1
uniq -c
awk '{print $2}' # print the second column
awk 'BEGIN { rows = 0 } $1 == 1 && $2 ~ /^c.*e$/ {rows += 1} END {print rows}'
cat file | paste -sd, # seperate by .
```

## Math handling

```sh
echo "1 + 2" | bc -l
```