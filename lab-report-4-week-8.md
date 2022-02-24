# CSE 15L - Lab Report 4
Reviewed Markdown Parse [repo](https://github.com/ucsd-cse15l-w22/markdown-parse) with the code [here](https://github.com/Josh-Tan-20-09-13/markdown-parse/tree/main/ucParse)
Personal Markdown Parse [repo](https://github.com/Josh-Tan-20-09-13/markdown-parse) with the code [here](https://github.com/Josh-Tan-20-09-13/markdown-parse/tree/main/regexParse)
# Snippet 1
Image of expected markdown:  
![Snippet 1](/lab4-assets/snip1.png)

## Reviewed Code
Code for Test:  
![Snip1 Code](/lab4-assets/ucsnip1.png)
Test Result:  
![Snip1 Test](/lab4-assets/uctest1.png)
## Personal Code
Code for Test:  
![Snip1 Code](/lab4-assets/psnip1.png)
Test Result:  
![Snip1 Test](/lab4-assets/ptest1.png)

# Snippet 2
Image of expected markdown:  
![Snippet 2](/lab4-assets/snip2.png)

## Reviewed Code
Code for Test:  
![Snip2 Code](/lab4-assets/ucsnip2.png)
Test Result:  
![Snip2 Test](/lab4-assets/uctest2.png)
## Personal Code
Code for Test:  
![Snip2 Code](/lab4-assets/psnip2.png)
Test Result:  
![Snip2 Test](/lab4-assets/ptest2.png)

# Snippet 3
Image of expected markdown:  
![Snippet 3](/lab4-assets/snip3.png)

## Reviewed Code
Code for Test:  
![Snip3 Code](/lab4-assets/ucsnip3.png)
Test Result:  
![Snip3 Test](/lab4-assets/uctest3.png)
## Personal Code
Code for Test:  
![Snip3 Code](/lab4-assets/psnip3.png)
Test Result:  
![Snip3 Test](/lab4-assets/ptest3.png)

# Responses
1. The change to fix this should be fairly simple given the implementation of my current code. I can think of two ways of potentially fixing this problem: either adjusting the regular expression to verify that the block does not appear within code backticks, or I can change the logic in the code to filter out all text appearing between code blocks. I think the more sensible solution would be the latter since the regular expression pattern could potentially pick up links outside of two code blocks.
2. For the second snippet, the only problem is that links with parenthesis in the link. I believe the best solution here would be to adjust my regular expression pattern accordingly in order to account for the inner parenthesis. To do so, I need to adjust my code accordingly to not split the string by the `(` character. If the regular expression does not work, I may need to incorporate logic within the pattern so that the regex gets all possible links and there is further logic to confirm if the link is valid; this more complicated solution would most likely exceed the 10 line limit.
3. This can be fixed by adjusting the regular expression to also include the search 0 or 1 newlines in the search for links. This should be a fairly easy fix in the regular expression.
