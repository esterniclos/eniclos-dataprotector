# eniclos-dataprotector
Installs agent dataprotector in local machines

## Requirements

Due to dataprotector licensing, the following dataprotector files have to be added from dataprotector ISO:

files/Software_HP_DP


linux_x86_64
│   ├── DP_DEPOT
│   │   ├── gpg-hpPublicKey.pub
│   │   ├── OB2-CFP-A.09.00-1.x86_64.rpm
│   │   ├── OB2-CORE-IS-A.09.00-1.x86_64.rpm
│   │   ├── OB2-DA-A.09.00-1.x86_64.rpm
│   │   ├── OB2-DAP-A.09.00-1.x86_64.rpm
│   │   ├── OB2-TS-CFP-A.09.00-1.x86_64.rpm
│   │   ├── OB2-TS-CORE-A.09.00-1.x86_64.rpm
│   │   └── OB2-TS-CS-A.09.00-1.x86_64.rpm
│   ├── scripts_linux_x86_64
│   │   ├── verify_gpg_lnx.sh
│   │   └── verify_gpg_lnx.sh.sig
│   └── SIG
│       └── DP_DEPOT
│           ├── OB2-CFP-A.09.00-1.x86_64.rpm.sig
│           ├── OB2-CORE-IS-A.09.00-1.x86_64.rpm.sig
│           ├── OB2-DA-A.09.00-1.x86_64.rpm.sig
│           ├── OB2-DAP-A.09.00-1.x86_64.rpm.sig
│           ├── OB2-TS-CFP-A.09.00-1.x86_64.rpm.sig
│           ├── OB2-TS-CORE-A.09.00-1.x86_64.rpm.sig
│           └── OB2-TS-CS-A.09.00-1.x86_64.rpm.sig
├── LOCAL_INSTALL
│   └── omnisetup.sh
├── Readme.txt


## usage

Install and enable:

  class {"dataprotectoragent":
      dataprotectorserver => "dataprotector.my.com",
    }

Remove service

 class {'dataprotectoragent::service':
    enable => false,
  }

Purge configuration

 include dataprotectoragent::purge

