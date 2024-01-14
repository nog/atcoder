N, K, Q = gets.split.map(&:to_i)
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

  def self.max(array)
    new(array)
  end

  def self.min(array)
    new(array){ |x, y| x < y }
  end

  def self.[](*array, &comp)
    new(array, &comp)
  end

  attr_reader :heap
  alias to_a heap

  # Push new element to the heap.
  def push(item)
    shift_down(0, @heap.push(item).size - 1)
    self
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
  alias first get

  # Returns true if the heap is empty.
  def empty?
    @heap.empty?
  end

  def size
    @heap.size
  end

  def to_s
    "<#{self.class}: @heap:(#{heap.join(', ')}), @comp:<#{@comp.class} #{@comp.source_location.join(':')}>>"
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
mae_queue = PriorityQueue.new([0]*K){|x,y| x < y }
ato_queue = PriorityQueue.new([0]*(N-K))
mae_remove_count = {}
ato_remove_count = {}
f = 0
A = Array.new(N, 0)

Q.times do |i|
  x, y = gets.split.map(&:to_i)
  x -= 1
  by = A[x]
  A[x] = y
  while((mae_remove_count[mae_queue.get] || 0) > 0) do
    mae_remove_count[mae_queue.pop] -= 1
  end
  if mae_queue.get <= by
    mae_remove_count[by] ||= 0
    mae_remove_count[by] += 1
    while((ato_remove_count[ato_queue.get] || 0) > 0) do
      ato_remove_count[ato_queue.pop] -= 1
    end
    if ato_queue.get <= y
      mae_queue.push(y)
      f += y - by
    else
      ato_queue.push(y)
      while((ato_remove_count[ato_queue.get] || 0) > 0) do
        ato_remove_count[ato_queue.pop] -= 1
      end
      a = ato_queue.pop || 0
      mae_queue.push(a)
      f += a - by
    end
  else
    ato_remove_count[by] ||= 0
    ato_remove_count[by] += 1
    while((mae_remove_count[mae_queue.get] || 0) > 0) do
      mae_remove_count[mae_queue.pop] -= 1
    end
    if mae_queue.get < y
      mae_queue.push(y)
      while((mae_remove_count[mae_queue.get] || 0) > 0) do
        mae_remove_count[mae_queue.pop] -= 1
      end
      a = mae_queue.pop || 0
      ato_queue.push(a)
      f += y - a
    else
      ato_queue.push(y)
    end
  end
  puts f
end