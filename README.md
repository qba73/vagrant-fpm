# vagrant-fpm
Multiple environments for creating deb packages using fpm.

## How to use it?
### Vagrant 
Start vagrant environment
```bash
$ cd vagrant
$ vagrant up
$ vagrant ssh
$ cd /vagrant/
```
Check fpm version:
```bash
vagrant@vagrant-ubuntu-precise-64:/vagrant$ fpm --version
1.5.0
```
Download and unzip Packer
```bash
vagrant@vagrant-ubuntu-precise-64:/vagrant$ wget https://releases.hashicorp.com/packer/0.10.0/packer_0.10.0_linux_amd64.zip
vagrant@vagrant-ubuntu-precise-64:/vagrant$ unzip packer_0.10.0_linux_amd64.zip
```
Copy packer binary to /usr/bin and run fpm
```bash
vagrant@vagrant-ubuntu-precise-64:/vagrant$ sudo cp packer /usr/bin/
vagrant@vagrant-ubuntu-precise-64:/vagrant$ fpm -s dir -t deb -n "packer" -v 0.10.0 /usr/bin/packer
Created package {:path=>"packer_0.10.0_amd64.deb"}
```
Verify Packer debian package is created
```bash
vagrant@vagrant-ubuntu-precise-64:/vagrant$ ls -l
-rwxr-xr-x 1 vagrant vagrant 41684248 Mar 15 04:05 packer
-rw-r--r-- 1 vagrant vagrant  8823254 May  2 17:30 packer_0.10.0_amd64.deb
-rw-r--r-- 1 vagrant vagrant  8821665 Mar 15 04:28 packer_0.10.0_linux_amd64.zip
-rw-r--r-- 1 vagrant vagrant      402 May  2 13:30 Vagrantfile
```

### Packer
```bash
todo
```

### Docker
Start vagrant env with docker
```bash
cd docker
vagrant up
vagrant ssh
```
Pull docker image with Ruby & fpm installed (ubuntu:16.04)
```bash
docker pull qba73/fpm
```
Download Packer from Hashicorp
```bash
wget https://releases.hashicorp.com/packer/0.10.0/packer_0.10.0_linux_amd64.zip
unzip packer_0.10.0_linux_amd64.zip
cp packer /hashicorp
```
Run docker container and build debian package
```bash
cd fpmbuild
$ ./fpm.sh -p=packer -v=0.10.0
Building packer debian package version 0.10.0 ...
Created package {:path=>"packer_0.10.0_amd64.deb"}
```
Verify package is created
```bash
$ ls -l hashicorp/
total 49328
-rwxr-xr-x 1 vagrant vagrant 41684248 May  2 15:08 packer
-rw-r--r-- 1 vagrant vagrant  8823710 May  2 17:23 packer_0.10.0_amd64.deb
-rw-r--r-- 1 vagrant vagrant        0 May  2 17:11 README.md
```



