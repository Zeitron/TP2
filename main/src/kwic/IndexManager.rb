load 'WordShift.rb'

## Recebe a lista gerada em WordShift e 
## a retorna alfabeticamente ordenada

def alphabetize(titles)
    return titles.sort
end

permuted =[]
list = ["introduction", "computer", "science"]
permuted = circular_shift(list)

permuted = alphabetize(permuted)
##print permuted

