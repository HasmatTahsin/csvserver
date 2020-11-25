
#!/bin/bash

{
for i in $(seq 0 10)
do
  echo "$i, $RANDOM"
done
} > inputFile
chmod +r inputFile
cat inputFile