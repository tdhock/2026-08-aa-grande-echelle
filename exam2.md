Examen 2

En plus que toutes les questions de l’examen 1…

## 1. calcul sur carte graphique

Nous avons du code PyTorch, tiré de [ce fichier](https://github.com/tdhock/2023-08-deep-learning/blob/main/homeworks/09_homework.py).

```py
class TorchLearner:
    def __init__(
            self, units_per_layer, step_size=0.01,
            batch_size=20, max_epochs=400):
        self.max_epochs = max_epochs
        self.batch_size=batch_size
        self.model = TorchModel(units_per_layer)
        self.loss_fun = torch.nn.MSELoss()
        self.optimizer = torch.optim.SGD(
            self.model.parameters(), lr=step_size)
    def fit(self, split_data_dict):
        ds = CSV(
            split_data_dict["subtrain"]["X"],
            split_data_dict["subtrain"]["y"])
        dl = torch.utils.data.DataLoader(
            ds, batch_size=self.batch_size, shuffle=True)
        train_df_list = []
        for epoch_number in range(self.max_epochs):
            print(epoch_number)
            for batch_features, batch_labels in dl:
                self.optimizer.zero_grad()
                loss_value = self.loss_fun(
                    self.model(batch_features), batch_labels)
                loss_value.backward()
                self.optimizer.step()
            for set_name, set_data in split_data_dict.items():
                pred_vec = self.model(set_data["X"])
                set_loss_value = self.loss_fun(pred_vec, set_data["y"])
                train_df_list.append(pd.DataFrame({
                    "set_name":[set_name],
                    "loss":float(set_loss_value),
                    "epoch":[epoch_number]
                }))
        self.train_df = pd.concat(train_df_list)
    def predict(self, test_features):
        return self.model(test_features)
```

Comment modifier ce code pour pouvoir utiliser un GPU…
  * A. …si nous avons assez de mémoire pour charger toutes les données ?
  * B. …si nous n’avons pas assez de mémoire pour charger toutes les données ?
  
## 2. Interfaces portables pour code C++ 

Dans le code C++ ci-dessous, tiré de la page 3 de [Rcpp-introduction.pdf](https://cran.r-project.org/web/packages/Rcpp/vignettes/Rcpp-introduction.pdf), nous calculons la convolution entre deux vecteurs a et b.

```cpp
#include "Rcpp.h"
using namespace Rcpp;
// [[Rcpp::export]]
NumericVector
convolve_cpp(const NumericVector& a,
			 const NumericVector& b) {
  // Declare loop counters, and vector sizes
  int i, j,
	na = a.size(), nb = b.size(),
	nab = na + nb - 1;
  // Create vector filled with 0
  NumericVector ab(nab);
  // Crux of the algorithm
  for(i = 0; i < na; i++) {
	for(j = 0; j < nb; j++) {
	  ab[i + j] += a[i] * b[j];
	}
  }
  // Return result
  return ab;
}
```

Bien que ce code est très fonctionnel dans R, il n’est pas très facile d’utiliser avec Python. Vous allez faire quelques modifications pour rendre le code plus portable, en séparant le code dans plusieurs fichiers :

* fichiers pour l’algorithme
  * `convolve.h`, où vous déclarez le prototype d’une fonction qui s’appelle `convolve` (qui fait la convolution).
  * `convolve.cpp`, qui contient le code pour la convolution (`Crux of the algorithm`), mais pas de code spécifique à R.
* fichiers pour les interfaces
  * `interface_Rcpp.cpp`, qui contient `#include "Rcpp.h"`, et `#include "convolve.h"` mais qui ne contient pas de code pour la convolution.
  * `interface_pybind11.cpp`, qui contient `#include <pybind11/pybind11.h>` et `#include <pybind11/numpy.h>` et `#include "convolve.h"` mais qui ne contient pas de code pour la convolution.

## 3. projet de python

Soit un projet python avec les fichiers suivants.

```
interface-proj/pyproject.toml
interface-proj/setup.py
interface-proj/src/.dir-locals.el
interface-proj/src/add.cpp
interface-proj/src/add.h
interface-proj/src/interface.cpp
interface-proj/src/outils.py
interface-proj/src/mypkg/__init__.py
interface-proj/src/mypkg/operateurs.py
```

Dans `pyproject.toml` nous avons

```toml
[build-system]
requires = [
    "setuptools>=42",
    "pybind11>=2.10.0",
]
build-backend = "setuptools.build_meta"
```

Dans `setup.py` nous avons

```py
from pybind11.setup_helpers import Pybind11Extension, build_ext
from setuptools import setup
ext_modules = [
    Pybind11Extension(
        "add_ext",
        ["src/interface.cpp","src/add.cpp"]
    ),
]
setup(
    name="add_dpkg_interface",
    ext_modules=ext_modules,
    package_dir={"":"src"},
    packages=["mypkg"],
    cmdclass={"build_ext": build_ext},
)
```

* Quel est le nom de ce « distribution package » ?
* Il contient quel(s) « python packages » ?
* Il contient quel(s) « python modules » ?
* Il est obligatoire d’écrire combien pages de documentation, avant de mettre ce projet sur PyPI ?
* Il est obligatoire d’écrire combien tests, avant de mettre ce projet sur PyPI ?

