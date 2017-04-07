def two_sum1?(arr, target_sum)
  (0...arr.length).each do |i|
    (i + 1...arr.length).each do |j|
      return true if arr[i] + arr[j] == 0
    end
  end
  false
end

def two_sum2?(arr, target_sum)
  complement = Hash.new(true)
  arr.each do |el|
    return true if complement[target_sum - el]
    complement[el] = true
  end
end

p two_sum2?([2,3,4,6,8], 9)


def four_sum?(arr, target_sum)
  complement = Hash.new(true)
  arr.each do |el|
    if complement[target_sum - el]
      new_target = target_sum - el
      complement[el] = false
      if two_sum?(arr, new_target)

        if two_sum?(arr, target_sum - el - el)
          return true
        end
      end
    end
  end
  false
end
