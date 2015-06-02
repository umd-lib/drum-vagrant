class { 'postgresql::globals':
    manage_package_repo => true,
    version             => '9.4',
}->
class { 'postgresql::server': }

# PostgreSQL setup based on DSpace documentation
# https://wiki.duraspace.org/display/DSDOC5x/Installing+DSpace
postgresql::server::db { 'dspace':
    user     => 'dspace',
    password => postgresql_password('dspace', 'dspace'),
    encoding => 'UNICODE',
}
postgresql::server::pg_hba_rule { 'dspace access':
    type        => 'host',
    database    => 'dspace',
    user        => 'dspace',
    address     => '127.0.0.1/32',
    auth_method => 'md5',
    order       => '001',
}

file { "/apps/mdsoar":
    ensure => 'directory',
    owner  => 'vagrant',
    group  => 'vagrant',
}

# Tomcat logs directory
file { "/apps/mdsoar/tomcat/logs":
    ensure => 'directory',
    owner  => 'vagrant',
    group  => 'vagrant',
}

# by default the CentOS 6.6 iptables config has
# all ports closed except for SSH (22)
firewall { '100 allow http and https access':
    port   => [80, 443, 8080, 8443, 8983],
    proto  => tcp,
    action => accept,
}
