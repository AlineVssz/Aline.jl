
variables_interface = ["GrLivArea", "OverallQual", "GarageCars", "YearBuilt", "TotalBsmtSF"]
coeffs_interface = coeffs[in.(coeffs.variables, variables_interface), :]

function coeffs5_interface(coeffs::DataFrame)
    return coeffs[in.(coeffs.variables, variables_interface), :]
end

function prediction_interface(valeurs::Dict, coeffs::DataFrame)
    prix = coeffs.coefficients[coeffs.variables .== "(Intercept)"] |> first
    for (var, val) in valeurs
        coeff_var = coeffs.coefficients[coeffs.variables .== var]
        if !isempty(coeff_var)
            prix = prix + coeff_var[1]* val
        end
    end
    return prix
end

