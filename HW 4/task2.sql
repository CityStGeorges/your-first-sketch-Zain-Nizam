USE pet_database;

SET SQL_SAFE_UPDATES = 0;

INSERT INTO petPet (petname, owner, species, gender, birth)
VALUES ('Fluffy', 'John Doe', 'cat', 'F', '2019-05-01')
ON DUPLICATE KEY UPDATE owner='John Doe', species='cat', gender='F', birth='2019-05-01';

INSERT INTO petPet (petname, owner, species, gender, birth)
VALUES ('Hammy', 'Diane', 'hamster', 'M', '2010-10-30')
ON DUPLICATE KEY UPDATE owner='Diane', species='hamster', gender='M', birth='2010-10-30';

INSERT INTO petPet (petname, owner, species, gender, birth)
VALUES ('Claws', 'Unknown', 'cat', 'M', '1995-06-01') 
ON DUPLICATE KEY UPDATE owner='Unknown', species='cat', gender='M', birth='1995-06-01';

INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Fluffy', '2020-10-15', 'vet', 'antibiotics');

INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Hammy', '2020-10-15', 'vet', 'antibiotics');

INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Claws', '1997-08-03', 'injury', 'broke rib');

UPDATE petPet
SET death = '2020-09-01'
WHERE petname = 'Puffball';

DELETE FROM petPet
WHERE owner = 'Harold';

SET SQL_SAFE_UPDATES = 1;