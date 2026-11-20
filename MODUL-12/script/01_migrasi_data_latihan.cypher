// Menampilkan informasi nama, versi, dan edisi DBMS Neo4j 
CALL dbms.components() YIELD name, versions, edition
RETURN name, versions[0] AS version, edition;

// Migrasi data master rute (:Route) dan data perjalanan (:Trip) beserta relasi [:ON_ROUTE] 
CREATE (r12:Route {route_id: 12, route_name: 'Koridor Pusat-Terminal'}),
(r15:Route {route_id: 15, route_name: 'Koridor Kampus-Stasiun'}),
(r18:Route {route_id: 18, route_name: 'Koridor Pasar-Kota'}),

(:Trip {trip_id: 'T001', started_at: datetime('2026-11-02T07:10:00'), status: 'completed'})-[:ON_ROUTE]->(r12),
(:Trip {trip_id: 'T002', started_at: datetime('2026-11-02T07:25:00'), status: 'completed'})-[:ON_ROUTE]->(r15),
(:Trip {trip_id: 'T003', started_at: datetime('2026-11-03T08:05:00'), status: 'delayed'})-[:ON_ROUTE]->(r12),

// Menampilkan visualisasi seluruh node dan relasi hasil migrasi 
MATCH (n) RETURN n;
