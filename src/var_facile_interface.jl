
variables_interface = ["GrLivArea", "OverallQual", "GarageCars", "YearBuilt", "TotalBsmtSF"]

function prediction_interface(valeurs::Dict, coeffs::DataFrame)
    prix = coeffs.coefficients[coeffs.variables .== "(Intercept)"][1]
    for (var, val) in valeurs
        coeff_var = coeffs.coefficients[coeffs.variables .== var]
        if !isempty(coeff_var)
            prix += coeff_var[1]* val
        end
    end
    return prix
end

