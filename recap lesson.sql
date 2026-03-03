SELECT DISTINCT [TYPE] FROM airports

SELECT
    a.name
    ,a.latitude_deg
    ,a.longitude_deg 
    ,a.iata_code 
    ,a.elevation_ft
    ,ROUND(a.elevation_ft / 3.28, 1) AS elevation_m 
    ,a.iso_country
FROM
    airports a
WHERE a.type = 'large_airport'
    AND a.continent = 'EU'
    AND a.iso_country IN ('GB','FR')
    --AND a.latitude_deg BETWEEN 51 AND 54
ORDER BY a.name

-- Which 5 regions have the most airports?
SELECT TOP(5)
    a.iso_region
    ,COUNT(*) AS total_airports
FROM
    airports a
GROUP BY a.iso_region
ORDER BY total_airports DESC