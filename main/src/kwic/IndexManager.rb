## Recebe a lista gerada em WordShift e 
## a retorna alfabeticamente ordenada

require_relative 'WordShift.rb'

module Index
    include WordShift

    def alphabetize(title)
        permuted = circular_shift(title)
        return permuted.sort
    end
    
end

