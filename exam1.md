Examen 1

* Validation croisée à 4 blocs.
  * pour les données spam, affecter une colonne fold.
  * comment définir les 4 divisions ?
  * comment calcules les 4 mesures d’erreur pour un algorithme d’apprentissage ?
* sur- et sous- apprentissage
  * pour les graphiques dans [ch20.4](https://animint-manual-fr.netlify.app/ch20/#over-under-fitting), expliquer quels paramètres font sur- ou sous- apprentissage.
* choisir le meilleur algorithme d’apprentissage
  * pour les graphiques dans [ch20.3](https://animint-manual-fr.netlify.app/ch20/#test-error-and-accuracy-plots), quel algorithmes sont les meilleurs pour chaque jeu de données ? Comment utiliser un test de Student pour déterminer si un algorithme est significativement différent du meilleur algorithme ?
* validation croisée avec sous-ensembles
  * Dans Figure 5 du [papier sur SOAK](https://onlinelibrary.wiley.com/doi/10.1002/sam.70055), on compare les taux d’erreur de prédiction sur les sous-ensembles dans 20 jeux de données. Dans quels jeux de données…
  * on est mieux d’apprendre un seul modèle, avec les données à travers tous les sous-ensembles, pour calculer les prédictions dans toutes les sous-ensembles ? (modélisation globale)
  * on est mieux d’apprendre plusieurs modèles, un pour chaque sous-ensemble, chacun entraîné avec seulement les données du sous-ensemble ? (modélisation locale)
  * il n’y a pas de différence significative entre la modélisation locale et globale.
  * il faudrait une modélisation hybride (locale pour prédire dans certains sous-ensembles, globale pour d’autres sous-ensembles).
* pour le calcul des résultats dans ch20, et Figure 5, combien de combinaisons peut-on calculer en parallèle ? Écrire le code pour les dictionnaires en python qu’on utilise pour construire le fichier CSV des combinaisons.
