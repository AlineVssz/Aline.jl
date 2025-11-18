using Aline

train =tout("data/train.csv")

target= train[:, :SalePrice]
restevar= select(train, Not(:SalePrice))