# CSE 15L - Lab Report 5
In order to find the difference between the two tests, I ran my markdown parse on all the tests and saved the standard output to a test file.  
I repeat this process by running the provided implementation on the test files and writing the standard output to another test file.  
I run diff on the two files to receive this [result](/lab5-assets/diff.md) when running `$ diff your_imp my_imp`  
I found my bugs by simply going from top to bottom and finding two pairs of test files with differing bugs  

# Bug 1
For the first bug, I get the first different result from test file 194 with the following contents:
```
[Foo*bar\]]:my_(url) 'title (with parens)'

[Foo*bar\]]
```
The problem with this bug is that none of the markdown parse implementations recognizes the notation in extended markdown for a footnote as specified [here](https://www.markdownguide.org/extended-syntax/#footnotes)  
Footnotes do not include parenthesis to denote the beginning and end of a link so both programs would need to be modified to detect the opening and closing brackets followed by either a parenthesis or a colon.  
My implementation identified no link as shown by `[]` and the given implementation decided that `[url]` was a link. In actuality, the link was supposed to be `[my_url(url)]`  
To begin with, none of the implementations recognize a colon following the square brackets as a link, so this is the first thing that needs to be addressed.  
This is the initial bug which prompts this error in both programs.  
However, my implementation suffers another bug where the program is unable to recognize nested parenthesis inside of a link: this is because I use regular expressions and I did not use a regular expression that accounts for multiple nested parenthesis.  
To fix this, I think that a negative lookahead can be placed before the search for parenthesis so that the program will get all included parenthesis but the last one.  

# Bug 2
The next bug I found was in test file 342 with the following contents:
```
[not a `link](/foo`)
```
This is not a link because the markdown file inludes part of the link in a code with a single backtick.
The expected result for this is `[]`. My program also provides `[]` but this is due to sheer coincidence and not intentional design whereas the provided implementation returns `[/foo\`]`  
The bug here is that the provided implementation only accounts for code blocks with three backticks and not code segments with a single backtick.  
To resolve this problem, there should also be code checking for code segments with a single backtick in addition to code checking for a code block with three backticks.  
This solution can also be used for my implementation of markdown parse.
