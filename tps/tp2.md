Le but de ce TP est de démontrer que différents algorithmes d’apprentissage sont préférables pour différents jeux de données.
On fait la même chose que TP1 mais avec R+mlr3 au lieu de Python+sklearn.
Lire [ch20](https://131-merge--animint-manual-fr.netlify.app/ch20/ch20-viz) et [son fichier source qmd](tp2_Ch20_source.qmd) pour comprendre mlr3.

Téléchargez [vowel](https://hastie.su.domains/ElemStatLearn/datasets/vowel.train) et [waveform](https://hastie.su.domains/ElemStatLearn/datasets/waveform.train) (pas besoin des données test).
Ce sont deux jeux de données de classification.
Créer une liste de deux `Task`s.

Utilisez `mlr3::rsmp("cv")` pour validation croisée à 5 divisions.

Créer une liste de 3 algorithmes d’apprentissage :

* modèle lineaire avec régularisation L1, `mlr3learners::LearnerClassifCVGlmnet$new()`
* modèle sans caractères, `mlr3::LearnerClassifFeatureless$new()`
* `mlr3tuning::auto_tuner` avec `mlr3learners::LearnerClassifKKNN$new()` pour coder les plus proches voisins, avec nombre de voisins entre 1 et 40.

Utiliser `benchmark_grid` et `benchmark` pour calculer les taux d’erreur de prédiction dans la validation croisée, sur chaque jeu de données, avec chaque algorithme d’apprentissage.
Utilisez `ggplot2` pour dessiner les résultats.

* X = taux d’erreur
* Y = algorithme
* un point pour chaque division de validation croisée
* `facet_grid()` un panneau pour chaque jeu de données

Comme ça 

![alt](tp1-err-dots.png)

![alt](tp1-err-facets.png)

Écrire une réponse à ces questions :

* pour vowel, quel algorithme donne les meilleures prédictions ?
* pour waveform, quel algorithme donne les meilleures prédictions ?
* est-ce que les résultats dans R sont cohérents avec ceux dans python ?

Soumettez un fichier PDF avec vos codes, vos réponses, et vos graphiques.

* mettez en gras une section « extra points » si vous tenter les exercises facultatives ci-dessous.
* suivez [les standards dans la rédaction de code R](https://docs.google.com/document/d/1Mw5Nk9UHEoF_c1b5JqDCdeXP5pX1HPCQ8HSGCsVSw7M)

## extra points

* +10 si vous rajoutez un autre algorithme d’apprentissage (forêt aléatoire, arbre de décision, boosting, réseau de neurones, et cætera).
* +10 si vous dessiner un graphique avec le taux d’erreur pour chaque nombre de voisins, [comme dans le ch20](https://131-merge--animint-manual-fr.netlify.app/ch20/ch20-viz#nearest-neighbors-selection).
* +10 si vous rajoutez `geom_text` avec la moyenne ± écart type, trier Y par moyenne, et un autre `geom_text` avec P d’un T-test pour savoir s’il y a une différence significative entre les algos, comme ça

![alt](tp1-err-pval.png)


