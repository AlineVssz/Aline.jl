using Bonito
using Aline

donnees = tout("data/train.csv")
modele = entrainer_interface(donnees)
coeffs = coeff(modele)

surface = TextField("")
qualite = TextField("")
garage = TextField("")
annee = TextField("")
sous_sol = TextField("")
bouton = Button("Calculer le prix")
resultat = Observable("")

on(bouton) do click
    valeurs = Dict("GrLivArea" => parse(Float64, surface[]) * 10.764, "OverallQual" => parse(Float64, qualite[]), "GarageCars" => parse(Float64, garage[]), "YearBuilt" => parse(Float64, annee[]), "TotalBsmtSF" => parse(Float64, sous_sol[]) * 10.764)
    prix = prediction_interface(valeurs, coeffs)
    resultat[] = "Prix estimé: $(round(Int, prix)) €"
end

app = App() do
    return DOM.div(
        style="max-width: 400px; margin: 50px auto; padding: 20px; border: 1px solid #ccc; background: #eed3c9; font-family : Arial; border-radius: 10px;",
        DOM.h2("Prédiction du prix", style="text-align: center;"),
        DOM.p("Surface habitable en m2:"),
        surface,
        DOM.br(),
        DOM.p("Qualité générale (1 à 10):"),
        qualite,
        DOM.br(),
        DOM.p("Nombre de places de garage:"),
        garage,
        DOM.br(),
        DOM.p("Année de construction:"),
        annee,
        DOM.br(),
        DOM.p("Surface du sous-sol en m2:"),
        sous_sol,
        DOM.br(),
        DOM.br(),
        bouton,
        DOM.br(),
        DOM.p(resultat[], style="font-weight: bold; margin-top: 10px; text-align: center;")
    )
end