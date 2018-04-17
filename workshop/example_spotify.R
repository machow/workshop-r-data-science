library(spotifyr)
library(dplyr)
library(ggplot2)
library(plotly)

artist <- get_artist_audio_features("The Beatles")

# view data -------------------------------------------------------------------
# drop some uneccessary columns, and sort by popularity (higher is more popular)
artist %>%
  select(-album_uri, -album_img, -track_uri, -track_preview_url) %>%
  arrange(track_popularity) %>%
  View()

# energy vs valence -----------------------------------------------------------
# get only 1 album, store result as "album"
album <- artist %>%
  filter(album_name == "Abbey Road (Remastered)") %>%
  select(album_name, track_name, energy, valence, track_popularity)

# make a scatterplot of energy vs valence
ggplot(album) +
  geom_point(aes(x = energy, y = valence)) +
  geom_text(aes(x = energy, y = valence, label = track_name),
            hjust = 'left', size = 2, nudge_x = .01)

ggplotly()

# song year vs popularity -----------------------------------------------------

ggplot(artist) +
  geom_point(aes(album_release_year, track_popularity, color = album_name, annotate=track_name))

ggplotly()

# view other song features ----------------------------------------------------
library(tidyr)
top6 <- artist %>%
  arrange(desc(track_popularity)) %>%
  top_n(6) %>%
  select(track_name, danceability, energy, speechiness, valence) %>%
  gather(sentiment, value, -track_name)

ggplot(top6) +
  geom_col(aes(sentiment, value, fill = sentiment)) +
  facet_wrap(~track_name) + theme(axis.text.x = element_blank())