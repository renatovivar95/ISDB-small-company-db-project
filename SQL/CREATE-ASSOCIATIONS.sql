CREATE TABLE lives_a (
    line_1 VARCHAR(255),
    line_2 VARCHAR(255),
    postcode VARCHAR(12),
    city VARCHAR(30),
    tin_a NUMERIC(9),
    
    PRIMARY KEY (line_1, line_2, postcode, city, tin_a),
    FOREIGN KEY (line_1, line_2, postcode, city) REFERENCES adress (line_1, line_2, postcode, city),
    FOREIGN KEY (tin_a) REFERENCES assistant (tin_a)
);

CREATE TABLE lives_d (
    line_1 VARCHAR(255),
    line_2 VARCHAR(255),
    postcode VARCHAR(12),
    city VARCHAR(30), 
    omvid INTEGER,
    
    PRIMARY KEY (line_1, line_2, postcode, city, omvid),
    FOREIGN KEY (line_1, line_2, postcode, city) REFERENCES adress (line_1, line_2, postcode, city),
    FOREIGN KEY (omvid) REFERENCES doctor (omvid)
);

CREATE TABLE lives_c (
    line_1 VARCHAR(255),
    line_2 VARCHAR(255),
    postcode VARCHAR(12),
    city VARCHAR(30), 
    tin NUMERIC(9),
    
    PRIMARY KEY (line_1, line_2, postcode, city, tin),
    FOREIGN KEY (line_1, line_2, postcode, city) REFERENCES adress (line_1, line_2, postcode, city),
    FOREIGN KEY (tin) REFERENCES client (tin)
);

CREATE TABLE participates (
    tin_a NUMERIC(9),
    tin NUMERIC(9),
    omvid INTEGER,
    name VARCHAR(80),
    date TIMESTAMP,
    tin_owner NUMERIC(9),
    
    PRIMARY KEY (tin, omvid, name, date, tin_owner),
    FOREIGN KEY (tin, omvid, name, date, tin_owner) REFERENCES visit(tin, omvid, name, date, tin_owner),
    FOREIGN KEY (tin_a) REFERENCES assistant (tin_a)
);

CREATE TABLE does (
    summary VARCHAR(255),
    tin_a NUMERIC(9),
    
    PRIMARY KEY (summary, tin_a),
    FOREIGN KEY (summary) REFERENCES procedures (summary),
    FOREIGN KEY (tin_a) REFERENCES assistant (tin_a)
);

CREATE TABLE results_in (
    tin NUMERIC(9),
    code VARCHAR(20),
    omvid INTEGER,
    name VARCHAR(80),
    date TIMESTAMP,
    tin_owner NUMERIC(9),
    
    PRIMARY KEY (tin, omvid, name, date, tin_owner, code),
    FOREIGN KEY (tin, omvid, name, date, tin_owner) REFERENCES visit(tin, omvid, name, date, tin_owner),
    FOREIGN KEY (code) REFERENCES diagnostic(code)
);

CREATE TABLE implies (
    code VARCHAR(20),
    tin NUMERIC(9),
    omvid INTEGER,
    name VARCHAR(80),
    date TIMESTAMP,
    tin_owner NUMERIC(9),
    pid INTEGER,
    
    PRIMARY KEY (tin, omvid, name, date, tin_owner, code),
    FOREIGN KEY (tin, omvid, name, date, tin_owner, code) REFERENCES results_in(tin, omvid, name, date, tin_owner, code),
    FOREIGN KEY (pid) REFERENCES prescription(pid)
);

CREATE TABLE contains (
    pid INTEGER,
    name VARCHAR(40),
    dosage VARCHAR(20) NOT NULL,
    
    PRIMARY KEY (pid, name),
    FOREIGN KEY (pid) REFERENCES prescription (pid),
    FOREIGN KEY (name) REFERENCES medication (name)
);

CREATE TABLE involves (
    summary VARCHAR(255),
    tin NUMERIC(9),
    omvid INTEGER,
    name VARCHAR(80),
    date TIMESTAMP,
    tin_owner NUMERIC(9),
    
    PRIMARY KEY (tin, omvid, name, date, tin_owner, summary),
    FOREIGN KEY (tin, omvid, name, date, tin_owner) REFERENCES visit(tin, omvid, name, date, tin_owner),
    FOREIGN KEY (summary) REFERENCES procedures(summary)
);

CREATE TABLE evaluates (
    summary VARCHAR(255),
    name VARCHAR(50),
    test_value NUMERIC(6,2) NOT NULL,
    
    PRIMARY KEY (summary, name),
    FOREIGN KEY (summary) REFERENCES test (summary),
    FOREIGN KEY (name) REFERENCES test_indicator(name)
);