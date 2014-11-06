require 'mongo'
require 'securerandom'

include Mongo

client = MongoClient.new
db = client['test']

puts "inserting 3000000 docs to db.access_tokens_1..."
col1 = db['access_tokens_1']
col1.drop()
ntimes = 3000000 / 10000
samples = []
ntimes.times do
  docs = 10000.times.map do
    { token: SecureRandom.urlsafe_base64(100) }
  end
  samples << docs.sample
  col1.insert(docs)
end
col1.ensure_index(:token)
puts "#{samples.length} tokens > access_tokens_1.txt"
open('access_tokens_1.txt', 'w') { |f| f.puts samples.map{|doc| doc[:token]} }

puts "inserting 1000 doc to db.access_tokens_2..."
col2 = db['access_tokens_2']
col2.drop()
docs = 10000.times.map do
  { token: SecureRandom.urlsafe_base64(100) }
end
col2.insert(docs)
col2.ensure_index(:token)
puts "1 token > access_tokens_2.txt"
open('access_tokens_2.txt', 'w') { |f| f.puts docs.sample(10).map{|doc| doc[:token]} }
