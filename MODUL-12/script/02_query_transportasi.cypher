// Menampilkan trip_id, started_at, dan route_name khusus perjalanan pada route_id = 12 sejak 1 November 2026 
MATCH (t:Trip)-[:ON_ROUTE]->(r:Route {route_id: 12})
WHERE t.started_at >= datetime('2026-11-01')
RETURN t.trip_id AS trip_id, t.started_at AS started_at, r.route_name AS route_name
ORDER BY t.trip_id;
