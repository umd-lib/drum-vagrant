# mdsoar-vagrant

MD-SOAR development Vagrant environment

## Prerequisites

- [MD-SOAR](https://github.com/umd-lib/mdsoar) source code
- VirtualBox
- Vagrant
- Maven 3
- Oracle JDK 7 tar.gz (to be installed into the VM)

Due to the need to manually click through Oracle's license agreement in order to
download a JDK, the JDK is not automatically fetched by the provisioning
scripts. Instead, manually download a tar.gz distribution for 64-bit Linux from
[Oracle's site](http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html)
and place it in a `dist/` subdirectory of the `mdsoar-vagrant` checkout
directory.

## Usage

Following the DSpace documentation conventions, `[dspace-source]` indicates the directory that you have the
[MD-SOAR](https://github.com/umd-lib/mdsoar) source code in.

```
$ git clone https://github.com/peichman-umd/mdsoar-vagrant.git

# download an Oracle JDK to mdsoar-vagrant/dist (see the "Prerequisites"
# section above for more information)

$ cp mdsoar-vagrant/local.properties [dspace-source]
$ cd [dspace-source]
$ mvn package -Denv=local
```
Then, from the `mdsoar-vagrant` directory:
```
$ vagrant up
$ vagrant ssh
vagrant@localhost$ cd /apps/git/mdsoar/dspace/target/dspace-installer
vagrant@localhost$ ant fresh_install
vagrant@localhost$ /apps/tomcat/bin/startup.sh
vagrant@localhost$ /apps/mdsoar/bin/dspace create-administrator
```
Before starting up Tomcat, you may want to run the following in a separate window,
to monitor Tomcat's startup process:
```
vagrant@localhost$ tail -f /apps/tomcat/logs/catalina.out
```

You should now have a running DSpace/MD-SOAR installation at <http://192.168.22.10:8080/>
