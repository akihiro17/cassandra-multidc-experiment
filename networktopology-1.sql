ALTER KEYSPACE test WITH replication = {'class': 'NetworkTopologyStrategy', 'DC1': '1'};
DESC test;

ALTER KEYSPACE system_auth WITH replication = {
  'class': 'NetworkTopologyStrategy',
  'DC1': '1'
};

ALTER KEYSPACE system_distributed WITH replication = {
  'class': 'NetworkTopologyStrategy',
  'DC1': '1'
};

ALTER KEYSPACE system_traces WITH replication = {
  'class': 'NetworkTopologyStrategy',
  'DC1': '1'
};
