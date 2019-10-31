

def extract_words(path_to_file)
  assert(path_to_file, "I need a non-empty string!")

  begin

  end

end





def count_words(string)
  words = string.split(' ')
  frequency = Hash.new(0)
  words.each { |word| frequency[word.downcase] += 1 }
  return frequency
end

#print count_words('I was 09809 home -- Yes! yes!  You was');
extract_words("asdasds")
