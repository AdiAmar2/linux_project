git init
git remote add origin https://github.com/AdiAmar2/linux_project.git
echo "This is a demo file" > demo.txt

git add .
git commit -m "Initial commit"

git branch BR_101
git branch BR_102

git checkout BR_101

echo "Changes in BR_101" >> demo.txt

./commit.sh "Fixed the login page layout"

git checkout BR_102

echo "Changes in BR_102" >> demo.txt

./commit.sh "Added error handling"