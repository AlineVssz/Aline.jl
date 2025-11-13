using CSV
using DataFrames

train=CSV.read("C:\\Users\\celin\\ProgMSSD\\train.csv", DataFrame ; missingstring="NA")

ncol = names(train)[.!any.(ismissing, eachcol(train))] #le any.(ismissing) me permet de choisir chaque colonnes
                                                        #dont une valeurs au - est manquante
                                                        #le .! permet de prendre l'inverse 
essais= train[:, ncol] #on ne prend que les lignes dont aucunes valeurs ne sont manquantes
essais= select!(essais, Not([:Id]))
n2, p2 = size(essais)



donn_quanti= names(essais, Number)
donn_quali= setdiff(names(essais), donn_quanti)
dat=DataFrame()


for e in donn_quanti
    dat[!, e]= essais[!, e]
end


for e in donn_quali
    num=length(unique(essais[!, e])) #on regarde combien de valeurs différentes il existe pour chaque colonne des donnes quali
    liste=unique(essais[!, e])
    for i in 1:num-1
        col_enc=zeros(n2)
        col_name = string(e, "_", liste[i])
        for k in 1:n2
            if essais[!, e][k]==liste[i]
                col_enc[k]=1
            end
            dat[!, col_name] =col_enc
        end
    end
end

function mean(x)
    mean= sum(x)/length(x)
end

function ecart(x)
    ecart=sqrt(sum((x.-mean(x)).^2)/length(x))
end

#for i in 1:p2
    #nvtrain[:, i]=(essais[:, i].-mean(essais[:, i]))./ecart(essais[:, i])
#end
