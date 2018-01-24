#/bin/bash

#first argument should be a file listing the repos

if [ $# != 1  ]
then 
	echo "Usage: "$0" REPO_LIST";
	echo "You need to provide 1 file with a list of repos"
	exit 1;
else
	repo_list=$1;
fi

#echo ${bundle_dir};

#IFS="\ ";

for repo in $(cat ${repo_list})
do
	#echo ${dir};
	echo "Cloning: " "${repo}";
	repo_address=$(git clone ${repo});
done

