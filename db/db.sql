CREATE TABLE categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT
);
CREATE TABLE clothes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT
);
CREATE TABLE outfits (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT
);
CREATE TABLE category_clothes (
    category_id INTEGER REFERENCES categories(id),
    clothing_id INTEGER REFERENCES clothes(id),
    PRIMARY KEY( category_id, clothing_id )
);
CREATE TABLE outfit_clothes (
    outfit_id INTEGER REFERENCES outfits(id),
    clothing_id INTEGER REFERENCES clothes(id),
    PRIMARY KEY( outfit_id, clothing_id )
);