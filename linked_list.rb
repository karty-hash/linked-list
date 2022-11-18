class Node
  attr_accessor :node, :next_node
  def initialize(node = nil, next_node =  nil)
    @node = node 
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :head, :tail, :size
  def initialize
    @head 
    @tail
    @size = 0
  end

  def append(num)
    @size += 1
    if @head == nil
      @head = Node.new(num)
      return @head
    end
    current_node = @head
    until current_node.next_node == nil
      current_node  = current_node.next_node
    end
    current_node.next_node = Node.new(num)
    @tail = current_node.next_node
  end

  def prepend(num)
    @size += 1
    @head = Node.new(num, @head)
  end

  def at(ind)
    num = 0
    current_node = @head
    while num < ind
      num += 1
      current_node = current_node.next_node
    end
     return current_node
  end

  def pop
    count = 0
    current_node = @head
    until current_node.next_node == nil
      count += 1
      current_node = current_node.next_node
    end
    at(count - 1).next_node = nil
    @tail = at(count-1)
    @size -= 1
  end

  def contains?(value)
    current_node = @head
    
    until current_node.node == value
      current_node = current_node.next_node
    end
    return true
    rescue
      false
  end

  def find(value)
    index = 0
    current_node = @head
    until current_node.node == value
      index += 1
      current_node = current_node.next_node
    end
    return index
    rescue
      nil
  end

  def to_s
    arr = []
    current_node = @head
    until current_node.next_node == nil
      arr << "(#{current_node.node})->"
      current_node = current_node.next_node
    end
    arr << "(#{current_node.node})->"
    arr << "nil"
    arr.join
  end

end

a = LinkedList.new
a.append(1)
a.append(2)
a.append(3)
a.prepend(0)

p a.contains?(3)
p a.to_s
