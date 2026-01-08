using Aline

donnees =tout("data/train.csv")
modele = entrainer(donnees)
#top5 = top5_variables(modele)

coeffs = coeff(modele)
coeffs_int = coeffs5_interface(coeffs)

valeurs= Dict("GrLivArea"=>1500, "OverallQual"=>7, "GarageCars"=>2, "YearBuilt"=>2005, "TotalBsmtSF"=>900)
prix_estime = prediction_interface(valeurs, coeffs)
println("Prix estimé : ", round(prix_estime))