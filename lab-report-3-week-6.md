# CSE 15L - Lab Report 3
## Option 1 - Streamlining SSH Login  
![Configuration](/lab3-assets/config.png)  
The following is my ssh configuration I have setup. I have more configurations for my personal use which I do not want to divulge the information of. I probably should use a different ssh hostkey since `~/.ssh/id_rsa` is the default one and will be used anyway.  
![Login](/lab3-assets/login.png)  
Here I log in to the ieng6 server with the host specified in the configuration. No login is required since I have my SSH key login setup.  
![SCP](/lab3-assets/scp.png)  
I create an empty file with a very unique filename for easy identification and SSH in to show that the file was not planted on the system. I then demonstrate myself using scp to copy the file to the server and show that it was successfully copied in.
