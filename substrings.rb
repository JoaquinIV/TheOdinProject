def substrings(string, dictionary)
  string.downcase!
  dictionary.reduce(Hash.new(0)) do |result, word|
    result[word] += string.scan(word).count if string.include?(word)
    result
  end
end
