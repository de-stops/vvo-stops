CREATE TEMPORARY TABLE STOPS (stop_id varchar, stop_name varchar, stop_lon double precision, stop_lat double precision, stop_code varchar);

COPY
	STOPS
FROM
	:stops_input
	DELIMITER ','
	CSV
		HEADER
		QUOTE '"';

COPY (
	select
		stops.*
	from
		stops,
		vg250_krs,
		regexp_split_to_table(:selected_rs, ',') as selected_rs
	where
		ST_contains(vg250_krs.geom, ST_SetSRID(ST_MakePoint(stops.stop_lon, stops.stop_lat), 4326)) and
		vg250_krs.rs = selected_rs
)
TO
	:stops_output
WITH
	CSV
	HEADER QUOTE '"'
	FORCE QUOTE stop_id, stop_name, stop_code;
