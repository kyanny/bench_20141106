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

inserting 3000000 docs to db.access_tokens_1...
300 tokens > access_tokens_1.txt
inserting 1000 doc to db.access_tokens_2...
1 token > access_tokens_2.txt
       user     system      total        real
huge collection Read 30.280000   3.930000  34.210000 ( 46.063696)
huge collection Read/Write 32.680000   9.050000  41.730000 ( 50.762516)
small collection Read 30.410000   3.570000  33.980000 ( 44.951232)
small collection Read/Write 33.230000   8.640000  41.870000 ( 50.034869)
```
