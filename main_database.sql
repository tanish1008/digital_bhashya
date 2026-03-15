CREATE DATABASE digital_bhashya;
USE digital_bhashya;

CREATE TABLE chapters (
    chapter_id INT PRIMARY KEY,
    chapter_name VARCHAR(100)
);

CREATE TABLE speakers (
    speaker_id INT PRIMARY KEY,
    speaker_name VARCHAR(50)
);

CREATE TABLE verses (
    verse_id INT PRIMARY KEY,
    chapter_id INT,
    verse_number INT,
    speaker_id INT,
    sanskrit TEXT,
    hindi TEXT,
    explanation TEXT,
    philosophical_question TEXT,

    FOREIGN KEY (chapter_id) REFERENCES chapters(chapter_id),
    FOREIGN KEY (speaker_id) REFERENCES speakers(speaker_id)
);

CREATE TABLE concepts (
    concept_id INT PRIMARY KEY,
    concept_name VARCHAR(100)
);

CREATE TABLE verse_concept (
    verseconcept_id INT PRIMARY KEY,
    verse_id INT,
    concept_id INT,

    FOREIGN KEY (verse_id) REFERENCES verses(verse_id),
    FOREIGN KEY (concept_id) REFERENCES concepts(concept_id)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/verses.csv'
INTO TABLE verses
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(verse_id, chapter_id, verse_number, speaker_id, sanskrit, hindi, explanation, philosophical_question);


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/verse_concept.csv'
INTO TABLE verse_concept
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(verseconcept_id, verse_id, concept_id);




