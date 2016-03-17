#
# Purges all configuration
#
class dataprotectoragent::purge
inherits dataprotectoragent::params
{

  # class dataprotectoragent::config
  # ($enable => false)
  
  file {$mylocal:
    ensure  => absent,
    recurse => true,
    force   => true,
  }

}

