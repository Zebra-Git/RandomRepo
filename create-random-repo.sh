# 
#   Git Random Repo Script  
#   Author: Tieme van Veen 
# 
#   This script does the following: 

#   === Create a test repo ===
#   - Create a new folder 'testfolder'
#   - Create a new git repo and store it in bare-git-repo.git (this normally takes place at github) 

#   === Clone the repo, add some files ===
#   User A clones the repo, did some work, commits, pushes
#
#   - Clone the repo to "cloned-repo-A"
#   - Create 3 new files with some Lorem Ipsum
#   - Commit
#   - Create 2 new files with some Lorem Ipsum
#   - Commit
#   - Push
#   - cd ..

#   === Clone the repo again, add and edit some files ===
#   User B clones the repo, did some work, commits, pushes...
# 
#   - Pull 
#   - Clone the repo to "cloned-repo-B"
#   - Add some Lorem Ipsum to 3 exsisting files
#   - Commit
#   - Create 2 new files with some Lorem Ipsum
#   - Commit
#   - Push
#   - cd ..

#   === cd To first cloned repo  (cloned-repo-A) ===
#   ..... but In the mean time.. user A does some work.
#
#   - Add some Lorem Ipsum to 3 exsisting files
#   - Commit
#   - Removed a file, and add some Lorem Ipsum to 2 exsisting files
#   - Commit

#   At this point user A created a conflict because:

#   - He removed a file which was edited by user B
#   - He edited 2 files which were also edited by user B. 

mkdir testfolder

cd testfolder/
  mkdir bare-git-repo.git

  cd bare-git-repo.git
    git init --bare
    cd ..

echo -e "\n\033[1;0;31m    Bare repo created in bare-git-repo.git \033[0m\n"

git clone bare-git-repo.git/ cloned-repo-A

echo -e "\n\033[1;0;34m    cd ../cloned-repo-A \033[0m\n"

cd cloned-repo-A

  echo -e "\n\033[1;0;31m    Creating random1.txt file containing some lorem ipsum\033[0m\n"
  RAW_LIPSUM=$(curl -fsSkL "http://lorem-ipsum.me/api/text")
  echo $RAW_LIPSUM >> random1.txt


  echo -e "\n\033[1;0;31m    Creating random2.txt file containing some lorem ipsum\033[0m\n"
  RAW_LIPSUM=$(curl -fsSkL "http://lorem-ipsum.me/api/text")
  echo $RAW_LIPSUM >> random2.txt


  echo -e "\n\033[1;0;31m    Creating random3.txt file containing some lorem ipsum\033[0m\n"
  RAW_LIPSUM=$(curl -fsSkL "http://lorem-ipsum.me/api/text")
  echo $RAW_LIPSUM >> random3.txt

  echo -e "\n\033[1;0;34m    git add * \033[0m\n"

  git add *

  echo -e "\n\033[1;0;34m    git commit -am \"A1 - added random files 1,2,3\" \033[0m\n"

  git commit -am "A1 - added random files 1,2,3"



  echo -e "\n\033[1;0;31m    Creating random4.txt file containing some lorem ipsum\033[0m\n"
  RAW_LIPSUM=$(curl -fsSkL "http://lorem-ipsum.me/api/text")
  echo $RAW_LIPSUM >> random4.txt


  echo -e "\n\033[1;0;31m    Creating random5.txt file containing some lorem ipsum\033[0m\n"
  RAW_LIPSUM=$(curl -fsSkL "http://lorem-ipsum.me/api/text")
  echo $RAW_LIPSUM >> random5.txt

  echo -e "\n\033[1;0;34m    git add * \033[0m\n"

  git add *

  echo -e "\n\033[1;0;34m    git commit -am \"A2 - added random files 4,5\" \033[0m\n"

  git commit -am "A2 - added random files 4,5"

  echo -e "\n\033[1;0;34m    git push \033[0m\n"

  git push

  echo -e "\n\033[1;0;34m    cd .. \033[0m\n"
  
  cd ..

