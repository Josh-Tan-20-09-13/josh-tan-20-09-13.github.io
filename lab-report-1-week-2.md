# CSE 15L - First Lab Report

![VSCode Website](/assets/01.png)  
Visit the Visual Studio Code website [here](https://code.visualstudio.com/) and hit the download button on the top right corner. Select the version of VSCode that is most suitable for your computer. In my case, I will be selecting the windows system installer.  
![VSCode Download](/assets/02.png)  
When the download is finished, I run VSCode to open it and open up the terminal with the shortcut ``ctrl + shift + ` ``  
![VSCode Download](/assets/03.png)  
After this, I can open up command line and type the command `ssh <USERNAME>@<HOSTNAME>` where I replace the username with my username and the hostname with `ieng6.ucsd.edu`. Upon entering this command, I will be prompted with a password login prompt: the password I type is not displayed to standard output to prevent shoulder surfing.  
![SSH Login](/assets/04.png)  
After logging in, I have access to the shell on linux machines in the ieng6.ucsd.edu cluster. Here, I run some commands such as `cat` to deonstrate I am in the Linux environment.  
![SSH Commands](/assets/05.png)  
Next, I move files over to the linux systems using scp, otherwise known as secure copy protocol. In the image, I move `whereami.java` to the linux machines and compile it on the server. Running it shows that I am executing the file as the linux user and that I am on the linux environment.  
![SCP File](/assets/06.png)  
Following this, I will create an SSH key for passwordless login. This is where I provide the server with my public key, which will verify my identity with my private key and allow me to login without a password. I create my key pair below.  
![SSH Keygen](/assets/07.png)  
After this, I can add my public key to the authorized keys in `~/.ssh/authorized_keys` on the server by using scp to move my public key to the server or use the `ssh-copy-id` command. The full command for me would be `ssh-copy-id -i /tmp/id_rsa.pub <USERNAME>@<HOSTNAME>` where I replace username with my username and hostname with `ieng6.ucsd.edu`. After this is done, I am able to successfully login without the password prompt.  
![SSH Key Login](/assets/08.png)  
To end, I demonstrate that I am aware about features within shell such as piping to take the standard output of one command and using it as standard input for another as shown below. Although the command `grep root /etc/passwd` could be called instead of using a pipe, that does not demonstrate the shell feature. In addition, the image below also depicts how shell commands can follow an order of operations when grouped. The `time` command gets the total runtime of both the cat command and the grep thanks to this grouping.  
![Optimize Running](/assets/09.png)  
The next image is me running a commands remotely as a one-liner rather than loging into shell and manually typing in the commands. I total, this adds 1 character for ever new command I need to enter as a semicolon and saves me the hassle of needing to type in my password if I did not already have an authorized SSH key on the system. Aside from that, the only time lost would be the delay during for which the requests will be handled. The command I ran is 26 characters long and typing it out manually would result in 23 characters excluding the return keystroke.
![Remote Running](/assets/10.png)
The time spent running the command on the server using a command is identical to if I were to run the commands through shell after logging in.
![Time Command](/assets/11.png)
Frankly, I do not see a way to get this process under 10 key presses and mouse clicks when you include typing out the ssh login command. That itself is 25 characters. However, I could create a shell script the login process so it is saved by creating the following file and giving me the login in 4 charaters at minimum when I name it a single character filename.
```
#!/bin/bash
ssh <USERNAME>@<HOSTNAME> "${@}"
```
![Pleasant Running](/assets/12.png)
