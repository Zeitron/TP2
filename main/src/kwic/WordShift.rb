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

    def WordShift.alphabetize(marked_hash)
        marked_hash.each_with_index do |pair,idx|
            pair.each do |element|
                alpha = pair.first <=> marked_hash[idx.to_i+1].first
                if alpha == -1
                    first_word = idx.to_i
                else
                    first_word = idx.to_i + 1
                end
            end
        end
    end

end
