class dataprotectoragent::config
( $dataprotectorserver = "myserver.myorg",
  $enable = true,
)
inherits dataprotectoragent::params
{
  #
  # Enable service
  #
  if ($enable) {
    if ( $::osfamily == "Debian" ) {
      $dp_packages = ["liblua5.1-0", "xinetd", "rpm2cpio", "rpm"]
      # configuracion xinetd
      service { 'xinetd':
        ensure  => 'running',
        enable  => true,
        require => Package['xinetd'],
      }
    }
    else
    {
      $dp_packages = ["liblua5.1-0",  "rpm"]
    }
    # Instalacion paquetes:
    package {$dp_packages :
      ensure => 'installed'}
    # Script Instalador
    exec { 'localinst':
      command => "sudo $mylocal/LOCAL_INSTALL/omnisetup.sh -server $dataprotectorserver -install  da",
      path    => '/usr/local/bin:/usr/bin:/bin:',
      unless  => '/usr/bin/test -d /opt/omni/bin ',
      require => File['local_packages'],
    }
    #Configuración de xinetd
    file {'/etc/xinetd.d/dataprotector':
      ensure => link,
      target => "$mylocal/dataprotector",
      notify => Service ['xinetd'],
      require => File['local_packages'],
    } 
  }
  # 
  # Disable service:
  #
  else {
    file {'/etc/xinetd.d/dataprotector':
      ensure => absent,
      notify => Service ['xinetd'],
    }
  }
  
}
