-- Insert a client
INSERT INTO client (tin, name, phone)
VALUES (123456789, 'Maria Gomez', 912345678);

-- Insert an address
INSERT INTO adress (line_1, line_2, postcode, city)
VALUES ('Rua das Flores', 'Apt 3', '1000-123', 'Lisbon');

-- Insert a doctor
INSERT INTO doctor (omvid, name, phone, specialization, bio_description)
VALUES (101, 'Dr. Sousa', 911112222, 'Surgery', 'Experienced in small animal surgery.');

-- Insert an assistant
INSERT INTO assistant (tin_a, name, phone)
VALUES (987654321, 'Joana Silva', 931234567);

-- Insert an animal
INSERT INTO animal (tin, name, color, gender, birthdate)
VALUES (123456789, 'Bobby', 'Brown', 'Male', '2018-06-01');

-- Insert mammal and dog specialization
INSERT INTO mammal (tin, name)
VALUES (123456789, 'Bobby');

INSERT INTO dog (tin, name, breed)
VALUES (123456789, 'Bobby', 'Labrador');

-- Insert a visit
INSERT INTO visit (tin, omvid, name, date, tin_owner)
VALUES (123456789, 101, 'Bobby', '2025-07-31 10:00:00', 123456789);

-- Insert diagnostic
INSERT INTO diagnostic (code, description)
VALUES ('DX001', 'Allergic Dermatitis');

-- Link visit and diagnostic
INSERT INTO results_in (tin, omvid, name, date, tin_owner, code)
VALUES (123456789, 101, 'Bobby', '2025-07-31 10:00:00', 123456789, 'DX001');

-- Insert medication
INSERT INTO medication (name, lab)
VALUES ('Antihistamine', 'VetPharma');

-- Insert prescription
INSERT INTO prescription (pid)
VALUES (1);

-- Link diagnostic to prescription
INSERT INTO implies (code, tin, omvid, name, date, tin_owner, pid)
VALUES ('DX001', 123456789, 101, 'Bobby', '2025-07-31 10:00:00', 123456789, 1);

-- Add medication to prescription
INSERT INTO contains (pid, name, dosage)
VALUES (1, 'Antihistamine', '5mg/day');