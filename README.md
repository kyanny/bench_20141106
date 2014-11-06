bench_20141106
==============

MongoDB with 1000 IOPS
https://aws.amazon.com/marketplace/pp/B00CO7AVMY/

US East (Virginia)

m1.large

```
$ ssh -l ec2-user ...
$ sudo yum -y groupinstall 'Development Tools'
$ sudo yum -y install ruby-devel
$ gem i mongo bson_ext
$ sudo service mongod start

$ git clone https://github.com/kyanny/bench_20141106.git
$ cd ./bench_20141106
$ ./run.sh


```
