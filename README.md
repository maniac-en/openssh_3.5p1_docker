# openssh_3.5p1_docker

### Note: This is a vulnerable software, and should not be used in any production enviornment. Use it at your own discretion!

## Why did we make this?
#### I wanted to reproduce an exploit, and in the process I found there's no script/blog that  helps us to build and install it without any issues! I did find one which was very helpful though it still needed a lot of work! Hence I made this! Have fun :)

##### Link to the blog: http://www.unixwiz.net/techtips/openssh.html

## Usage
```bash
docker build -t ssh_3.5p1 .
docker run -it -d --name test_ssh_3.5p1 ssh_3.5p1

#IP is your docker ip, and password is 'password'
ssh -oKexAlgorithms=+diffie-hellman-group1-sha1 -oCiphers=aes128-ctr,aes192-ctr,aes256-ctr,aes128-cbc,3des-cbc n00b@IP
```

## Contributors
- [maniac-en](https://github.com/maniac-en/)
- [holmes-py](https://github.com/holmes-py/)
