#
# Parameters for dataprotector agent installation
#

class dataprotectoragent::params
{
  $source_base = "puppet:///modules/${module_name}/"
  $mylocal='/usr/local/share/Software_HP_DP'
}
