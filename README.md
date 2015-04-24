# mdsoar-vagrant

MD-SOAR development Vagrant environment

## Prerequisites

- VirtualBox
- Vagrant
- Maven 3

## Usage

Following the DSpace documentation conventions, `[dspace-source]` indicates the directory that you have the
[MD-SOAR](https://github.com/umd-lib/mdsoar) source code in.

```
$ git clone https://github.com/peichman-umd/mdsoar-vagrant.git
$ cp mdsoar-vagrant/local.properties [dspace-source]
$ cd [dspace-source]
$ mvn package -Denv=local
```
Then, from the `mdsoar-vagrant` directory:
```
$ vagrant up
$ vagrant ssh
vagrant@localhost$ cd /apps/git/mdsoar/dspace/target/dspace-installer
vagrant@localhost$ /apps/apache-ant-1.9.4/bin/ant fresh_install
vagrant@localhost$ /apps/apache-tomcat-7.0.61/bin/startup.sh
vagrant@localhost$ /apps/mdsoar/bin/dspace create-administrator
```
