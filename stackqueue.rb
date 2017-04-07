require 'byebug'

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

class MinMaxStackQueue


  def initialize
    @enqueue_stack = MyStack.new
    @dequeue_stack = MyStack.new
  end

  def enqueue(el)
    @enqueue_stack.push(el)
  end

  def dequeue
    debugger
    until @enqueue_stack.empty?
      stack = @enqueue_stack.pop
      @dequeue_stack.push(stack)
    end

    @dequeue_stack.pop

    until @dequeue_stack.empty?
      stack = @dequeue_stack.pop
      @enqueue_stack.push(stack)
    end
  end

  def size
    @enqueue_stack.size + @dequeue_stack.size
  end

  def empty?
    @enqueue_stack.empty? && @dequeue_stack.empty?
  end

  def max
    @enqueue_stack.max unless @enqueue_stack.empty?
  end

  def min
    @enqueue_stack.min unless @enqueue_stack.empty?
  end
end
