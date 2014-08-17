CREATE TABLE artists (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL DEFAULT 'unknown',
	official_site TEXT,
	twitter TEXT,
	echonest_id TEXT,
	spotify_id TEXT,
	rdio_id TEXT,
	itunes_id TEXT,
	location TEXT,
	start_yr_active SMALLINT,
	end_yr_active SMALLINT,
	img TEXT,
	echonest_hotttnesss REAL DEFAULT 0.0,
	spotify_popularity SMALLINT DEFAULT 0,
	created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
	updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);

CREATE TABLE albums (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL DEFAULT 'unknown',
	artist_id INTEGER REFERENCES artists,
	release_date TEXT,
	release_date_precision TEXT,
	spotify_id TEXT,
	rdio_id TEXT,
	itunes_id TEXT,
	spotify_popularity SMALLINT DEFAULT 0,
	explicit BOOLEAN DEFAULT FALSE,
	clean BOOLEAN DEFAULT FALSE,
	type TEXT,
	upc TEXT,
	album_art TEXT,
	created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
	updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);

CREATE TABLE tracks (
	id SERIAL PRIMARY KEY,
	artist_id INTEGER REFERENCES artists,
	album_id INTEGER REFERENCES albums,
	track_num SMALLINT,
	name TEXT NOT NULL DEFAULT 'unknown',
	echonest_danceability REAL,
	echonest_energy REAL,
	echonest_speechiness REAL,
	echonest_acousticness REAL,
	echonest_liveness REAL,
	echonest_tempo REAL,
	echonest_time_sig SMALLINT,
	echonest_loudness REAL,
	echonest_duration REAL,
	echonest_key SMALLINT,
	echonest_mode SMALLINT,
	explicit BOOLEAN DEFAULT FALSE,
	clean BOOLEAN DEFAULT FALSE,
	spotify_popularity SMALLINT DEFAULT 0,
	type TEXT,
	isrc TEXT,
	spotify_id TEXT,
	rdio_id TEXT,
	itunes_id TEXT,
	created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
	updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);

CREATE TABLE genres (
	id SERIAL PRIMARY KEY,
	name TEXT,
	created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
	updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);

CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	username TEXT NOT NULL,
	email TEXT NOT NULL,
	itunes_lib BOOLEAN DEFAULT FALSE,
	created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
	updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);

CREATE TABLE users_artists (
	user_id INTEGER REFERENCES users,
	artist_id INTEGER REFERENCES artists,
	itunes BOOLEAN DEFAULT FALSE,
	spotify BOOLEAN DEFAULT FALSE,
	rdio BOOLEAN DEFAULT FALSE,
	PRIMARY KEY (user_id, artist_id)
);

CREATE TABLE users_albums (
	user_id INTEGER REFERENCES users,
	album_id INTEGER REFERENCES albums,
	itunes BOOLEAN DEFAULT FALSE,
	spotify BOOLEAN DEFAULT FALSE,
	rdio BOOLEAN DEFAULT FALSE,
	PRIMARY KEY (user_id, album_id) );

CREATE TABLE artist_genres (
	artist_id INTEGER REFERENCES artists,
	genre_id INTEGER REFERENCES genres,
	PRIMARY KEY (artist_id, genre_id)
);

CREATE TABLE album_genres (
	album_id INTEGER REFERENCES albums,
	genre_id INTEGER REFERENCES genres,
	PRIMARY KEY (album_id, genre_id)
);
