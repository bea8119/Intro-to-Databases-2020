SELECT author.surname AS author, artwork.name AS artwork, category
FROM author, artwork
WHERE author.artworkCode = artwork.author
   AND birthYear >= 1590
   AND birthYear <= 1600
   AND artwork.city =  ‘Roma‘
ORDER BY surname, artwork;


-- Complete with missing values
START TRANSACTION;
INSERT INTO Author (authorCode,name,surname,birthYear,city) VALUES('X', ..., ..., ...);
INSERT INTO Artwork (artworkCode,name,category,city,country,authorCode) VALUES ('Y', ..., ..., ..., ..., ...,'X');
COMMIT;
