# CSE 15L - Lab Report 2
## A Quick Note
The following is the main commit which solved the majority of issues with the original program.
![Main Commit](/lab2-assets/main_commit.png)
Initially, the only problem I had with the program was that it considered images as links. The following writeup includes artificially created problems by modifying the code.

The main change that I made was during week 3 lab where I scrapped the initial system of finding links and replaced it with my own at [this commit](https://github.com/Josh-Tan-20-09-13/markdown-parse/commit/a1f1ee60bf01305ffc4f4df8c6ffe6be3be6fdb4) which was when the debugging topic was introduced: I do not think it was intended for this program to be functional by the end of that session since the lab report was introduced 2 weeks later.
In addition to performing a complete overhaul of the code, a few more test markdown files were added:
![Problem Cases](/lab2-assets/05.png)  

### Hangups
As you can see, the program hangs up on running:  
Hangups also occur due to messy and weird/invalid markdown such as a `](` in the middle of the file or newlines so the loop in the initial code did not ever complete.  
This was a problem for all the files in the [default test files](https://github.com/Josh-Tan-20-09-13/markdown-parse/tree/main/default-files) and my [custom test files](https://github.com/Josh-Tan-20-09-13/markdown-parse/tree/main/markdown-files).  
![Hangup](/lab2-assets/06.png)  

The two main non-hangups or misidentified links that produced errors are as shown below:  
![Errors](/lab2-assets/07.png)  

This change was made in the week 3 session in the commit below:  
![Main Commit](/lab2-assets/08.png)  

This commit completely changes the way which the program finds all the links within the file. Errors like this are produced because the program saw the brackets and identified as a link, but the markdown file did not have a complete link. The opposite applied for links with solely parenthesis to signify a link destination but no text.  
![Reverse](/lab2-assets/09.png)  

The bugs in the programming would be how the parsing was handled. Such as the while loop being used, which is what caused the hangups. A for loop was switched for it so that all items within the file would be processed once and remove this issue. Faulty user input was when the markdown had syntax errors and is related to a bug regarding how the program read through the file. A symptom would be when a user enters in a markdown file which is not supposed to have a link such as `test-file5` yet the program still picks up on it anyway and returns something it should not.  

### Images
After lab on week 5, I received confirmation from my TA that images were not supposed to be recognized as links, so [this commit](https://github.com/Josh-Tan-20-09-13/markdown-parse/commit/9638f010adefaa47c9a576324ef368648e1efe70) fixed the bug. Specifically, this fixed the problem with [test file 6](https://github.com/Josh-Tan-20-09-13/markdown-parse/blob/main/default-files/test-file6.md) returning a link when nothing should be returned.  

![Test 6 Fail](/lab2-assets/test6.png)  

The bug here is that the code initially did not check if the format for a link began with a bang, so it would interpret images as links as well, which led to the symptom of the link being displayed on the terminal even when nothing was supposed to be present. This was fixed by adding a negative lookbehind to the regex that I used to check link formatting to ensure that symbol does not appear beforehand.

### Uneven Brackets
One of the problems that was encountered fairly early was the program being unable to process text where there was not closing brackets and parenthesis in the markdown or when there were grouping symbols within the link text or when there was syntax signifying the beginning of a link but no end. This was in a very early version of the program that was removed and changed in [this commit](https://github.com/Josh-Tan-20-09-13/markdown-parse/commit/a1f1ee60bf01305ffc4f4df8c6ffe6be3be6fdb4).  
The following default files were the main offenders to this problem: [test 3](https://github.com/Josh-Tan-20-09-13/markdown-parse/blob/main/default-files/test-file3.md), [test 4](https://github.com/Josh-Tan-20-09-13/markdown-parse/blob/main/default-files/test-file4.md), [test 5](https://github.com/Josh-Tan-20-09-13/markdown-parse/blob/main/default-files/test-file5.md), [test 7](https://github.com/Josh-Tan-20-09-13/markdown-parse/blob/main/default-files/test-file7.md).

The majority of these problems were fixed by changing the while loop in the original code to a for loop to prevent hangups. This solves the problem when there are mismatched grouping symbols but does not solve the problem with nested ones.

The following custom markdown files cause those issues mentioned above: [another](https://raw.githubusercontent.com/Josh-Tan-20-09-13/markdown-parse/main/markdown-files/another.md), [problem](https://raw.githubusercontent.com/Josh-Tan-20-09-13/markdown-parse/main/markdown-files/new.md), [here](https://raw.githubusercontent.com/Josh-Tan-20-09-13/markdown-parse/main/markdown-files/othercase.md)  

As seen here, the domains have random characters in them: ![No Regex](/lab2-assets/bug.png)

The bug with these files is that the program originally searched for a closing grouping symbol in order to terminate it's search, so it would hang up and keep on running. There was a change made after this or select link in the program that was completely bogus. The resulting symptom would be an incorrect link being displayed or the program hanging up as seen in the 1st problem of this lab. 
