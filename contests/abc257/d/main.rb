N = gets.to_i

xyp = Array.new(N)
N.times do |i|
  xyp[i] = gets.split.map(&:to_i)
end
needs = Array.new(N){ Array.new(N)}

N.times do |from|
  from_x, from_y, power = xyp[from] 
  N.times do |to|
    if from == to
      needs[from][to] = 0
      next
    end
    to_x, to_y, _ = xyp[to]
    need = (((from_x - to_x).abs + (from_y - to_y).abs).to_f / power).ceil
    needs[from][to] = need
  end
end

# Priority Queue
# Reference: https://github.com/python/cpython/blob/master/Lib/heapq.py
class PriorityQueue
  # By default, the priority queue returns the maximum element first.
  # If a block is given, the priority between the elements is determined with it.
  # For example, the following block is given, the priority queue returns the minimum element first.
  # `PriorityQueue.new { |x, y| x < y }`
  #
  # A heap is an array for which a[k] <= a[2*k+1] and a[k] <= a[2*k+2] for all k, counting elements from 0.
  def initialize(array = [], &comp)
    @heap = array
    @comp = comp || proc { |x, y| x < y }
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

HeapQueue = PriorityQueue

result = 10**10

N.times do |start|
  count = N - 1
  pq = PriorityQueue.new{|x,y| x[1] < y[1] }
  done = {}
  done[start] = true
  s = 1
  ne = needs[start]

  max = Array.new N
  N.times do |to|
    x = ne[to]
    max[to] = x
    pq.push([to, x])
  end

  while(from, x = pq.pop) do
    next if done[from]
    # warn "start:#{start} from:#{from} x:#{x} s:#{s} count:#{count}"
    s = x if s < x
    done[from] = true
    count -= 1
    break if count == 0
    ne = needs[from]
    N.times do |to|
      next if done[to]
      x = ne[to]
      if max[to] > x
        max[to] = x
        pq.push([to, x])
      end
    end
  end
  # warn "start:#{start} s:#{s} count:#{count}"

  result = s if s < result
end

# warn needs.inspect

puts result