# RandomRepo
Run the script to create a random git repo with conflicts



To practise along, [https://github.com/tiemevanveen/RandomRepo/archive/master.zip download this shell script], unzip it and run it with ./create-random-repo.sh

The script does the following: 

### Create a test repo ###
* Create a new git repo and store it in bare-git-repo.git (this normally takes place at github)

### Clone the repo, add some files ###

User A clones the repo, does some work, commits, pushes

* Clone the repo to "cloned-repo-A"
* Create 3 new files with some Lorem Ipsum
* Commit
* Create 2 new files with some Lorem Ipsum
* Commit
* Push
* cd ..

### Clone the repo again, add and edit some files ###

User B clones the repo, does some work, commits, pushes...

* Pull 
* Clone the repo to "cloned-repo-B"
* Add some Lorem Ipsum to 3 exsisting files
* Commit
* Create 2 new files with some Lorem Ipsum
* Commit
* Push
* cd ..

### Move back to the first cloned repo and do some work ###

..... but In the mean time.. user A does some work.

* Add some Lorem Ipsum to 3 exsisting files
* Commit
* Removed a file, and add some Lorem Ipsum to 2 exsisting files
* Commit

## Conflict! ##

At this point the users created a conflict because:

* He removed a file which was edited by user B
* He edited 2 files which were also edited by user B. 

If we pull now a conflict will be shown:

<b>You can type along from here</b>

 	root@debian-iMac:/var/www/tests/testfolder/cloned-repo-A# git pull 
 
	 	CONFLICT (delete/modify): 
	 	random1.txt deleted in HEAD and modified in 794341b08b39dff7b327b24441f2d55e619881db. 
	 	Version 794341b08b39dff7b327b24441f2d55e619881db of random1.txt left in tree.
	 	
	 	Auto-merging random2.txt
	 	CONFLICT (content): Merge conflict in random2.txt
	 	
	 	Auto-merging random3.txt
	 	CONFLICT (content): Merge conflict in random3.txt
	 	
	 	Automatic merge failed; fix conflicts and then commit the result.
 	
 	root@debian-iMac:/var/www/tests/testfolder/cloned-repo-A# git status 
 
	 	# On branch master
	 	# Your branch and 'origin/master' have diverged,
	 	# and have 2 and 2 different commit(s) each, respectively.
	 	#
	 	# Changes to be committed:
	 	#
	 	#	new file:   random6.txt
	 	#	new file:   random7.txt
	 	#
	 	# Unmerged paths:
	 	#   (use "git add/rm <file>..." as appropriate to mark resolution)
	 	#
	 	#	deleted by us:      random1.txt
	 	#	both modified:      random2.txt
	 	#	both modified:      random3.txt


This shows the conflict in 3 files (random1,2,3.txt).

It also shows the other changed files from user B in the conflicted commit. 

If user B changes a lot of files in this commit, the list would be very long and it might looks disturbing but it isn't.

Think about it: when a conflict occurs, two commits need to be merged into one resulting commit. 

This status shows the changes from the commit's involved in the conflict.

## Solving the conflict ##

### The deleted file ###

The first one is easy, we have to tell git if we really want to delete random1.txt. (We chose to delete the file but user B changed the file in the meantime.) Use git add/rm here.
 
 	// to keep the file
 	git add random1.txt
 
 	// to remove the file
 	git rm random1.txt
 	 
    random1.txt: needs merge
    rm 'random1.txt'             //git confirms the deletion 

Lets keep the file since user's B new code might depend on it.

 git add random1.txt

### The mofified files ###

The files are listed in the same section but a simple 'git add/rm' won't work here.

If you open the file you can see the different versions of it. 

It might (a bit shortened) look like this:

 	root@debian-iMac:/var/www/tests/testfolder/cloned-repo-A# cat random2.txt 
	  	Lorem ipsum dolor sit amet, .....
	  	<<<<<<< HEAD
	  	Lorem ipsum dolor sit amet, consectetur adipisicing elit, odio aliquam distinctio.....
	  	######=
	  	Lorem ipsum dolor sit amet, consectetur adipisicing elit, animi aut libero, .....
	  	>>>>>>> b0e5f7abc3c35e00dac9ed2f3b9454f5b14e349e

We can now do different things to solve the merge. 
* Manually fix the problem
* Use the mergetool
* Tell git which version we want to keep

Let's go for the last option for now and lets keep our version of random2.txt and choose user B his version of random3.txt

	 git checkout --ours random2.txt
	 git checkout --theirs random3.txt

After this (or after fixing it with the mergetool or manually) we have to add the file to our to-be-created merge-commit

 	git add random2.txt random3.txt

### committing the merge ###

If we now check the status we see all the changes from both original commits in the staged area. 

 	root@debian-iMac:/var/www/tests/testfolder/cloned-repo-A# git status
	 	# On branch master
	 	# Your branch and 'origin/master' have diverged,
	 	# and have 2 and 2 different commit(s) each, respectively.
	 	#
	 	# Changes to be committed:
	 	#
	 	#	new file:   random1.txt
	 	#	modified:   random3.txt
	 	#	new file:   random6.txt
	 	#	new file:   random7.txt

That is not disturbing. The files won't show up in the final merge-commit.

Now we can commit the merge:

 	git commit -m "Merged commits from user A & B"
 
     	[master 1bc2467] Merged commits from user A & B

If we now inspect the log we won't see the files from user B's commit in the merge-commit:

 	root@debian-iMac:/var/www/tests/testfolder/cloned-repo-A# git log --graph --stat --oneline
 	
	 	*   1bc2467 merged
	 	|\  
	 	| * b0e5f7a B2 - Created random files 6,7
	 	| |  random6.txt |    1 +
	 	| |  random7.txt |    1 +
	 	| |  2 files changed, 2 insertions(+), 0 deletions(-)
	 	| |  
	 	| * b93f89d B1 - Added some lorem to 1,2,3
	 	| |  random1.txt |    1 +
	 	| |  random2.txt |    1 +
	 	| |  random3.txt |    1 +
	 	| |  3 files changed, 3 insertions(+), 0 deletions(-)
	 	| |  
	 	* | a39cd4d A4 - random1.txt, updated random files 2,3
	 	| |  random1.txt |    1 -
	 	| |  random2.txt |    1 +
	 	| |  random3.txt |    1 +
	 	| |  3 files changed, 2 insertions(+), 1 deletions(-)
	 	| |  
	 	* | 4b0f35c A3 - Random4.txt updated
	 	|/  
	 	|    random4.txt |    1 +
	 	|    1 files changed, 1 insertions(+), 0 deletions(-)
	 	|    
	 	* 0949c01 A2 - added random files 4,5
	 	|  random4.txt |    1 +
	 	|  random5.txt |    1 +
	 	|  2 files changed, 2 insertions(+), 0 deletions(-)
	 	|  
	 	* 2eebf28 A1 - added random files 1,2,3
	 	   random1.txt |    1 +
	 	   random2.txt |    1 +
	 	   random3.txt |    1 +
	 	   3 files changed, 3 insertions(+), 0 deletions(-)

Now our merge conflict is solved!
