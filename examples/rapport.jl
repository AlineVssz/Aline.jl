using Bonito

app = App() do
    return DOM.div(
        style="max-width: 800px; margin: 50px auto; font-family: Arial;",
        
        DOM.h1("Rapport Projet Julia", style="text-align: center;"),
        DOM.p("Aline Vissuzaine", style="text-align: center; font-style: italic;"),
        DOM.p("Khadim Fall", style="text-align: center; font-style: italic;"),
        DOM.br(),
        
        DOM.h2("1. Description du projet"),
        DOM.p("Notre projet initial était de répondre au challenge Kaggle \"House Prices - Advanced Regression Techniques\", consistant à prédire le prix d'une maison grâce à 80 critères immobiliers."),
        DOM.p("Pour se faire, le but était de construire un modèle nous permettant d'expliquer \"Sales Prices\", le prix de nos maisons, selon nos autres variables, nous nous sommes ainsi tourné vers un modèle de régression linéaire standard."),
        DOM.p("Suite à nos échanges nous avons étendus le projet à la création d'une interface exploitable par des utilisateurs."),
        DOM.p("Nous nous sommes basés sur le dataset \"train.csv\" pour faire notre projet, c'est un dataset comprenant 1460 lignes et 80 colonnes."),
        
        DOM.h2("2. Traitement des données"),
        DOM.p("La première étape de notre projet était de correctement traiter nos données, en effet il comportait un mélange de variables quantitatives et qualitatives. Ces dernières ne sont pas exploitables par les modèles linéaires de base de Julia."),
        DOM.p("Il nous fallait alors encoder certains de nos facteurs, nous sommes partis sur un encodage \"One-hot encoding\", cela correspond à notre fonction 'encoder' de notre script 'encode.jl'."),
        DOM.p("Cette fonction n'était pas forcément dure à réaliser mais c'était notre première rencontre avec le langage Julia."),
        DOM.p("Un problème était d'arriver à séparer nos variables quantitatives et qualitatives, heureusement Julia nous permet de dire quelles colonnes sont numériques, ainsi après avoir découvert ceci les reste à été plutôt fluide."),
        DOM.p("Nous avons préféré fabriquer nous même l'encodage, bien que des fonctions pré-faites auraient été plus efficaces car Julia gère les boucles d'une manière bien plus performante que Python."),
        DOM.p("Nous avons donc une fonction 'lire' pour lire automatiquement n'importe quel fichier, puis une autre pour encoder les possibles variables qualitatives, nous avons tout combiné dans la fonction 'tout' qui ouvre le fichier, enlève les colonnes dont certaines valeurs sont manquantes, supprime la colonne des identifiants puis encode nos données."),
        DOM.p("Notre dataset est maintenant exploitable par n'importe quel modèle."),
        
        DOM.h2("3. Le modèle"),
        DOM.p("Nous avons créé un premier modèle sous le fichier 'modele.jl', c'est un simple modèle de régression linéaire, le plus dur était de comprendre comment faire notre formule car le github du package GLM n'était pas forcément limpide. Ceci correspond à la fonction 'entrainer' qui met de coté le prix et utilise les autres variables pour l'expliquer, une fois entrainer(dataset) fait nous avions entrainé notre modèle sur les données de train.csv."),
        DOM.p("Une fois cela fait nous avons créé la fonction 'predire' sur 'predire.jl' qui nous permet de retourner un prix de vente."),
        DOM.p("Nous pensions avoir fait le plus gros du travail et pouvoir passer directement à notre interface, malheureusement nous nous sommes rendus compte que demander à un utilisateur 80 critères était absurde."),
        DOM.p("Ainsi, il nous fallait choisir seulement quelques variables a demander à notre usager, nous avons décidé de n'en prendre que 5."),
        DOM.p("Notre première idée était de prendre les 5 variables les plus \"significatives\" de par leurs coefficients de notre modèle, nous avons donc implémenté la fonction 'coeff' qui nous donne chaques noms de nos variables avec leurs coefficient pour notre modèle."),
        DOM.p("Après cette fonction réalisée nous avons conçu 'top5_variables' qui prend chaque coefficients en valeur absolue (sauf l'intercept), les trie en ordre décroissant puis retourne les 5 premières."),
        DOM.p("Malheureusement les variables renvoyées n'étaient pas du tout celles escomptées, en effet nos 5 variables étaient sur le type de matériaux utilisé sur le toit."),
        DOM.p("Cela vient forcément du One hot encoding, mais dans tous les cas il est ridicule de demander uniquement la composition du toit pour prédire le prix d'une maison."),
        DOM.p("Nous avons donc choisis artificiellement les 5 variables les plus simple a donner par l'utilisateur :"),
        DOM.ul(
            DOM.li("La surface habitable, en mètre carré."),
            DOM.li("La qualité générale de l'habitation, allant de 1 à 10."),
            DOM.li("Le nombre de place de garage."),
            DOM.li("L'année de la construction du bâtiment."),
            DOM.li("La surface du sous-sol ou de la cave, en mètre carré.")
        ),
        DOM.p("Nous avons ensuite poursuivi dans la prédiction simplifiée pour notre interface."),
        DOM.p("Pour cela nous avons créé 'prediction_interface' qui prend les valeurs d'un nombre de variables, les multiplie avec leurs coefficients respectifs puis les ajoute avec l'intercept."),
        DOM.p("Cependant, après un test avec une maison aux valeurs moyennes\" nous arrivions à 700 000€ environs, ce qui est absurde."),
        DOM.p("C'est absolument normal car notre modèle s'était basé sur un ensemble de 80 variables et non pas 5, ainsi nos résultats étaient grandement faussés."),
        DOM.p("Nous avons alors décidé de recréer un modèle, nommé 'entrainer_interface', basé uniquement sur nos 5 variables, celui-ci arrivait à environ 150 000€ pour les mêmes valeurs ce qui est beaucoup plus raisonnable."),
        
        DOM.h2("4. L'interface"),
        DOM.p("La dernière étape de notre projet était la création de notre interface interactif, sur lequel un client pourrait prédire le prix de sa propre maison."),
        DOM.p("Nous avons décidé de faire cette interface par le biais de Bonito, qui nous lancerait ainsi une page web pour l'utilisation, car le projet semblait plutôt simple avec nos 5 variables et donc approprié à Bonito."),
        DOM.p("Ce procédé était de loin le plus complexe et frustrant car la nouvelle version de Bonito n'a pas vraiment de page github explicative pour l'instant, j'ai même essayé de demander de l'aide à chatGPT pour le fonctionnement mais lui-même n'est apparemment pas à jour sur la nouvelle version et n'a donc pas su nous répondre."),
        DOM.p("Un grand problème a été de comprendre qu'il fallait créer les cases de réponses (que complète l'usager) ainsi que le bouton et son fonctionnement AVANT de créer l'interface en lui-même."),
        DOM.p("Ensuite il a fallu comprendre que les réponses de l'utilisateur, bien que des chiffres, étaient en fait considérées comme des String et donc incompatible avec la fonction 'prediction_interface' si nous ne les convertissions pas."),
        DOM.p("La mise en place de l'interface était également compliquée mais nous avons fini par trouver des ressources sur des sites nous expliquant les bases graphiques."),
        DOM.p("Un problème majeur a été de faire apparaitre le résultat une fois le bouton cliqué, il fallait en effet préciser que le résultat devait être \"Observable\"."),
        DOM.p("Une fois toutes nos fonctionnalités opérationnelles, nous avons pu légèrement personnaliser l'apparence de notre interface et enfin finir notre projet :) .")
    )
end