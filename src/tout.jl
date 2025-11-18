function tout(lien::String)
    donnees=lire(lien)
    ncol = names(donnees)[.!any.(ismissing, eachcol(donnees))]
    essais= donnees[:, ncol]
    essais= select!(essais, Not([:Id]))
    donnees_encodees= encoder(essais)
    return donnees_encodees
end