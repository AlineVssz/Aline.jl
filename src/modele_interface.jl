
function entrainer_interface(dataset::DataFrame)
    formule = @formula(SalePrice ~ GrLivArea + OverallQual + GarageCars + YearBuilt + TotalBsmtSF)
    modele2 = lm(formule, dataset)
    return modele2
end
