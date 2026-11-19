// membuat role dan user
CREATE ROLE reporter IF NOT EXISTS;
CREATE USER report_user IF NOT EXISTS SET PASSWORD '<passwordAman123>' CHANGE NOT REQUIRED;
GRANT ROLE reporter TO report_user;

//memberikan hak akses
GRANT ACCESS ON DATABASE transport TO reporter;
GRANT TRAVERSE ON GRAPH transport NODES Trip, Route TO reporter;
GRANT READ {*} ON GRAPH transport NODES Trip, Route TO reporter;
GRANT TRAVERSE ON GRAPH transport RELATIONSHIPS ON_ROUTE TO reporter;

//periksa hak akses
SHOW ROLES;
SHOW USER report_user PRIVILEGES;

//operasi baca (dilakukan sebagai report_user)
MATCH (t: Trip)-[:ON_ROUTE]->(r: Route)
RETURN t.trip_id, t.started_at, r.route_name;

//operasi delete (dilakukan sebagai report_user (akan gagal karena report_user tidak diberikan hak akses delete))
MATCH (t: Trip {trip_id: 'T001'})
DETACH DELETE t;

// mencabut hak akses report_user
// Dilakukan di database system (sebagai neo4j):
REVOKE READ {*} ON GRAPH transport NODES Trip, Route FROM reporter;
SHOW USER report_user PRIVILEGES;

// operasi baca 
// Dilakukan di database transport (sebagai report_user setelah haknya dicabut (akan gagal)):
MATCH (t: Trip)-[:ON_ROUTE]->(r:Route)
RETURN t.trip id, t.started_at, r.route_name;

// pemeriksaan status hak akses
// 1. Cek daftar user beserta role yang melekat
SHOW USERS YIELD user, roles, suspended;
// 2. Cek seluruh hak akses (privileges) milik report_user
SHOW USER report_user PRIVILEGES;
// 3. Cek seluruh hak akses yang dimiliki role reporter
SHOW ROLE reporter PRIVILEGES;
