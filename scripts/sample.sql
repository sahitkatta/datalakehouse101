--SHOW CATALOGS;

CREATE SCHEMA IF NOT EXISTS iceberg.default;

-- Drop the table if it already exists
DROP TABLE IF EXISTS iceberg.default.people;

-- Create the new Iceberg table
CREATE TABLE iceberg.default.people (
    id BIGINT,
    name VARCHAR,
    created_at TIMESTAMP
)
WITH (
    location = 's3://warehouse/people',
    format = 'PARQUET'
);

-- Insert values into the new table
INSERT INTO iceberg.default.people (id, name, created_at) VALUES
    (1, 'Alice', TIMESTAMP '2025-01-01 12:00:00'),
    (2, 'Bob', TIMESTAMP '2025-01-02 13:30:00'),
    (3, 'Charlie', TIMESTAMP '2025-01-03 15:45:00');
    

SELECT * from iceberg.default.people;