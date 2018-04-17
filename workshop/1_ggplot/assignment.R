# Remember to run this part, it loads in all the tools!
library(ggplot2)
library(tidyr)
library(dplyr)

# 1) use get_artist_audio_features to get some artist data
#    note: the <- is used to save the result as "artist"
artist <- ___


# 2) make a scatter plot using 2 features (e.g. acousticness, speechiness, energy, etc..)
ggplot(artist, aes()) +
  ___


# 3) make the same plot, but color it by album


# 4) make the same plot, but faceted (so each album has its own box)


# 5) try a scatter plot with
#      - x axis: album_release_year
#      - y axis: anything interesting
#    based on what you see, try adding a color


# Preview of next lesson: 
#   - examine the data albums
#   - what is the difference between using geom_point and geom_cols?
#   - what other plots would you like to see?
albums <- artist %>%
  group_by(album_name) %>%
  summarize(energy = mean(energy), valence = mean(valence), danceability = mean(danceability))

ggplot(albums) +
  geom_point(aes(album_name, energy, color = album_name)) +
  theme(axis.text.x = element_blank())

ggplot(albums) +
  geom_col(aes(album_name, energy, fill = album_name)) +
  theme(axis.text.x = element_blank())