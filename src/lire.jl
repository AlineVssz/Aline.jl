
function lire(lien::String)
    return CSV.read(lien, DataFrame ; missingstring="NA")
end