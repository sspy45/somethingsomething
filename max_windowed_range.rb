def max1(arr, w)
  current_max_range = nil

  (0..arr.length - w).each do |i|
    subset = arr[i...i+w]
    diff = subset.max - subset.min

    current_max_range = diff if current_max_range.nil?
    current_max_range = diff if diff > current_max_range
  end

  current_max_range
end

p max1([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p max1([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p max1([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p max1([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
class MyStack

  attr_accessor :max, :min

  def initialize
    @store = []
  end

  def pop
    @store.pop
  end

  def push(something)
    hash = Hash.new
    if @store.empty?
      hash = {
        value: something,
        min: something,
        max: something
      }
    else
      min = (peek[:min] < something ? peek[:min] : something)
      max = (peek[:max] > something ? peek[:max] : something)
      hash = {
        value: something,
        min: min,
        max: max
      }
    end

    @store << hash
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

end
