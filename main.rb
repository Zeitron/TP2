require 'test/unit'
extend Test::Unit::Assertions

input_array = ARGV

assert(input_array.length != 2, "ERRO, QUANTIDADE INCORRETA DE ARGUMENTOS")

class Tantrum

  def extract_words(path_to_file)

    assert(File.file?(path_to_file), "ERRO, CAMINHO INCORRETO")

    file = File.open(path_to_file, "r")
    data = file.read
    file.close

    return data
  end

  def count_words(string_to_count)

    assert(string_to_count.length > 100, "INSIRA PELO MENOS 100 PALAVRAS")

    words = string_to_count.split(' ')
    frequency = Hash.new(0)
    words.each { |word| frequency[word.downcase] += 1}

    return frequency.sort_by {|words, number|number}.reverse
  end

  def display_text(hash_to_display, n_elements)

    assert(hash_to_display.length > 3, "ERRO, MENOS QUE 3 ELEMENTOS")
    assert(hash_to_display.length > n_elements-1, "ERRO, N-ELEMENTS > QUANTIDADE DE ELEMENTOS")
    print hash_to_display.sort_by { |k,v| -v }[0..n_elements-1]
  end

end

tantrum = Tantrum.new

texto = tantrum.extract_words(ARGV[0])

texto_ordenado = tantrum.count_words(texto)

tantrum.display_text(texto_ordenado, ARGV[1])


