using DataFrames
function predire(modele, dataset::DataFrame)
    prediction = predict(modele, dataset)
    return prediction
end