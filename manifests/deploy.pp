class dataprotectoragent::deploy
(
)
inherits dataprotectoragent::params
{

  # dataprotecctor DA source: 
  file {'local_packages':
    path => "$mylocal",
    ensure => 'present',
    source => "$source_base/Software_HP_DP",
    recurse => true,
  }

  #Configuración de xinetd
  file {"$mylocal/dataprotector":
    content => "omni stream tcp nowait root /opt/omni/lbin/inet inet -log /var/opt/omni/log/inet.log ",
  }

 
}
