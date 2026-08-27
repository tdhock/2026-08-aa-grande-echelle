Le but de ce TP est d’explorer les GPUs pour l’entraînement d’un réseau de neurones.

Sur [Travailler avec un GPU](https://docs.alliancecan.ca/wiki/PyTorch/fr#Travailler_avec_un_GPU) il y a un code pour l’entraînement avec GPU.
Copier et modifier ce code.

* Utiliser `nn.Sequential()` dans `forward()`.
* Supprimer `.cuda()` et utiliser `.to(device)`.
* Rajouter une boucle sur époques (avant la boucle sur les lots de `train_loader`).
* Faire deux DataLoaders, en divisant les données entraînement (train) en sous-entraînement et validation, avec [Subset](https://docs.pytorch.org/docs/stable/data.html#torch.utils.data.Subset).
* utiliser uniquement l’ensemble sous-entraînement pour le calcul des gradients, et mises à jour des poids.
* À la fin de chaque époque, calculer l’erreur moyenne sur les deux ensembles (sous-entraînement et validation), et stocker dans un DataFrame.
  * attention, faire une boucle sur les deux ensembles (et non des blocs de code répétés).
* À la fin de l’entraînement, sauvegarder un fichier CSV avec l’erreur pour toutes les époques.
* Faire un graphique pour les courbes d’erreur, comme dans [20.4.2](https://animint-manual-fr.netlify.app/ch20/#torch), mais avec plotnine dans python. On devrait voir une différence entre sous-entraînement et validation :
  * la perte sur sous-entraînement descende toujours,
  * la perte sur validation descende en premier, pour ensuite rémonter plus tard.

Faire tourner votre code avec plusieurs différents choix pour nombre de workers, batch size, et device (cpu ou cuda, sur grappe ou sur votre ordi).

Montrer les sorties pour le temps de calcul.
Quand est-ce que vous observez que le GPU est avantageux ?

# PDF à soumettre

Soumettez un fichier PDF avec vos codes, vos réponses, et vos graphiques.

* mettez en gras une section « extra points » si vous tenter les exercises facultatives ci-dessous.
* suivez [les standards dans la rédaction de code python](https://docs.google.com/document/d/1Co1y6bvnNdadnzwAt575JFLkIvGZsQ35ED3QJgMfA3Y/edit?tab=t.0)

# extra points

* +10 si vous comparez le temps d’entraînement sur la grappe, avec votre ordi personnel.

