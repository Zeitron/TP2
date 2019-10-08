## Retorna os títulos dos papers do file 'papers.txt'
## em um array. Cada índex representa um título

module Storage

    def Storage.storage()
        titles =[]
        File.open('../resources/papers.txt').each { |line| titles.push(line.to_s.strip) }
        #print titles
        return titles
    end
        
end

Storage.storage()
