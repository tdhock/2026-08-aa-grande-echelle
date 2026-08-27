Le but de ce TP est de créer un package R avec un nouveau Learner pour mlr3.

[Inscrivez-vous ici](https://github.com/tdhock/2026-01-aa-grande-echelle/wiki/projets) pour que chacun travaille sur un sujet différent.

# Contenu du package

La documentation du package devrait être en anglais, car nous allons soumettre le Learner ensuite pour inclusion dans `mlr3extralearners`, ce qui est en anglais.

Votre package doit contenir, dans un dépôt sur GitHub,

* `R/Learner.R`, définir nouvelle classe pour votre Learner.
  * utiliser `other.pkg::other.funs()` pour les fonctions train et predict.
  * dans `initialize()` définir au moins un hyper-paramètre, `param_set = paradox::ps(…)`
* `man/Learner.Rd`, documentation pour votre Learner.
  * exemple avec `train()` et `predict()`.
  * pour données, utiliser `mlr3::tsk()`.
* `tests/`
  * `testthat.R`: `if(require(testthat))test_check("ton.pkg")`
  * `testthat/test-CRAN.R`
    * au moins un bloc `test_that()` 
	* faire train et predict.
	* utiliser `expect_*()` pour checker que les predictions sont comme attendus.
* `DESCRIPTION`
  * `Imports: other.pkg` le package avec les fonctions que vous appelez dans train et predict.
  * `Suggests: testthat`
* `NAMESPACE`: exporter votre Learner.
* `.github/workflows/check.yaml`: une copie de [ce fichier](https://github.com/NAU-ASD3/nsch/blob/main/.github/workflows/check.yaml) devrait marcher sans modification dans votre projet.
  * attention à regarder la sortie de `R CMD check` et arranger tous les ERRORS et WARNINGs, voir [Appendix A de R Packages](https://r-pkgs.org/R-CMD-check.html) pour trouver les solutions aux problèmes fréquents.
* `README.md` avec affichage [comme le README dans slurm](https://github.com/tdhock/slurm/blob/master/README.org) ou [comme le README dans nsch](https://github.com/NAU-ASD3/nsch/blob/main/README.md), y compris sections
  * installation
  * utilisation (Usage)
  * Related work avec liens
    * vers le wiki du cours, https://github.com/tdhock/2026-01-aa-grande-echelle/wiki/projets
	* vers l’autre package que vous utilisez pour train et predict.
	
# Démo/Benchmark du package

Faire une démonstration que votre package marche pour l’apprentissage.
Écrire un script R qui utilise votre package dans un `mlr3::benchmark()`.

* Utiliser au moins deux jeux de données (de régression ou classification).
* Votre benchmark doit comprendre au moins 4 Learners
  * ton nouveau Learner
  * featureless (pour démontrer que votre Learner apprend quelque chose de non-triviale)
  * modèle linéare, `mlr3learners::Learner*CVGlmnet`
  * plus proche voisins, avec `auto_tuner` pour choisir le meilleur nombre de voisins entre 1 et 30.
* Validation croisée à 5 blocs.
* Calculer les taux d’erreur de prédiction dans la validation croisée.

Utilisez `ggplot2` pour dessiner les résultats.

* X = taux d’erreur
* Y = algorithme
* un point pour chaque division de validation croisée
* `facet_grid()` un panneau pour chaque jeu de données

Comme ça 

![alt](tp1-err-dots.png)

![alt](tp1-err-facets.png)

Écrire une réponse à ces questions :

* est-ce que votre algorithme apprend quelque chose de non-triviale dans les deux jeux de données ?
* est-ce que votre algorithme est aussi bon que le modèle linéaire et les plus proches voisins ?

# PDF à soumettre

Soumettez votre rapport en fichier PDF (en français ou anglais) avec 

* un lien vers votre package dans un dépôt public sur GitHub,
* vos codes pour la démo/benchmark,
* votre graphique pour l’erreur de prédiction dans la validation croisée.
* vos réponses aux questions ci-dessus.
* mettez en gras une section « extra points » si vous tenter les exercices facultatives ci-dessous.
* suivez [les standards dans la rédaction de code R](https://docs.google.com/document/d/1Mw5Nk9UHEoF_c1b5JqDCdeXP5pX1HPCQ8HSGCsVSw7M)

# extra points

* +10 si vous faites la démo/benchmark dans `vignettes/benchmark.Rmd`
* +10 si vous faites un site web de documentation sur netlify. 
  * exemple [atime](https://github.com/tdhock/atime), [docs](https://atime-docs.netlify.app/manual#sec:man-atime)
  * exemple [mlr3resampling](https://github.com/tdhock/mlr3resampling), [docs](https://mlr3resampling.netlify.app/)
  * [diapos pour configuration de Netlify](https://docs.google.com/presentation/d/1WpRZs9qz9wm1yik_MLj8tIJyWuL5-IBPYKLhOHZ9X4Y/edit?slide=id.g36614b10874_0_61#slide=id.g36614b10874_0_61)
* +10 si vous faites un GitHub Action pour calculer Couverture des tests, avec résultats accessibles sur Codecov.
  * Pour configuration vous pouvez utiliser [ce fichier](https://github.com/tdhock/nc/blob/master/.github/workflows/test-coverage.yaml).
  * Ajouter un lien vers votre Codecov dans votre `README.md`, par ex https://app.codecov.io/gh/tdhock/nc?branch=master
