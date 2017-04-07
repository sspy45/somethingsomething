def my_min(arr)
  arr.each do |num1|
    new_arr = arr.reject{|x| x == num1}
    return num1 if new_arr.all? {|x| x > num }
  end
end

def my_min_2(arr)
  min = nil
  arr.each do |num|
    min = num if min == nil || num < min
  end
end


def largest_contiguous_subsum(arr)
  new_arr = []
  (0...arr.length).each do |idx1|
    (idx1 + 1...arr.length).each do |idx2|
      new_arr << arr[idx1..idx2]
    end
  end
  new_arr.map! {|subarr| subarr.reduce(:+)}
  new_arr.max
end



def largest_contiguous_subsum_2(arr)
  max_sum = nil
  current_sum = nil

  arr.each do |num|
    if current_sum == nil
      current_sum = num
    elsif current_sum + num > current_sum
      current_sum += num
    elsif current_sum + num < current_sum
      max_sum = current_sum
      current_sum = nil
    end
  end
  max_sum = current_sum if current_sum > max_sum
  max_sum
end


p largest_contiguous_subsum_2([2, 3, -6, 7, -6, 7])
