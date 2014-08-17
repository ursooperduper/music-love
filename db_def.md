# Database Definition
##artists
Name                    | Type                                                | Example
----                    | ----                                                | -------
id                      | SERIAL PRIMARY KEY                                  | 1
name                    | TEXT NOT NULL DEFAULT 'unknown'                     | Blue Rodeo
official_site           | TEXT                                                | bluerodeo.com
twitter                 | TEXT                                                | bluerodeo
echonest_id             | TEXT                                                | ARH6W4X1187B99274F
spotify_id              | TEXT                                                | 0LcJLqbBmaGUft1e9Mm8HV
rdio_id                 | TEXT                                                | r139688
itunes_id               | TEXT                                                | 700607
location                | TEXT                                                | Abingdon, England, GB
start_yr_active         | SMALLINT                                            | 1969
end_yr_active           | SMALLINT                                            | 1969
img                     | TEXT                                                | https://d3rt1990lpmkn.cloudfront.net/original/1ace43eddbf6010d417d53ce77b584bd6aa11428
echonest_hotttnesss     | REAL DEFAULT 0.0                                    | 0.61081915371492912
spotify_popularity      | SMALLINT DEFAULT 0                                  | 66
created_at              | TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()     | 2014-06-01 04:05:06-08:00
updated_at              | TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()     | 2014-06-01 04:05:06-08:00

##albums
Name                    | Type                                                | Example
----                    | ----                                                | -------
id                      | SERIAL PRIMARY KEY                                  | 1
name                    | TEXT NOT NULL DEFAULT 'unknown'                     | Five Days in July
artist_id               | INTEGER REFERENCES artists                          | 1
release_date            | TEXT                                                | 2004
release_date_precision  | TEXT                                                | year
spotify_id              | TEXT                                                | 5jvbjb51hQQAIycnBFS4cG
rdio_id                 | TEXT                                                | a224383
itunes_id               | TEXT                                                | 306127126
spotify_popularity      | SMALLINT DEFAULT 0                                  | 35
explicit                | BOOLEAN DEFAULT FALSE                               | TRUE
clean                   | BOOLEAN DEFAULT FALSE                               | FALSE
type                    | TEXT                                                | album
upc                     | TEXT                                                | 5099749994324
album_art               | TEXT                                                | https://i.scdn.co/image/07c323340e03e25a8e5dd5b9a8ec72b69c50089d
created_at              | TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()     | 2014-06-01 04:05:06-08:00
updated_at              | TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()     | 2014-06-01 04:05:06-08:00

##tracks
Name                    | Type                                                | Example
----                    | ----                                                | -------
id                      | SERIAL PRIMARY KEY                                  | 1
artist_id               | INTEGER REFERENCES artists                          | 1
album_id                | INTEGER REFERENCES albums                           | 1
track_num               | SMALLINT                                            | 1
name                    | TEXT NOT NULL DEFAULT 'unknown'                     | Five Days in May
echonest_danceability   | REAL                                                | 0.5164314670162907
echonest_energy         | REAL                                                | 0.6617689403520844
echonest_speechiness    | REAL                                                | 0.16405298937493515
echonest_acousticness   | REAL                                                | 0.1331355
echonest_liveness       | REAL                                                | 0.05298937493515
echonest_tempo          | REAL                                                | 74.694
echonest_time_sig       | SMALLINT                                            | 4
echonest_loudness       | REAL                                                | -4.613
echonest_duration       | REAL                                                | 243.64363
echonest_key            | SMALLINT                                            | 6
echonest_mode           | SMALLINT                                            | 1  
explicit                | BOOLEAN DEFAULT FALSE                               | FALSE
clean                   | BOOLEAN DEFAULT FALSE                               | TRUE
spotify_popularity      | SMALLINT DEFAULT 0                                  | 32
type                    | TEXT                                                | track
isrc                    | TEXT                                                | USIR20400274
spotify_id              | TEXT                                                | 0eGsygTp906u18L0Oimnem
rdio_id                 | TEXT                                                | t2714517
itunes_id               | TEXT                                                | 65029521
created_at              | TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()     | 2014-06-01 04:05:06-08:00
updated_at              | TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()     | 2014-06-01 04:05:06-08:00

##genres
Name                    | Type                                                | Example
----                    | ----                                                | -------
id                      | SERIAL PRIMARY KEY                                  | 1
name                    | TEXT                                                | rock
created_at              | TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()     | 2014-06-01 04:05:06-08:00
updated_at              | TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()     | 2014-06-01 04:05:06-08:00

##users
Name                    | Type                                                | Example
----                    | ----                                                | -------
id                      | SERIAL PRIMARY KEY                                  | 1
username                | TEXT NOT NULL                                       | bobloblaw321
email                   | TEXT NOT NULL                                       | blob@domain.com
itunes_lib              | BOOLEAN DEFAULT FALSE                               | FALSE
created_at              | TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()     | 2014-06-01 04:05:06-08:00
updated_at              | TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()     | 2014-06-01 04:05:06-08:00

##users_artists
Name                    | Type                                                | Example
----                    | ----                                                | -------
user_id                 | INTEGER REFERENCES users                            | 1
artist_id               | INTEGER REFERENCES artists                          | 1
itunes                  | BOOLEAN DEFAULT FALSE                               | FALSE
spotify                 | BOOLEAN DEFAULT FALSE                               | FALSE
rdio                    | BOOLEAN DEFAULT FALSE                               | FALSE
PRIMARY KEY (user_id, artist_id)

##users_albums
Name                    | Type                                                | Example
----                    | ----                                                | -------
user_id                 | INTEGER REFERENCES users                            | 1
album_id                | INTEGER REFERENCES albums                           | 1
itunes                  | BOOLEAN DEFAULT FALSE                               | FALSE
spotify                 | BOOLEAN DEFAULT FALSE                               | FALSE
rdio                    | BOOLEAN DEFAULT FALSE                               | FALSE
PRIMARY KEY (user_id, album_id)

##artist_genres
Name                    | Type                                                | Example
----                    | ----                                                | -------
artist_id               | INTEGER REFERENCES artists                          | 1
genre_id                | INTEGER REFERENCES genres                           | 1
PRIMARY KEY (artist_id, genre_id)

##album_genres
Name                    | Type                                                | Example
----                    | ----                                                | -------
album_id                | INTEGER REFERENCES albums                           | 1
genre_id                | INTEGER REFERENCES genres                           | 1
PRIMARY KEY (album_id, genre_id)
