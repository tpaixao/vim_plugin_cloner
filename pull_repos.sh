#/bin/bash

#echo $#;

if [ $# != 1  ]
then 
	bundle_dir=$(pwd)
else
	bundle_dir=$(pwd)"/"${1}
fi

#echo ${bundle_dir};

#IFS="\ ";

for dir in $(ls -d ${bundle_dir}*/)
do
	#echo ${dir};
	cd $dir;
	echo "Updating: " "${dir}";
	repo_address=$(git pull);
	#echo ${repo_address};
	#read dummy fetch_addr dummy dummy push_addr dummy <<<${repo_address};
	#echo ${fetch_addr};
done

