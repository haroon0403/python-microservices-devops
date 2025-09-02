Git 

cd /path/to/your/project

Step 1: Initialize Git in your project

git init

Step 2: Add all files to Git

git add .

Step 3: add Github User details

git config --global user.email "khanharoon138@gmail.com"
git config --global user.name "Haroon"

step 4: Commit your changes

git commit -m "Initial commit"

Step 5: Add GitHub as remote

git remote add origin https://github.com/yourusername/my-project.git


Verify remote:

git remote -v

Step 6: Push your code

git branch -M main
git push -u origin main --force
