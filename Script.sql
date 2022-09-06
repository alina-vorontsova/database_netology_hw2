-- CREATE-запросы
CREATE TABLE IF NOT EXISTS Musician (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Genre (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS MusicianGenre (
	musician_id INTEGER NOT NULL REFERENCES Musician(id),
	genre_id INTEGER NOT NULL REFERENCES Genre(id),
	CONSTRAINT pk_mg PRIMARY KEY (musician_id, genre_id)
);

CREATE TABLE IF NOT EXISTS Album (
	id SERIAL PRIMARY KEY,
	name VARCHAR(200) UNIQUE NOT NULL,
	release_year INTEGER NOT NULL CONSTRAINT album_release_year CHECK (release_year > 0)
);

CREATE TABLE IF NOT EXISTS AlbumMusician (
	musician_id INTEGER NOT NULL REFERENCES Musician(id),
	album_id INTEGER NOT NULL REFERENCES Album(id),
	CONSTRAINT pk_am PRIMARY KEY (musician_id, album_id)
);

CREATE TABLE IF NOT EXISTS Song (
	id SERIAL PRIMARY KEY,
	name VARCHAR(200) UNIQUE NOT NULL,
	album_id INTEGER NOT NULL REFERENCES Album(id),
	duration INTEGER NOT NULL CONSTRAINT song_duration CHECK (duration > 0) -- в секундах 
);

CREATE TABLE IF NOT EXISTS Compilation (
	id SERIAL PRIMARY KEY,
	name VARCHAR(200) UNIQUE NOT NULL,
	release_year INTEGER NOT NULL CONSTRAINT compilation_release_year CHECK (release_year > 0)
);

CREATE TABLE IF NOT EXISTS SongCompilation (
	compilation_id INTEGER NOT NULL REFERENCES Compilation(id),
	song_id INTEGER NOT NULL REFERENCES Song(id),
	CONSTRAINT pk_sc PRIMARY KEY (compilation_id, song_id)
); 

-- INSERT-запросы 

-- не менее 8 исполнителей
INSERT INTO Musician (name)
VALUES ('David Bowie');

INSERT INTO Musician (name)
VALUES ('Iggy Pop');

INSERT INTO Musician (name)
VALUES ('Oasis');

INSERT INTO Musician (name)
VALUES ('The Smiths');

INSERT INTO Musician (name)
VALUES ('Brand New');

INSERT INTO Musician (name)
VALUES ('The Cure');

INSERT INTO Musician (name)
VALUES ('Blur');

INSERT INTO Musician (name)
VALUES ('My Chemical Romance');

-- не менее 5 жанров
INSERT INTO Genre (name)
VALUES ('britpop');

INSERT INTO Genre (name)
VALUES ('rock');

INSERT INTO Genre (name)
VALUES ('glam rock');

INSERT INTO Genre (name)
VALUES ('new wave');

INSERT INTO Genre (name)
VALUES ('alternative');

-- не менее 8 альбомов
INSERT INTO Album (name, release_year)
VALUES ('Heroes', 1977);

INSERT INTO Album (name, release_year)
VALUES ('Lust for Life', 1977);

INSERT INTO Album (name, release_year)
VALUES ('Definitely Maybe', 1994);

INSERT INTO Album (name, release_year)
VALUES ('The Queen is Dead', 1986);

INSERT INTO Album (name, release_year)
VALUES ('Deja Entendu', 2003);

INSERT INTO Album (name, release_year)
VALUES ('Wish', 2018); -- неверный год, чтобы соответствовать условию выборки 

INSERT INTO Album (name, release_year)
VALUES ('Parklife', 1994);

INSERT INTO Album (name, release_year)
VALUES ('Three Cheers for Sweet Revenge', 2018); -- неверный год, чтобы соответствовать условию выборки 

-- не менее 15 треков
INSERT INTO Song (name, album_id, duration)
VALUES ('Heroes', 1, 453);

INSERT INTO Song (name, album_id, duration)
VALUES ('V-2 Schneider', 1, 191);

INSERT INTO Song (name, album_id, duration)
VALUES ('The Passenger', 2, 281);

INSERT INTO Song (name, album_id, duration)
VALUES ('Tonight', 2, 220);

INSERT INTO Song (name, album_id, duration)
VALUES ('Live Forever', 3, 285);

INSERT INTO Song (name, album_id, duration)
VALUES ('Supersonic', 3, 283);

INSERT INTO Song (name, album_id, duration)
VALUES ('There Is a Light That Never Goes Out', 4, 215);

INSERT INTO Song (name, album_id, duration)
VALUES ('Bigmouth Strikes Again', 4, 212);

INSERT INTO Song (name, album_id, duration)
VALUES ('The Quiet Things That No One Ever Knows', 5, 241);

INSERT INTO Song (name, album_id, duration)
VALUES ('The Boy Who Blocked His Own Shot', 5, 279);

INSERT INTO Song (name, album_id, duration)
VALUES ('High', 6, 213);

INSERT INTO Song (name, album_id, duration)
VALUES ('A Letter to my Elise', 6, 311); -- неверное название, чтобы соответствовать условию выборки 

INSERT INTO Song (name, album_id, duration)
VALUES ('Girls & Boys', 7, 291);

INSERT INTO Song (name, album_id, duration)
VALUES ('Parklife', 7, 186);

INSERT INTO Song (name, album_id, duration)
VALUES ('To the End', 8, 181);

INSERT INTO Song (name, album_id, duration)
VALUES ('My Interlude', 8, 57); -- неверное название, чтобы соответствовать условию выборки 

-- не менее 8 сборников
INSERT INTO Compilation (name, release_year)
VALUES ('Compilation1', 2000);

INSERT INTO Compilation (name, release_year)
VALUES ('Compilation2', 2002);

INSERT INTO Compilation (name, release_year)
VALUES ('Compilation3', 2005);

INSERT INTO Compilation (name, release_year)
VALUES ('Compilation4', 2008);

INSERT INTO Compilation (name, release_year)
VALUES ('Compilation5', 2013);

INSERT INTO Compilation (name, release_year)
VALUES ('Compilation6', 2018);

INSERT INTO Compilation (name, release_year)
VALUES ('Compilation7', 2020);

INSERT INTO Compilation (name, release_year)
VALUES ('Compilation8', 2021);

-- исполнители с альбомами
INSERT INTO AlbumMusician (musician_id, album_id)
VALUES (1, 1);

INSERT INTO AlbumMusician (musician_id, album_id)
VALUES (2, 2);

INSERT INTO AlbumMusician (musician_id, album_id)
VALUES (3, 3);

INSERT INTO AlbumMusician (musician_id, album_id)
VALUES (4, 4);

INSERT INTO AlbumMusician (musician_id, album_id)
VALUES (5, 5);

INSERT INTO AlbumMusician (musician_id, album_id)
VALUES (6, 6);

INSERT INTO AlbumMusician (musician_id, album_id)
VALUES (7, 7);

INSERT INTO AlbumMusician (musician_id, album_id)
VALUES (8, 8);

-- исполнители с жанрами
INSERT INTO MusicianGenre (musician_id, genre_id)
VALUES (1, 3);

INSERT INTO MusicianGenre (musician_id, genre_id)
VALUES (2, 3);

INSERT INTO MusicianGenre (musician_id, genre_id)
VALUES (3, 1);

INSERT INTO MusicianGenre (musician_id, genre_id)
VALUES (4, 4);

INSERT INTO MusicianGenre (musician_id, genre_id)
VALUES (5, 2);

INSERT INTO MusicianGenre (musician_id, genre_id)
VALUES (6, 4);

INSERT INTO MusicianGenre (musician_id, genre_id)
VALUES (7, 1);

INSERT INTO MusicianGenre (musician_id, genre_id)
VALUES (8, 5);

-- сборники с треками
INSERT INTO SongCompilation (compilation_id, song_id)
VALUES (1, 1);

INSERT INTO SongCompilation (compilation_id, song_id)
VALUES (1, 2);

INSERT INTO SongCompilation (compilation_id, song_id)
VALUES (2, 3);

INSERT INTO SongCompilation (compilation_id, song_id)
VALUES (2, 4);

INSERT INTO SongCompilation (compilation_id, song_id)
VALUES (3, 5);

INSERT INTO SongCompilation (compilation_id, song_id)
VALUES (3, 6);

INSERT INTO SongCompilation (compilation_id, song_id)
VALUES (4, 7);

INSERT INTO SongCompilation (compilation_id, song_id)
VALUES (4, 8);

INSERT INTO SongCompilation (compilation_id, song_id)
VALUES (5, 9);

INSERT INTO SongCompilation (compilation_id, song_id)
VALUES (5, 10);

INSERT INTO SongCompilation (compilation_id, song_id)
VALUES (6, 11);

INSERT INTO SongCompilation (compilation_id, song_id)
VALUES (6, 12);

INSERT INTO SongCompilation (compilation_id, song_id)
VALUES (7, 13);

INSERT INTO SongCompilation (compilation_id, song_id)
VALUES (7, 14);

INSERT INTO SongCompilation (compilation_id, song_id)
VALUES (8, 15);

INSERT INTO SongCompilation (compilation_id, song_id)
VALUES (8, 16);

-- SELECT-запросы
-- название и год выхода альбомов, вышедших в 2018 году
SELECT name, release_year FROM Album
WHERE release_year = 2018;

-- название и продолжительность самого длительного трека
SELECT name, duration FROM Song
ORDER BY duration DESC
LIMIT 1;

-- название треков, продолжительность которых не менее 3,5 минуты (210 секунд)
SELECT name FROM Song 
WHERE duration > 210;

-- названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT name FROM Compilation 
WHERE release_year > 2017 AND release_year < 2021;

-- исполнители, чье имя состоит из 1 слова
SELECT name FROM Musician 
WHERE name NOT LIKE '% %';

-- название треков, которые содержат слово "мой"/"my"
SELECT name FROM Song 
WHERE name LIKE 'My %' OR name LIKE '% my %';