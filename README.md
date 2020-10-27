# Project2
Project 2 for IS 2043-004

This project creates a backup file for users using the bash shell. 

Method:
Using this link https://linuxconfig.org/bash-scripting-tutorial-for-beginners I was able to follow along and learn about scripting. It teaches the basisc, discusses what scripting is, what bash is, talks about file names and permissions, script execution, variables and how to declare them, functions, and much more. 

The first step was to open git-bash and start reading through the guide. I found it easiest to follow along one step at a time instead of reading the entire walkthrough and trying to do it all at once.

Problems:
I did run into some issues as this walktrhough looks as though it assumes you are using a linux based operating system (OS). Since I am on windows I had to make some modifications and changes to the code in small ways in order to make it work. Most notably I had to create two folders for it to look at/archive. One was named linuxconfig and the other was named Landan. These simulate the linux folders it would be looking for if I were named as user "Landan" in a linux environment. 

I actaully had to contact an old coworker to get help as I could not figure out the folder creating/file naming portion myself but he walked me through it and explained why I was running into errors like "No such file or directory" when I would try to run my script. Other than that I didn't really use any other resources as I have a decent working knowledge of linux thanks to my previous job. I did have to look up a few commands and what things did and I stumbled accross this page https://www.datarealm.com/blog/ten-of-the-best-cheat-sheets-for-first-time-linux-admins/ which was really helpful as it had multiple branching resources that helped me out. Overall this project was super interesting but way more challenging because of the one problem of files. I spent hours tinkering with my script before giving up and calling up my friend for help. 

Final thoughts:
I enjoyed this project even if it did frustrate me with something I couldn't figure out on my own. I have also uploade the entire folder with all the files I created/used/backed up here just in case anyone wants to see them and what I was working with. And as a safe place to store them in case my hard drive crashes.



Code Review (Hunter Sacky)
Hey Landan, I enjoyed reading through your code for this project. Your code was easy to read through and understand, I liked how you did some troubleshooting because the guide we were supposed to follow was intended for use in a Linux computer but you
did this project on a Windows computer. I do have a few suggestions for improvement in your code. The main one is to indent the code properly, it doesn't make a difference to the execution of the program but does help the readability. The other
main thing that I noticed was that you can backup standard Windows directories relatively easily. What I did in my code was just to backup the Desktop directory to the Documents directory. This is easy to do and should work on every machine. The
filepaths needed are /c/Users/$user/Desktop for the desktop folder and then /c/Users/$user/Documents for the documents folder. Other than that, the code was great and it worked flawlessly when I changed the file paths to something that I had on
my system. One thing I would add is see if you can add statistics on how many directories and files were backed up to the tarball file so that the user could know that the program successfully backed up their files. Good job!
