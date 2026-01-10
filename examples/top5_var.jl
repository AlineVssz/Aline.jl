
using Aline
using GLM

donnees =tout("data/train.csv")
modele= entrainer(donnees)
top5= top5_variables(modele, 5)
print(top5)
