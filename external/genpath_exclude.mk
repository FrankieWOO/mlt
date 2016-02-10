genpath_exclude: genpath_exclude.zip
	rm -rf genpath_exclude && mkdir genpath_exclude
	cd genpath_exclude && unzip ../genpath_exclude.zip

clean-genpath_exclude:
