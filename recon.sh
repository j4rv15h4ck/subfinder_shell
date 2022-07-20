#! /bin/bash

file="domains.txt"

if [ -f "$file" ] ; then
    rm "$file"
fi
read -p "Enter the domain: " dom
echo $dom
echo "################################################"
echo "Subdomain enumeration of domain $dom"
echo "################################################"
#using  assetfinder and sorting
assetfinder --subs-only $dom | sort -u | uniq > domain.txt
#finding live domain
echo " "
while read domain; do
	if curl -I "$domain" 2>&1 | grep -w "200\|301" ; then
		echo "$domain is up"
	else
		echo "$domain is down"

	fi
	echo "--------------------------------------------"
done < domain.txt