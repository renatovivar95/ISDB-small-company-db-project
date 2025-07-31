CREATE TABLE client (
    tin NUMERIC(9),
    name VARCHAR(80) NOT NULL,
    phone NUMERIC(9) NOT NULL,
    
    PRIMARY KEY (tin)
);

CREATE TABLE doctor (
    omvid INTEGER,
    name VARCHAR(80) NOT NULL,
    phone NUMERIC(9) NOT NULL,
    specialization VARCHAR(50) NOT NULL,
    bio_description TEXT NOT NULL,
    
    PRIMARY KEY (omvid)
);

CREATE TABLE assistant (   
    tin_a NUMERIC(9),
    name VARCHAR(80) NOT NULL,
    phone NUMERIC(9) NOT NULL,
    
    PRIMARY KEY (tin_a)
);

CREATE TABLE adress (
    line_1 VARCHAR(255),
    line_2 VARCHAR(255),
    postcode VARCHAR(12),
    city VARCHAR(30),
    
    PRIMARY KEY (line_1, line_2, postcode, city)
);

CREATE TABLE animal (
    tin NUMERIC(9),
    name VARCHAR(80),
    color VARCHAR(50) NOT NULL,
    gender VARCHAR(20) NOT NULL,
    birthdate DATE NOT NULL,
    
    PRIMARY KEY (tin, name),
    FOREIGN KEY (tin) REFERENCES client(tin)
    
    -- Every animal must exist either in the table 'mammal' or in the table 'other_class'.
    -- No animal can exist at the same time in the both the table 'mammal' or in the table 'other_class'.
);

CREATE TABLE weight (
    tin NUMERIC(9),
    name VARCHAR(80),
    date DATE,
    w_value NUMERIC(5,2) NOT NULL,
    
    PRIMARY KEY (tin, name, w_value),
    FOREIGN KEY (tin, name) REFERENCES animal(tin, name)
);

CREATE TABLE mammal (
    tin NUMERIC(9),
    name VARCHAR(80),
    
    PRIMARY KEY (tin, name),
    FOREIGN KEY (tin, name) REFERENCES animal(tin, name)

    -- Every mammal must exist either in the table 'dog' or in the table 'cat' or in the table 'other_mammal'.
    -- No mammal can exist at the same time in more than one of the tables 'dog', 'cat' or 'other_mammal'.
);

CREATE TABLE dog (
    tin NUMERIC(9),
    name VARCHAR(80),
    breed VARCHAR (50) NOT NULL,
    
    PRIMARY KEY (tin, name),
    FOREIGN KEY (tin, name) REFERENCES mammal(tin, name)
);

CREATE TABLE cat (
    tin NUMERIC(9),
    name VARCHAR(80),
    breed VARCHAR (50) NOT NULL,
    
    PRIMARY KEY (tin, name),
    FOREIGN KEY (tin, name) REFERENCES mammal(tin, name)
);

CREATE TABLE other_mammal (
    tin NUMERIC(9),
    name VARCHAR(80),
    species VARCHAR(50) NOT NULL,
    
    PRIMARY KEY (tin, name),
    FOREIGN KEY (tin, name) REFERENCES mammal(tin, name)
);

CREATE TABLE other_class (
    tin NUMERIC(9),
    name VARCHAR(80),
    species VARCHAR(50) NOT NULL,
    
    PRIMARY KEY (tin, name),
    FOREIGN KEY (tin, name) REFERENCES animal(tin, name)

    -- Every other class animal must exist either in the table 'reptile' or in the table 'bird' or in the table 'fish'.
    -- No other class animal can exist at the same time in more than one of the tables 'reptile', 'bird' or 'fish'.
);

CREATE TABLE reptile (
    tin NUMERIC(9),
    name VARCHAR(80),
    
    PRIMARY KEY (tin, name),
    FOREIGN KEY (tin, name) REFERENCES other_class(tin, name)
);

CREATE TABLE bird (
    tin NUMERIC(9),
    name VARCHAR(80),
    
    PRIMARY KEY (tin, name),
    FOREIGN KEY (tin, name) REFERENCES other_class(tin, name)
);

CREATE TABLE fish (
    tin NUMERIC(9),
    name VARCHAR(80),
    
    PRIMARY KEY (tin, name),
    FOREIGN KEY (tin, name) REFERENCES other_class(tin, name)
);

CREATE TABLE visit (
    tin NUMERIC(9),
    omvid INTEGER,
    name VARCHAR(80),
    date TIMESTAMP,
    tin_owner NUMERIC(9),
    
    PRIMARY KEY (tin, omvid, name, date, tin_owner),
    FOREIGN KEY (tin_owner, name) REFERENCES animal(tin, name),
    FOREIGN KEY (tin) REFERENCES client(tin),
    FOREIGN KEY (omvid) REFERENCES doctor(omvid)
);

CREATE TABLE noted_visit (
    tin NUMERIC(9),
    omvid INTEGER,
    name VARCHAR(80),
    date TIMESTAMP,
    tin_owner NUMERIC(9),
    s_note TEXT NOT NULL,
    o_note TEXT NOT NULL,
    a_note TEXT NOT NULL,
    p_note TEXT NOT NULL,
    
    PRIMARY KEY (tin, omvid, name, date, tin_owner),
    FOREIGN KEY (tin, omvid, name, date, tin_owner) REFERENCES visit(tin, omvid, name, date, tin_owner)
);

CREATE TABLE diagnostic (
    code VARCHAR(20),
    description TEXT NOT NULL,
    
    PRIMARY KEY (code)
   
    -- Every diagnostic has to participate in table 'results_in' at least once
);

CREATE TABLE prescription (
    pid INTEGER,
    
    PRIMARY KEY (pid)
    
    -- Every prescription has to participate in table 'implies'
    -- Every prescription has to participate in table 'contains'
);

CREATE TABLE medication (
    name VARCHAR(40),
    lab VARCHAR(200) NOT NULL,
    
    PRIMARY KEY (name)

    -- Every medication has to participate in table 'contains'
);

CREATE TABLE procedures (             
    summary VARCHAR(255) NOT NULL,
    report TEXT NOT NULL,
    
    PRIMARY KEY (summary)

    -- Every procedure must exist either in the table 'radiagrophy', in the table 'sirurgical', in the table 'test' or in the table 'other_procedure'.
    -- No procedure can exist at the same time in more than one of tables 'radiagrophy', 'sirurgical', 'test' or 'other_procedure'.
    -- Every procedure must participate in table 'involves'
);

CREATE TABLE radiography (
    summary VARCHAR(255),
    image_path TEXT NOT NULL,
    
    PRIMARY KEY (summary),
    FOREIGN KEY (summary) REFERENCES procedures(summary)
);

CREATE TABLE sirurgical (
    summary VARCHAR(255),
    
    PRIMARY KEY (summary),
    FOREIGN KEY (summary) REFERENCES procedures(summary)
);

CREATE TABLE other_procedure (
    summary VARCHAR(255),
    
    PRIMARY KEY (summary),
    FOREIGN KEY (summary) REFERENCES procedures(summary)
);

CREATE TABLE test (
    summary VARCHAR(255),
   
    PRIMARY KEY (summary),
    FOREIGN KEY (summary) REFERENCES procedures(summary)
);

CREATE TABLE test_indicator (
    name VARCHAR(50),
    unit VARCHAR(10) NOT NULL,
    low_ref NUMERIC(6,2) NOT NULL,
    high_ref NUMERIC(6,2) NOT NULL,
    ref_description TEXT NOT NULL,
    
    PRIMARY KEY (name)
);