git clone bare-git-repo.git/ cloned-repo-B

echo -e "\n\033[1;0;34m    cd ../cloned-repo-B \033[0m\n"

cd cloned-repo-B

  echo -e "\n\033[1;0;34m    git pull \033[0m\n"

  git pull


  echo -e "\n\033[1;0;31m    Adding some paragraphs to random1.txt\033[0m\n"
  RAW_LIPSUM=$(curl -fsSkL "http://lorem-ipsum.me/api/text")
  echo $RAW_LIPSUM >> random1.txt


  echo -e "\n\033[1;0;31m    Adding some paragraphs to random2.txt\033[0m\n"
  RAW_LIPSUM=$(curl -fsSkL "http://lorem-ipsum.me/api/text")
  echo $RAW_LIPSUM >> random2.txt


  echo -e "\n\033[1;0;31m    Adding some paragraphs to random3.txt\033[0m\n"
  RAW_LIPSUM=$(curl -fsSkL "http://lorem-ipsum.me/api/text")
  echo $RAW_LIPSUM >> random3.txt

  git add *

  echo -e "\n\033[1;0;34m    git commit -am \"B1 - Added some lorem to 1,2,3\" \033[0m\n"

  git commit -am "B1 - Added some lorem to 1,2,3"


  echo -e "\n\033[1;0;31m    Creating random6.txt file containing some lorem ipsum\033[0m\n"
  RAW_LIPSUM=$(curl -fsSkL "http://lorem-ipsum.me/api/text")
  echo $RAW_LIPSUM >> random6.txt


  echo -e "\n\033[1;0;31m    Creating random7.txt file containing some lorem ipsum\033[0m\n"
  RAW_LIPSUM=$(curl -fsSkL "http://lorem-ipsum.me/api/text")
  echo $RAW_LIPSUM >> random7.txt

  echo -e "\n\033[1;0;34m    git add * \033[0m\n"

  git add *

  echo -e "\n\033[1;0;34m    git commit -am \"B2 - Created random files 6,7\" \033[0m\n"

  git commit -am "B2 - Created random files 6,7"

  echo -e "\n\033[1;0;34m    git push \033[0m\n"

  git push

  echo -e "\n\033[1;0;34m    cd .. \033[0m\n"

  cd ..

echo -e "\n\033[1;0;34m    cd ../cloned-repo-A \033[0m\n"

cd cloned-repo-A


  echo -e "\n\033[1;0;31m    Adding some paragraphs to random4.txt\033[0m\n"
  RAW_LIPSUM=$(curl -fsSkL "http://lorem-ipsum.me/api/text")
  echo $RAW_LIPSUM >> random4.txt

  echo -e "\n\033[1;0;34m    git add * \033[0m\n"

  git add *

  echo -e "\n\033[1;0;34m    git commit -am \"A3 - Random4.txt updated\" \033[0m\n"

  git commit -am "A3 - Random4.txt updated"

  rm random1.txt

  echo -e "\n\033[1;0;31m    Adding some paragraphs to random2.txt\033[0m\n"
  RAW_LIPSUM=$(curl -fsSkL "http://lorem-ipsum.me/api/text")
  echo $RAW_LIPSUM >> random2.txt


  echo -e "\n\033[1;0;31m    Adding some paragraphs to random3.txt\033[0m\n"
  RAW_LIPSUM=$(curl -fsSkL "http://lorem-ipsum.me/api/text")
  echo $RAW_LIPSUM >> random3.txt

  echo -e "\n\033[1;0;34m    git add * \033[0m\n"

  git add *

  echo -e "\n\033[1;0;34m    git commit -am \"A4 - random1.txt, updated random files 2,3\" \033[0m\n"

  git commit -am "A4 - random1.txt, updated random files 2,3"





