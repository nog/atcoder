N, M = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
routes = Array.new(N){ [] }
M.times do
  u, v = gets.split.map(&:to_i)
  u -= 1
  v -= 1
  routes[u].push(v)
  routes[v].push(u)
end
class PriorityQueue
  # By default, the priority queue returns the maximum element first.
  # If a block is given, the priority between the elements is determined with it.
  # For example, the following block is given, the priority queue returns the minimum element first.
  # `PriorityQueue.new { |x, y| x < y }`
  #
  # A heap is an array for which a[k] <= a[2*k+1] and a[k] <= a[2*k+2] for all k, counting elements from 0.
  def initialize(array = [], &comp)
    @heap = array
    @comp = comp || proc { |x, y| x > y }
    heapify
  end

  attr_reader :heap

  # Push new element to the heap.
  def push(item)
    shift_down(0, @heap.push(item).size - 1)
  end

  alias << push
  alias append push

  # Pop the element with the highest priority.
  def pop
    latest = @heap.pop
    return latest if empty?

    ret_item = heap[0]
    heap[0] = latest
    shift_up(0)
    ret_item
  end

  # Get the element with the highest priority.
  def get
    @heap[0]
  end

  alias top get

  # Returns true if the heap is empty.
  def empty?
    @heap.empty?
  end

  private

  def heapify
    (@heap.size / 2 - 1).downto(0) { |i| shift_up(i) }
  end

  def shift_up(pos)
    end_pos = @heap.size
    start_pos = pos
    new_item = @heap[pos]
    left_child_pos = 2 * pos + 1

    while left_child_pos < end_pos
      right_child_pos = left_child_pos + 1
      if right_child_pos < end_pos && @comp.call(@heap[right_child_pos], @heap[left_child_pos])
        left_child_pos = right_child_pos
      end
      # Move the higher priority child up.
      @heap[pos] = @heap[left_child_pos]
      pos = left_child_pos
      left_child_pos = 2 * pos + 1
    end
    @heap[pos] = new_item
    shift_down(start_pos, pos)
  end

  def shift_down(star_pos, pos)
    new_item = @heap[pos]
    while pos > star_pos
      parent_pos = (pos - 1) >> 1
      parent = @heap[parent_pos]
      break if @comp.call(parent, new_item)

      @heap[pos] = parent
      pos = parent_pos
    end
    @heap[pos] = new_item
  end
end
 
list = PriorityQueue.new{|x,y| x[0] < y[0] }
costs = Array.new(N)
N.times do |i|
  c = 0
  routes[i].each do |j|
    c += A[j]
  end
  costs[i] = c
  list.push([c,i])
end

n = N
result = 0
deleted = {}
queue = []
while(n > 0) do
  c, t = list.get
  if deleted[t]
    list.pop
    next
  end

  if c < result
    list.pop
    deleted[t] = true
    queue.push(t)
    n -= 1
    next
  elsif queue.size == 0
    list.pop
    deleted[t] = true
    queue.push(t)
    result = c
    n -= 1
  end

  updates = {}
  while(q = queue.pop) do
    routes[q].each do |x|
      costs[x] -= A[q]
      updates[x] = true
    end
  end
  updates.keys.each do |x|
    list.push([costs[x], x])
  end
end

puts result