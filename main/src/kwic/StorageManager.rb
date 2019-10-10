## Retorna os títulos dos papers do file 'papers.txt'
## em um array. Cada índex representa um título

module Storage

    def Storage.storage(filename)
        titles =[]
        File.open('../resources/'+ filename +'.txt').each { |line| titles.push(line.to_s.strip) }
        return titles
    end
        
end

