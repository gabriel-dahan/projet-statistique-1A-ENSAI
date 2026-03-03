# Chargement des librairies
library(tidyverse)
library(sf)
library(rnaturalearth)

# ÉTAPE 1 : Préparer vos statistiques
# On calcule la moyenne des scores en maths pour chaque pays
scores_par_pays <- responses |>
  group_by(country) |>
  summarise(moyenne_math = mean(pv_math, na.rm = TRUE)) |>
  tidyr::drop_na(moyenne_math) 

# ÉTAPE 2 : Récupérer le fond de carte du monde
# L'argument returnclass = "sf" est crucial pour que ggplot le comprenne
monde <- ne_countries(scale = "medium", returnclass = "sf")

# ÉTAPE 3 : Fusionner la géographie et les statistiques
# Dans PISA, la variable 'country' (qui vient de CNT) est le code ISO à 3 lettres (ex: "FRA", "JPN").
# Dans la carte 'monde', cette information se trouve dans la colonne 'iso_a3'.
carte_donnees <- monde |>
  left_join(scores_par_pays, by = c("iso_a3" = "country"))

# ÉTAPE 4 : Dessiner la carte
ggplot(data = carte_donnees) +
  # geom_sf remplace les geom_bar ou geom_histogram pour les cartes
  geom_sf(aes(fill = moyenne_math), color = "white", size = 0.1) +
  # scale_fill_viridis_c est une palette de couleurs très lisible et scientifique
  scale_fill_viridis_c(
    option = "plasma", 
    na.value = "lightgray", # Les pays non présents dans PISA seront en gris
    name = "Score moyen\nen Mathématiques"
  ) +
  labs(
    title = "Performances moyennes en mathématiques selon le pays",
    subtitle = "Données issues de l'enquête PISA 2022",
    caption = "Source des géométries : rnaturalearth"
  ) +
  theme_minimal() +
  # On nettoie le graphique pour faire disparaître les coordonnées GPS (longitude/latitude)
  theme(
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    panel.grid = element_blank()
  )
