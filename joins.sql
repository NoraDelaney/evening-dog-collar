# YOUR SQL CODE GOES HERE
-- First generate dog_park database in terminal through command "createdb dog_park"
-- Import data from scheme in terminal through command "psql dog_park < schema.sql"

-- 1. For which collars can we identify an owner?

SELECT lost_dog_collars.id FROM dog_owners JOIN lost_dog_collars ON (dog_owners.dog_name = lost_dog_collars.dog_name);
 id
----
  1
  3
  4
  6
  7
(5 rows)


-- 2. For which collars is there no known owner?

SELECT  lost_dog_collars.id FROM dog_owners RIGHT OUTER JOIN lost_dog_collars ON (dog_owners.dog_name = lost_dog_collars.dog_name) WHERE dog_owners.name IS NULL;
 id
----
  2
  5
  8
(3 rows)

-- 3. We need to see all collars, with an owner, if one matches.

SELECT dog_owners.name, lost_dog_collars.id FROM dog_owners JOIN lost_dog_collars ON (dog_owners.dog_name = lost_dog_collars.dog_name);
  name   | id
---------+----
 Evan    |  1
 Whitney |  3
 Spencer |  4
 Dan     |  6
 Omid    |  7
(5 rows)

-- 4. We need to see all owners, with collars in the Lost and Found, if one matches.

SELECT dog_owners.name FROM dog_owners JOIN lost_dog_collars ON (dog_owners.dog_name = lost_dog_collars.dog_name);
  name
---------
 Evan
 Whitney
 Spencer
 Dan
 Omid
(5 rows)
