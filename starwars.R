#' ---
#' title: "Test of rendering an R script"
#' author: "Steven"
#' date: '`r format(Sys.Date(), "%d %B %Y")`'
#' output: github_document
#' ---

#' Here I'm testing out how to put special #' comments into an ordinary old R
#' script, so that RStudio can turn it into nicely formatted markdown for me.
#' This bit should come out as text. Whereas with a normal # comment, what comes
#' next looks like part of the code.

# Load packages
library(tidyverse)

#' Hmmm... I wonder if there is a way to hide the **result** of running
#' *some chunk of code* from appearing in the markdown file? R attaching packages
#' is not very interesting. (Note adding some **bold** and *italics* there.)
#' 
#' Now I'll write some code to plot the heights of Star Wars characters,
#' arranged by species. The markdown file should contain both the code and the
#' plot that it generates. 
starwars %>%
  filter(!is.na(height), !is.na(species)) %>%
  group_by(species) %>%
  mutate(max.height = max(height)) %>%
  ungroup() %>%
  arrange(max.height, species) %>%
  mutate(species = factor(species, unique(species))) %>%
  ggplot(aes(height, species)) +
  geom_point()

#' Amazing! I'll push this to GitHub to see how it looks there.
