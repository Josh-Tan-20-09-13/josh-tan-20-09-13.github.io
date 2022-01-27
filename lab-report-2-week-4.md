# CSE 15L - Lab Report 2
Below are the commits that I made to finish the lab: there are a total of 4 of them for the week 4 lab.  
![First](lab2-assets/01.png)  
![Second](lab2-assets/02.png)  
![Third](lab2-assets/03.png)  
![Fourth Part 1](lab2-assets/04-1.png)  
![Fourth Part 2](lab2-assets/04-2.png)  
Really, the only problem that I had regarding the program was `test-file6.md` because I am unsure if the link to the image qualifies as a link or not that the program should detect. It is not a hyperlink, but it is still a link.  

The main change that I made was during week 3 lab where I scrapped the initial system of finding links and replaced it with my own at [this commit](https://github.com/Josh-Tan-20-09-13/markdown-parse/commit/a1f1ee60bf01305ffc4f4df8c6ffe6be3be6fdb4).  
These changes were made because of the test files as shown below:
![Problem Cases](lab2-assets/05.png)  

As you can see, the program hangs up on running:  
Hangups also occur due to messy and weird/invalid markdown such as a `](` in the middle of the file or newlines so the loop in the initial code did not ever complete.  
![Hangup](lab2-assets/06.png)  

The two main non-hangups or misidentified links that produced errors are as shown below:  
![Errors](lab2-assets/07.png)  

This change was made in the week 3 session in the commit below:  
![Main Commit](lab2-assets/08.png)  

This commit completely changes the way which the program finds all the links within the file. Errors like this are produced because the program saw the brackets and identified as a link, but the markdown file did not have a complete link. The opposite applied for links with solely parenthesis to signify a link destination but no text.  
![Reverse](lab2-assets/09.png)  

The bugs in the programming would be how the parsing was handled. Such as the while loop being used, which is what caused the hangups. A for loop was switched for it so that all items within the file would be processed once and remove this issue. Faulty user input was when the markdown had syntax errors and is related to a bug regarding how the program read through the file. A symptom would be when a user enters in a markdown file which is not supposed to have a link such as `test-file5` yet the program still picks up on it anyway and returns something it should not.  
