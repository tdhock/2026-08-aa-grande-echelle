Le but de ce TP est de créer un package Python qui peut appeler une fonction C++.

Nous traitons l’exemple de médiane cumulative dans les diapos [Créer un package Python](https://docs.google.com/presentation/d/1gt9H9uRcep5-O6M9Mkkv2jjouK9jEHBWAWjXflyuJ6c/edit?slide=id.g3cf41340c08_0_58#slide=id.g3cf41340c08_0_58).

Votre package doit contenir

* `setup.py`
* `pypackage.toml`
* `tests/test_cum_médiane.py` avec au moins ces tests
  * erreur quand il y a des données répétées.
  * la bonne sortie pour les 5 données sur [la diapo](https://docs.google.com/presentation/d/1gt9H9uRcep5-O6M9Mkkv2jjouK9jEHBWAWjXflyuJ6c?slide=id.g3cf2ddf2dd3_0_59#slide=id.g3cf2ddf2dd3_0_59).
* `src/interface.cpp`
  * fonction `cum_médiane(numpy_array_de_doubles)` qui converti le tableau numpy en pointeur, utiliser pour appeller `cum_médiane()`.
* `src/cum_médiane.cpp`
* `src/cum_médiane.h` qui a

```c++
#define SUCCESS 0
#define ERROR_DONNÉES_RÉPÉTÉES 1
int cum_médiane(const double* données_ptr, const int taille, double* sortie_ptr);
```

# PDF à soumettre

Soumettez un fichier PDF avec vos codes, ainsi que les sorties de ces commandes : (on devrait y voir les lignes de commande de compilateur)

```bash
pip install -v ./votre_package
pytest votre_package/tests/
```

Aussi executer dans python

```py
import votre_module
votre_module #affiche l’emplacement du module sur votre ordi
import numpy as np
données = np.random.randn(10)
données #affiche les valeurs
votre_module.cum_médiane(données)
```

* mettez en gras une section « extra points » si vous tenter les exercises facultatives ci-dessous.
* suivez [les standards dans la rédaction de code python](https://docs.google.com/document/d/1Co1y6bvnNdadnzwAt575JFLkIvGZsQ35ED3QJgMfA3Y/edit?tab=t.0)

# extra points

* +10 si vous faites un site web de documentation sur readthedocs. 
  * Écrire docstrings comme dans [`python_example`](https://github.com/pybind/python_example).
  * Suivre [ce tutoriel](https://py-pkgs.org/03-how-to-package-a-python#hosting-documentation-online) pour mettre en place vos docs sur readthedocs.

