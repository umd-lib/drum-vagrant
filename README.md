# mdsoar-vagrant

MD-SOAR development Vagrant environment

## Prerequisites

- [MD-SOAR source code](https://github.com/umd-lib/mdsoar)
- [MD-SOAR environment](https://github.com/umd-lib/mdsoar-env)
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

The bootstrap provisioning script will pick up any `jdk-*.tar.gz` file, but note
that production is currently using Java 7u75, so that is the recommended version
to use for local development.

The [Vagrantfile](Vagrantfile) expects the [MD-SOAR source repo](https://github.com/umd-lib/mdsoar)
to be on your host machine at `/apps/git/mdsoar`, and the
[MD-SOAR environment repo](https://github.com/umd-lib/mdsoar-env) to be at `/apps/git/mdsoar-env`.

## Usage

Following the DSpace documentation conventions, `[dspace-source]` indicates the directory that you have the
[MD-SOAR](https://github.com/umd-lib/mdsoar) source code in.

```
$ git clone https://github.com/peichman-umd/mdsoar-vagrant.git

# download an Oracle JDK to mdsoar-vagrant/dist (see the "Prerequisites"
# section above for more information)

$ cp mdsoar-vagrant/local.properties [dspace-source]
$ cd [dspace-source]
$ mvn package -Denv=local -Dmirage2.on=true
```
Then, from the `mdsoar-vagrant` directory:
```
$ vagrant up
$ vagrant ssh

vagrant@localhost$ cd /apps/mdsoar/dspace-installer
vagrant@localhost$ ant fresh_install
vagrant@localhost$ /apps/mdsoar/bin/dspace create-administrator

vagrant@localhost$ cd /apps/mdsoar/tomcat
vagrant@localhost$ ./control start

# After starting up Tomcat, you may want to run the following in a separate
# window, to monitor Tomcat's startup process:
vagrant@localhost$ tail -f /apps/mdsoar/tomcat/logs/catalina.out
```

You should now have a running DSpace/MD-SOAR installation at
<http://192.168.22.10:8080/>

# Using the local solr jetty instance:
Solr is started on system startup and the following can be done to stop/restart solr.

To stop: `$ /apps/solr-env/jetty/control stop`

To start:  `$ /apps/solr-env/jetty/control start`

Additionally, to update the solr on the vagrant machine with changes on the local machine, the following script can be used: `$ /vagrant/update-solr-env.sh`

## Redeploying

There is a convenience script, [deploy.sh](deploy.sh), that you can use to run
the `ant update_local` target and restart Tomcat. Note that it does not build
the application (you still need to do that yourself on the host using Maven),
nor does it create the administrator account.
