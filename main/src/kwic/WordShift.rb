## Recebe a array do título sem as stop-words
## e retorna todas as permutações cíclicas

def cyclic_permutation(list)
    return list.permutation(list.length.to_i).to_a
end


## Retorna 1 permutação, cada uma começando com uma keyword diferente
def circular_shift(list)
    support = []
    size = list.length
    size.times { |idx| support.push( list.rotate(idx) )  }
    return support
end

# Exemplo 1
list = ["introduction", "computer", "science"]
permutado = []
permutado = cyclic_permutation(list)

# Exemplo 2
shifted = []
shifted = circular_shift(list)
print shifted
