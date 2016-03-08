#
# Deploy and install dataprotector agent.
#

class dataprotectoragent
( $dataprotectorserver = "myserver.myorg")
inherits dataprotectoragent::params
{


  include dataprotectoragent::deploy
  
  class {'dataprotectoragent::service':
    enable => true,
    dataprotectorserver => $dataprotectorserver,
  }
  
}
