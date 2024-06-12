-- List all bands with Glam rock as their main style, ranked by longevity
SELECT band_name, 
       IF(splits.length = 2, splits[2] - splits[1], 2022 - splits[1]) AS lifespan
FROM (
    SELECT band_name,
           SPLIT_STRING(sformed.formed, '-') AS splits
    FROM metal_bands
    WHERE main_style = 'Glam rock'
) AS glam_bands
ORDER BY lifespan DESC;
