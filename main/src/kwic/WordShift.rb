## Recebe a array do título sem as stop-words
## e retorna todas as permutações cíclicas

module WordShift

    def WordShift.cyclic_permutation(list)
        return list.permutation(list.length.to_i).to_a
    end


    ## Retorna 1 permutação, cada uma começando com uma keyword diferente
    def WordShift.circular_shift(list)
        support = []
        size = list.length
        size.times { |idx| support.push( list.rotate(idx) )  }
        return support
    end

end
