using Aline
using GLM

donnees = tout("data/train.csv")
modele2 = entrainer_interface(donnees)
coeffs = coeff(modele2)

function predire_maison(valeurs::Dict)
    prediction_interface(valeurs, coeffs)
end