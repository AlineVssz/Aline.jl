
using Aline
using GLM

donnees =tout("data/train.csv")
modele2= entrainer_interface(donnees)

coeffs = coeff(modele2)
#coeffs_int = coeffs5_interface(coeffs)

valeurs= Dict("GrLivArea"=>1400, "OverallQual"=>5, "GarageCars"=>1, "YearBuilt"=>1980, "TotalBsmtSF"=>800)
prix_estime = prediction_interface(valeurs, coeffs)
println("Prix estimé : ", round(prix_estime))

donnees = tout("data/train.csv")
modele2 = entrainer_interface(donnees)
coeffs = coeff(modele2)

function predire_maison(valeurs::Dict)
    prediction_interface(valeurs, coeffs)
end