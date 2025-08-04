
-- QUERY 1 SIMPLE JOIN
SELECT c.name AS client_name, a.name AS animal_name, a.color, a.gender
FROM client c
JOIN animal a ON c.tin = a.tin;


-- QUERY 2 NESTED JOIN
SELECT m.name AS medication_name, m.lab, con.dosage
FROM visit v
JOIN results_in ri ON ri.tin = v.tin AND ri.omvid = v.omvid AND ri.name = v.name 
                   AND ri.date = v.date AND ri.tin_owner = v.tin_owner
JOIN implies i ON i.tin = ri.tin AND i.omvid = ri.omvid AND i.name = ri.name 
               AND i.date = ri.date AND i.tin_owner = ri.tin_owner AND i.code = ri.code
JOIN contains con ON con.pid = i.pid
JOIN medication m ON m.name = con.name
WHERE v.name = 'Bobby' AND v.date = '2025-07-31 10:00:00';

-- INESERT TO TEST ANIMAL TABLE
INSERT INTO weight (tin, name, date, w_value)
VALUES (123456789, 'Bobby', '2024-06-15', 15.00);

-- QUERY 3 JOIN AND GROUP BY
SELECT a.name AS animal_name, MAX(w.date) AS last_weigh_date, w.w_value
FROM animal a
JOIN weight w ON a.tin = w.tin AND a.name = w.name
GROUP BY a.name, w.w_value;