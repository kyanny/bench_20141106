require 'mongo'
require 'benchmark'
require 'securerandom'

include Mongo
client = MongoClient.new
db = client['test']
ncount = 100000

access_tokens_1 = File.readlines('access_tokens_1.txt').map(&:chomp)
access_tokens_2 = File.readlines('access_tokens_2.txt').map(&:chomp)

Benchmark.bm do |x|
  x.report('huge collection Read') do
    ncount.times do
      db['access_tokens_1'].find_one({token: access_tokens_1.sample})
    end
  end

  x.report('huge collection Read/Write') do
    t1 = Thread.new do
      loop do
        db['access_tokens_1'].insert({token: SecureRandom.urlsafe_base64(100)})
        sleep 0.05
      end
    end
    ncount.times do
      db['access_tokens_1'].find_one({token: access_tokens_1.sample})
    end
    t1.kill
  end

  x.report('small collection Read') do
    ncount.times do
      db['access_tokens_2'].find_one({token: access_tokens_2.sample})
    end
  end

  x.report('small collection Read/Write') do
    t2 = Thread.new do
      loop do
        db['access_tokens_2'].insert({token: SecureRandom.urlsafe_base64(100)})
        sleep 0.05
      end
    end
    ncount.times do
      db['access_tokens_2'].find_one({token: access_tokens_2.sample})
    end
    t2.kill
  end
end
