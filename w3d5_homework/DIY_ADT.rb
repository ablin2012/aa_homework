class Stack
  def initialize
    @ivar = []
    # create ivar to store stack here!
  end

  def push(el)
    @ivar << el
    # adds an element to the stack
  end

  def pop
    @ivar.pop
    # removes one element from the stack
  end

  def peek
    @ivar[-1]
    # returns, but doesn't remove, the top element in the stack
  end
end

class Queue
  def initialize
    @ivar = []
  end

  def enqueue(el)
    @ivar << el
  end

  def dequeue
    @ivar.shift
  end

  def peek
    @ivar[0]
  end
end

class Map
  def initialize
    @ivar = []
  end

  def set(k,v)
    valid = true
    index = 0
    if @ivar.length == 0
      @ivar << [k,v]
    else
      @ivar.each_with_index do |pair, i|
        if pair[0] == k
          valid = false
          index = i
        end
      end
      if valid
        @ivar << [k,v]
      else
        @ivar[index] = [k,v]
      end
    end
  end

  def get(key)
    @ivar.each do |pair|
      return pair[1] if pair[0] == key
    end
      return nil
  end

  def delete(key)
    @ivar.each_with_index do |pair, idx|
      @ivar.delete_at(idx) if pair[0] == key
    end
  end

  def show
    @ivar
  end

end


