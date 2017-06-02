class Stack
  def initialize(beginning_stack = [])
    @stack = beginning_stack
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    copy = @stack
  end
end

class Queue
  def initialize(ary = [])
    @queue = ary
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.pop
  end

  def show
    ary2= @queue
  end
end

class Map
  def initialize(default_ary = [[]])
    @map_array = default_ary
  end

  def assign(key,value)
    self.remove(key)
    @map_array << [key, value]
  end

  def lookup(key)
    @map_array.select{|ele| ele[0] == key}
  end

  def remove(key)
    @map_array.reject!{|ele| ele[0]==key}
  end

  def show
    @map_array
  end

end

map = Map.new([["a", 1], ["b", 2], ["c", 3]])
p map.lookup("a")
p map.show
map.remove("b")
p map.show
map.assign("c", 5)
map.assign("d", 6)
p map.show
