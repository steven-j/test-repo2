#' ---
#' title: "Test of rendering an R script"
#' author: "Steven"
#' date: '`r format(Sys.Date(), "%d %B %Y")`'
#' output: github_document
#' ---

#' Here I'm testing out how to put special #' comments into an ordinary old R
#' script, so that RStudio can turn it into nicely formatted markdown for me.
#' This bit should come out as text. Whereas a line with a normal # comment
#' appears as part of the code.

# Load packages
library(tidyverse)

#' Hmmm... I wonder if there is a way to hide the **result** of running
#' *some chunk of code* from appearing in the markdown file? R attaching packages
#' is not very interesting. (Note adding some **bold** and *italics* there.)
#' 
#' Now I'll write some code to plot the heights of Star Wars characters,
#' arranged by species. The markdown file should contain both the code and the
#' plot that it generates.  
#' Also adding a special #+ comment gives an (invisible?) label to this code
#' chunk --- which is useful in that it means the picture file of the plot R
#' generates for markdown is given a meaningful name.

#+ species height plot
# Extract data from the starwars dataframe that comes with the dplyr package
starwars_heights <- starwars %>%
  select(name, species, height) %>%
  # Drop rows with unknown height or species
  filter(!is.na(height), !is.na(species)) %>%
  # What is the height of the tallest character in each species?
  group_by(species) %>%
  mutate(max_height = max(height)) %>%
  ungroup() %>%
  # Convert species into a factor, ordered by their max heights, so that ggplot
  # will use this ordering in the plot below
  arrange(max_height, species) %>%
  mutate(species = factor(species, unique(species)))

# Use ggplot to make a simple figure
starwars_heights %>%
  ggplot(aes(height, species)) +
  geom_point() +
  ggtitle("Which Star Wars species are the tallest?")

#' Amazing! I'll push this to GitHub to see how it looks there.
