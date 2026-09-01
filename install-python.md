Pour réaliser les devoirs, vous devez utiliser Emacs et Python.

Il est recommandé d'installer/d'utiliser [Anaconda/Miniconda](https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html).

Emacs est requis pour ce cours. Il vous permet d'écrire et de modifier du code
sans utiliser la souris, et offre une excellente prise en charge de Python,
notamment les environnements conda, l'exécution interactive, la complétion automatique, etc.

Mes vidéos sur Emacs et Python vous montrent comment installer Emacs et le configurer pour fonctionner avec Python.

Téléchargez et installez GNU Emacs. 

- [Instructions d'installation d'Elpy, un EDI Python pour Emacs](https://elpy.readthedocs.io/en/latest/introduction.html#installation).
- [La page PythonProgrammingInEmacs sur l'EmacsWiki contient des instructions pour configurer d'autres EDI Python pour Emacs](https://www.emacswiki.org/emacs/PythonProgrammingInEmacs).
- Si vous souhaitez coder dans un autre logiciel qu'Emacs, vous devez me montrer que vous pouvez exécuter du code Python de manière interactive. Cela signifie avoir une fenêtre avec le code Python, une autre fenêtre avec la console Python, et pouvoir utiliser une commande clavier pour exécuter une ou plusieurs lignes de code à la fois (dans une boucle ou fonction éventuellement), et voir immédiatement le résultat dans la console.

## Instructions pour conda

Après avoir [téléchargé conda](https://docs.conda.io/en/latest/miniconda.html) et avant d'activer un environnement, vous devez configurer votre shell pour la première fois.

```shell-script
conda init bash
```

Cela devrait ajouter du code à votre fichier `~/.bash_profile`. J'ai dû le copier dans mon fichier `~/.bashrc` pour que cela fonctionne sur ma configuration (git bash dans `M-x shell` dans Emacs sous Windows). Après avoir redémarré votre shell, vous devriez voir un préfixe `(base)` dans votre invite de commande, indiquant le nom de l'environnement conda actuellement activé. 

Ensuite, vous pouvez installer Python, avec la même version que j'utilise, via :

```shell-script
conda create -n a2026
conda activate a2026
conda install python=3.12.3
```

Cela devrait créer et activer un nouvel environnement conda avec la version Python requise.

Une fois activé, cet environnement sera utilisé pour les nouveaux processus Python, la recherche de modules Python, etc.

```
(a2026) hoct2726@dinf-thock-02i:~/teaching/2026-08-aa-grande-echelle[main]$ python
Python 3.12.3 | packaged by Anaconda, Inc. | (main, May  6 2024, 19:46:43) [GCC 11.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import re
>>> re
<module 're' from '/home/local/USHERBROOKE/hoct2726/miniconda3/envs/a2026/lib/python3.12/re/__init__.py'> 
```

Ci-dessus on voit que conda est installé dans `/home/local/USHERBROOKE/hoct2726/miniconda3` — vous allez devoir mettre ce dossier dans le fichier de configuration d’emacs, pour que votre emacs puisse utiliser vos environnements conda.

## Prise en charge de Python dans Emacs

Tout d'abord, si vous utilisez Emacs pour la première fois, veuillez taper `C-h t` (tapez h en maintenant la touche Ctrl enfoncée, puis relâchez-la et tapez t) pour ouvrir le tutoriel Emacs. Lisez l'intégralité du tutoriel et faites tous les exercices, qui vous apprendront les raccourcis clavier les plus importants pour naviguer et modifier le code. Répétez le tutoriel chaque jour jusqu'à ce que vous ayez mémorisé tous les raccourcis clavier.

Pour bénéficier de la prise en charge de Python dans Emacs, j'ai dû installer les paquets Emacs (elpy, conda). Pour ce faire, il faut d'abord ajouter le code suivant à votre fichier `~/.emacs` (qui contient les commandes spécifiques à l'utilisateur exécutées au démarrage d'Emacs) afin de lui indiquer de télécharger les paquets depuis le dépôt MELPA,

```elisp
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(require 'use-package-ensure)
(setq use-package-always-ensure t)
(use-package elpy)
(use-package conda)
(use-package gnu-elpa-keyring-update)
(elpy-enable)
(setq elpy-shell-starting-directory 'current-directory)
(setq conda-anaconda-home (expand-file-name "~/miniconda3")); à modifier, où est conda installé sur votre ordi ? 
(setq conda-env-home-directory conda-anaconda-home)
(setq python-shell-interpreter "python");not "python3" !
```

Assurez-vous de remplacer le chemin `~/miniconda3` par le dossier où se trouve conda sur votre ordi, puis redémarrez Emacs.
Après avoir ajouté ce code à votre fichier `~/.emacs`, redémarrez Emacs, puis normalement vous aurez accès à ces packages (elpy,conda), téléchargés automatiquement depuis MELPA, si besoin.

Dans Emacs, lors de l'édition d'un fichier Python, vous pouvez activer l'environnement conda : via `M-x conda-env-activate RET a2026 RET` puis `C-c C-z` pour obtenir un interpréteur interactif,

- `C-RET` pour exécuter ligne par ligne et pas à pas,
- `C-c C-c` pour envoyer le buffer.
- `C-c C-r` pour envoyer le region.

Consultez :

- `C-h m` pour afficher toutes les commandes disponible dans le mode elpy,
- https://elpy.readthedocs.io/en/latest/ide.html pour plus de commandes clés Elpy (envoi de code depuis des fichiers Python vers l'interpréteur interactif), et 
- https://realpython.com/emacs-the-best-python-editor/ pour un tutoriel intéressant sur Emacs et Python.

