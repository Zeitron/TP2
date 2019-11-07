require 'test/unit'
extend Test::Unit::Assertions

#RETIRA OS DADOS DO TXT
def extract_words(path_to_file)

  assert(File.file?(path_to_file), "ERRO, CAMINHO INCORRETO")

  file = File.open(path_to_file, "r")
  data = file.read
  file.close

  return data
end


#CONTA QUANTAS PALAVRAS EXISTEM
def count_words(string_to_count)

  assert(string_to_count.length > 10, "INSIRA PELO MENOS 10 PALAVRAS")

  words = string_to_count.split(' ')
  frequency = Hash.new(0)
  words.each { |word| frequency[word.downcase] += 1}

  return frequency.sort_by {|words, number|number}.reverse
end


#MOSTRA N ELEMENTOS
def display_text(hash_to_display, n_elements)

  n_elements = n_elements.to_i

  assert(hash_to_display.length > 3, "ERRO, MENOS QUE 3 ELEMENTOS")
  assert(hash_to_display.length > n_elements - 1, "ERRO, N-ELEMENTS > QUANTIDADE DE ELEMENTOS")

  return hash_to_display.sort_by { |k,v| -v }[0..n_elements-1]
end


#REMOVE STOPWORDS
def remove_stopwords(stopword, text)

  assert(stopword.length > 0, "Stopwords vazio")

  array_stop = stopword.split("\n")

  array_text = text.split.join(" ")
  array_text = array_text.gsub(/[-#*.;,+:"]/, "")         # removo caracteres especiais
  array_text = array_text.gsub('\\"', "")

  #pattern = /\b(?:#{ Regexp.union(array_stop).source })\b/

  pattern = /\b(?:#{ array_stop.join('|') })\b/i

  #return array_text.gsub(pattern, '').squeeze(' ').strip

  return array_text.gsub(pattern, '')

end




input_array = ARGV

assert(input_array.length == 2, "ERRO, QUANTIDADE INCORRETA DE ARGUMENTOS")

texto = extract_words(ARGV[0])

stopwords = extract_words("stop_words.txt")

# Teste de Erro pra stopwords vazio
# stopwords = extract_words("vazio.txt")

text_sem_stop = remove_stopwords(stopwords, texto)

texto_ordenado = count_words(text_sem_stop)

print display_text(texto_ordenado, ARGV[1])
