def anagram?(str1, str2)
  possible = str.chars.permutation.to_a
  possible.include?(str2.chars)
end

def anagram2?(str1, str2)
  str1 = str1.chars
  str2 = str2.chars

  until str1.empty? || str2.empty?
    current = str1.pop
    if str2.include?(current)
      index = str2.index(current)
      str2 = str2[0...index] + str2[index+1..-1]
    end
  end

  str1.empty? && str2.empty?

end

p anagram2?("apple", "ppleda")

def anagram3?(str1, str2)
  str1.chars.sort == str2.chars.sort
end

p anagram3?("apple", "pplea")

def anagram4?(str1, str2)
  freq1 = Hash.new(0)
  freq2 = Hash.new(0)

  str1.chars.each do |char|
    freq1[char] += 1
  end

  str2.chars.each do |char|
    freq2[char] += 1
  end

  freq1 == freq2

end

p anagram4?("apple","pplea")
