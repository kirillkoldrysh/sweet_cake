# CakePHP Application Skeleton

[![Build Status](https://img.shields.io/travis/cakephp/app/master.svg?style=flat-square)](https://travis-ci.org/cakephp/app)
[![Total Downloads](https://img.shields.io/packagist/dt/cakephp/app.svg?style=flat-square)](https://packagist.org/packages/cakephp/app)

A skeleton for creating applications with [CakePHP](https://cakephp.org) 3.x.

The framework source code can be found here: [cakephp/cakephp](https://github.com/cakephp/cakephp).

## Installation

1. Download [Composer](https://getcomposer.org/doc/00-intro.md) or update `composer self-update`.
2. Run `php composer.phar create-project --prefer-dist cakephp/app [app_name]`.

If Composer is installed globally, run

```bash
composer create-project --prefer-dist cakephp/app
```

In case you want to use a custom app dir name (e.g. `/myapp/`):

```bash
composer create-project --prefer-dist cakephp/app myapp
```

You can now either use your machine's webserver to view the default home page, or start
up the built-in webserver with:

```bash
bin/cake server -p 8765
```

Then visit `http://localhost:8765` to see the welcome page.

## Update

Since this skeleton is a starting point for your application and various files
would have been modified as per your needs, there isn't a way to provide
automated upgrades, so you have to do any updates manually.

## Configuration

Read and edit `config/app.php` and setup the `'Datasources'` and any other
configuration relevant for your application.

## Layout

The app skeleton uses a subset of [Foundation](http://foundation.zurb.com/) (v5) CSS
framework by default. You can, however, replace it with any other library or
custom styles.

## First SQL script:

```sql
CREATE TABLE singers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
	country VARCHAR(100),
    created DATETIME,
    modified DATETIME
) CHARSET=utf8mb4;

CREATE TABLE albums (
    id INT AUTO_INCREMENT PRIMARY KEY,
    singer_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    slug VARCHAR(255) NOT NULL,
	genre VARCHAR(100),
    published BOOLEAN DEFAULT FALSE,
    created DATETIME,
    modified DATETIME,
    UNIQUE KEY (slug),
    FOREIGN KEY singer_key (singer_id) REFERENCES singers(id)
) CHARSET=utf8mb4;

CREATE TABLE songs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,	
    slug VARCHAR(255) NOT NULL,
	song_text TEXT,
    created DATETIME,
    modified DATETIME,
    UNIQUE KEY (title)
) CHARSET=utf8mb4;

CREATE TABLE albums_songs (
    album_id INT NOT NULL,
    song_id INT NOT NULL,
    PRIMARY KEY (album_id, song_id),
    FOREIGN KEY song_key(song_id) REFERENCES songs(id),
    FOREIGN KEY album_key(album_id) REFERENCES albums(id)
);

INSERT INTO singers (name, country, created, modified)
VALUES
('Queen', 'Great Britain', NOW(), NOW());

INSERT INTO albums (singer_id, title, slug, genre, published, created, modified)
VALUES
(1, 'Jazz', 'jazz', 'Rock', 1, now(), now()),
(1, 'A Night at the Opera', 'a-night-at-the-opera', 'Rock', 1, now(), now());

INSERT INTO songs (title, slug, song_text, created, modified)
VALUES
("Mustapha", "mustapha", "Ibrahim, Ibrahim, Ibrahim,
Allah, Allah, Allah, Allah will pray for you.
Hey!
Mustapha, Mustapha, Mustapha Ibrahim.
Mustapha, Mustapha, Mustapha Ibrahim.
Mustapha Ibrahim, Mustapha Ibrahim
Allah, Allah, Allah will pray for you.", NOW(), NOW()),
("Jealousy", "jealousy", "Oh how wrong can you be?
Oh to fall in love
Was my very first mistake
How was I to know
I was far too much in love to see?", NOW(), NOW()),
("Bicycle Race", "bicycle-race", "Bicycle, bicycle, bicycle
I want to ride my bicycle, bicycle, bicycle
I want to ride my bicycle", NOW(), NOW()),
("Love of My Life", "love-of-my-life", "Love of my life, you've hurt me
You've broken my heart and now you leave me
Love of my life, can't you see?
Bring it back, bring it back
Don't take it away from me, because you don't know
What it means to me", NOW(), NOW()),
("Bohemian Rhapsody", "bohemian-rhapsody", "Mama, just killed a man
Put a gun against his head
Pulled my trigger, now he's dead
Mama, life had just begun
But now I've gone and thrown it all away", NOW(), NOW());

```
