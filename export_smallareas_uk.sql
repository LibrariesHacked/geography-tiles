-- switch to using the database
\c geography;

-- set client encoding
set client_encoding = 'UTF8';

\copy (select json_build_object('type', 'FeatureCollection', 'features', json_agg(st_asgeojson(t.*)::json))::text from (select code, area_name, population, imd_decile, st_transform(geom, 4326) from vw_smallareas_uk) t) to 'smallareas.geojson';
