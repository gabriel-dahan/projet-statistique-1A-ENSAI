# Projet Statistique

## Installation

Premièrement, il faut installer `conda`, puis créer l'environnement du projet :

```bash
conda create --name .R.env r-essentials r-base quarto
conda activate .R.env
```

Ensuite, installer quarto dans une console R (ouverte avec la commande `R`) :

```R
install.packages("quarto")
```