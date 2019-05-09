require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'cassandra-driver'
end

require 'cassandra'

cluster = if ENV['DC_AWARE']
  Cassandra.cluster(
    hosts: ['cassandra-dc1-0.cassandra-dc1.c7a.svc.cluster.local'],
    datacenter: ENV.fetch('DC', 'DC1'),
    consistency: :local_one
  )
else
  Cassandra.cluster(
    hosts: ['cassandra-dc1-0.cassandra-dc1.c7a.svc.cluster.local'],
  )
end

cluster.each_host do |host| # automatically discovers all peers
  puts "Host #{host.ip}: id=#{host.id} datacenter=#{host.datacenter} rack=#{host.rack}"
end

def query(cluster, query)
  keyspace = 'test'
  session  = cluster.connect(keyspace)
  rows = session.execute(query)

  rows.each do |row|
    p row
  end
end

10.times do |i|
  query(cluster, "INSERT INTO test.users (id, name) VALUES (#{i}, 'test#{i}')")
end
query(cluster, 'SELECT * FROM test.users')
query(cluster, 'SELECT data_center FROM system.local')
