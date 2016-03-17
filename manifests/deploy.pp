class dataprotectoragent::deploy inherits dataprotectoragent::params
{

  # dataprotecctor DA source: 
  file {'local_packages':
    ensure  => present,
    path    => $mylocal,
    source  => "${source_base}/Software_HP_DP",
    recurse => true,
  }

  #Configuración de xinetd
  file {"${mylocal}/dataprotector":
      ensure => present,
      source => "${source_base}/xinetd_dataprotector",
  }
}
