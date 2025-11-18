

function encoder(donnees::DataFrame)
    n2, p2 = size(donnees)
    donn_quanti= names(donnees, Number)
    donn_quali= setdiff(names(donnees), donn_quanti)
    dat= DataFrame()
    for col in donn_quanti
        dat[!, col]= donnees[!, col]
    end
    for e in donn_quali
        num=length(unique(donnees[!, e]))
        liste=unique(donnees[!, e])
        for i in 1:num-1
            col_enc=zeros(n2)
            col_name = string(e, "_", liste[i])
            for k in 1:n2
                if donnees[!, e][k]==liste[i]
                    col_enc[k]=1
                end
            end
            dat[!, col_name] =col_enc
        end
    end
    return dat
end