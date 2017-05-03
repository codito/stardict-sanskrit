# User instructions
## Grab latest files to use for with my stardict compatible program.
Options:
* Just download and extract [all_dicts_stardict_sanskrit.tar.gz](https://archive.org/download/stardict_collections/all_dicts_stardict_sanskrit.tar.gz)
* `git clone --depth 1 https://github.com/sanskrit-coders/stardict-sanskrit.git`

## Dictionary program recommendations and download help for mobile devices
* <https://sites.google.com/site/sanskritcode/dictionaries>

# Developer instructions
## Initial  setup.
* Extract the latest stardict tools package (<https://sourceforge.net/projects/stardict-4/files/3.0.1/stardict-tools-3.0.1.tar.bz2/download>) in ~/stardict/tools directory. Then do `cd stardict/tools` and build it (Run `./configure` and `make` as described in the INSTALL file in the directory - but don't remove the compiled binaries from the src directory.).
  * A shortcut if you are running Linux on a 64 bit computer: Just `git clone --depth 1 https://github.com/sanskrit-coders/stardict` in your home directory.
* Clone <https://github.com/sanskrit-coders/sanskritnlpjava> in your home directory.
* Clone this repo. (You can use `git clone --depth 1 https://github.com/sanskrit-coders/stardict-sanskrit.git` to get just the latest files.)

## Update dictionary files
With `sa-vyAkaraNa/laghu-kaumudi/laghu-kaumudi.babylon` as an example:
* If the scripts have changed in some way (You can do this anyway - won't hurt.)
	* do `rm -r /tmp/scala*`.
	* Update the repositories mentioned in the Initial setup section.
		* An easy way to do this is to run: `~/stardict-sanskrit/sync_all_repos.sh "git pull"`
* Update the babylon file.
* Change directory to sa-vyAkaraNa.
* Run: make DICTS='laghu-kaumudi'. This will run the commands listed in sa-vyAkaraNa/makefile sequentially. All dictionaries and tars under sa-vyAkaraNa will be rebuilt as of 20160321.
* Watch out for errors and warnings.
* If you are satisfied with the output, add (preferably only the files you intended to change), commit and push. If not, open an issue.
* [Optional but preferred] Create a new release, and use those files!
  * Creating a new release ( [guide](https://help.github.com/articles/creating-releases/)).
    * Just drag and drop the relevant tar.gz files as release artifacts.
    * Make sure to add ALL the tar.gz files under the directory where you run the `make tarlist` command described below.
  * Example invocation, if the release you create is `2017-04-14`:
    * `make tarlist URL="https://github.com/sanskrit-coders/stardict-sanskrit/releases/download/2017-04-14/"`
    * You can get the URL portion above from the download URL of any artifact in the release page.
  * Remove tars once they're moved to release and you are satisfied that all is well. They can just be deleted by the contributor without checking them in (+ git rm for older files).
  * Reason why this is preferred:
    * Helps track dictionary popularity and downloads (see [this issue](https://github.com/sanskrit-coders/stardict-dictionary-updater/issues/12) ).
    * This is likely to result in fewer download problems as downloading from release rather than "raw" might be more robust.
* Update the all_dicts file.
  * Compress all the necessary files with `make tarall` invoked in the root directory.
  * Upload to archive (example: [all_dicts_stardict_sanskrit.tar.gz](https://archive.org/download/stardict_collections/all_dicts_stardict_sanskrit.tar.gz)).

### To force update dictionary files
Sometimes the above may fail due to the script being fooled by the timestamps into thinking that no updates are required. To force updates in such cases (With `sa-vyAkaraNa/laghu-kaumudi/laghu-kaumudi.babylon` as an example):
* Delete these files: `sa-vyAkaraNa/laghu-kaumudi/*.babylon sa-vyAkaraNa/laghu-kaumudi/*.ifo sa-vyAkaraNa/tars/laghu-kaumudi*.tar.gz`
* Redo the process described above.

## Dictionary popularity metrics
* For properly *release*ed dictionaries, one can get stats as [shown here](http://mmilidoni.github.io/github-downloads-count/).

## Other notes
Recipe to convert decompiled en-head dictionaries from ajita to sa-head dictionaries: ^.+\t(.+?)\.  should be replaced by \1\t

## Cologne to babylon convertor
https://github.com/sanskrit-lexicon/cologne-stardict - make_babylon.py is the workhorse.

