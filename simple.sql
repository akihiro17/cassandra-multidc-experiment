CREATE KEYSPACE IF NOT EXISTS test WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};
ALTER KEYSPACE test WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};

DROP TABLE IF EXISTS test.users;

CREATE TABLE test.users (
  id bigint,
  name text,
  PRIMARY KEY (id)
);

INSERT INTO test.users (id, name) VALUES (1, 'test');
select * from test.users;
SELECT data_center FROM system.local;
desc test;
