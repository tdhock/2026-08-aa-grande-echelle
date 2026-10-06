Le but de ce TP est d’apprendre comment faire la validation croisée en parallèle sur une grappe de calcul.

Lire le blog « [Comparing neural network architectures using mlr3torch](https://tdhock.github.io/blog/2025/mlr3torch-conv/) » et [son fichier source Rmd](tp3_blog.Rmd) pour comprendre mlr3torch.

Utiliser [ce code R](MNIST_FashionMNIST_small.R) pour
* Téléchargez [`MNIST_FashionMNIST.csv`](https://rcdata.nau.edu/genomic-ml/cv-same-other-paper/data_Classif/MNIST_FashionMNIST.csv) qui contient deux jeux de données.
* Ce sont deux jeux de données de classification d’image, à 10 classes, et à 70 000 lignes chacun.
* sous-échantilloner pour obtenir 700 exemples de chaque classe (ou moins si votre ordi est trop lent), dans chacun des deux jeux de données.
* Créer une liste de deux `Task`s (MNIST et FashionMNIST).

Utilisez `mlr3::rsmp("cv")` pour validation croisée à 10 divisions. (ou 5 si vous voulez que ça roule plus vite)

Créer une liste de 6 algorithmes d’apprentissage :

* les 5 algorithmes déjà dans le blog.
* `mlr3tuning::auto_tuner` avec `mlr3learners::LearnerClassifKKNN$new()` pour coder les plus proches voisins, avec nombre de voisins entre 1 et 40.

Utiliser `mlr3::benchmark_grid()` et `mlr3batchmark::batchmark()` pour calculer les taux d’erreur de prédiction dans la validation croisée, sur chaque jeu de données, avec chaque algorithme d’apprentissage, sur la grappe de calcul.
Utilisez `ggplot2` pour dessiner les résultats.

* X = taux d’erreur
* Y = algorithme
* un point pour chaque division de validation croisée
* `facet_grid()` un panneau pour chaque jeu de données

Comme ça 

![alt](tp1-err-dots.png)

![alt](tp1-err-facets.png)

Écrire une réponse à ces questions :

* pour MNIST, quel algorithme donne les meilleures prédictions ?
* pour FashionMNIST, quel algorithme donne les meilleures prédictions ?

Soumettez un fichier PDF avec vos codes, vos réponses, et vos graphiques.

* mettez en gras une section « extra points » si vous tenter les exercises facultatives ci-dessous.
* suivez [les standards dans la rédaction de code R](https://docs.google.com/document/d/1Mw5Nk9UHEoF_c1b5JqDCdeXP5pX1HPCQ8HSGCsVSw7M)

## extra points

* +10 si vous faites les calculs sur la grappe.
  * faire `store_models=FALSE` pour limiter la mémoire vive qu’il vous faut.
  * Combien de tâches avez-vous calculé en parallèle sur la grappe ?
  * Ça a pris combien de temps entre le lancement et la récuperation de résultats ?
  * Combien de CPUs avez-vous sur votre ordinateur ?
  * Si vous faites les mêmes calculs sur votre ordinateur, combien de temps estimez-vous que ça prend ?
  * D’après ces différences en temps de calcul, la grappe est combien de fois plus vite que votre ordinateur ?
* +10 si vous dessinez un graphique représentant le temps de calcul de chaque algorithme. Indice : `batchtools::getJobTable()$time.running` est le temps en secondes (pour entraînement et prédiction).
* +10 si vous rajoutez un autre algorithme d’apprentissage (forêt aléatoire, arbre de décision, boosting, et cætera).
* +10 si vous dessinez un graphique avec le taux d’erreur pour chaque nombre de voisins, [comme dans le ch20](https://131-merge--animint-manual-fr.netlify.app/ch20/ch20-viz#nearest-neighbors-selection).
* +10 si vous rajoutez `geom_text` avec la moyenne ± écart type, trier Y par moyenne, et un autre `geom_text` avec P d’un T-test pour savoir s’il y a une différence significative entre les algos, comme ça

![alt](tp1-err-pval.png)


