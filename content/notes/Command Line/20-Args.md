---
title: 20. Args
date: 2019-02-07
weight: 20
---

## Shell

```sh
# getopts
# : after letter indicates it requires arguments
while getopts ":a:" opt; do
  case $opt in
    a)
      echo "-a was triggered, Parameter: $OPTARG" >&2
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

# getopt
```

## Python

argparse
