N, M, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

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

results = []
pq = PriorityQueue.new(A[0,M]){|x,y| x < y}
k_list = PriorityQueue.new([])
counts = {}
K.times do
  a = pq.pop
  k_list.push(a)
  counts[a] ||= 0
  counts[a] += 1
end
k_sum = k_list.heap.sum
results.push(k_sum)
# warn k_list.inspect
# exit
deletes = {}
# warn counts.inspect
(N-M+1).times do |i|
  next if i == 0
  del = A[i-1]
  push = A[i+M-1]
  pq.push(push)
  # warn pq.inspect
  deletes[del] ||= 0
  deletes[del]+= 1
  if (counts[del] || 0) > 0
    counts[del] -= 1
    k_sum -= del
    while(true) do
      q = pq.pop
      if (deletes[q] || 0) > 0
        deletes[q] -= 1
        next
      end
      counts[q] ||= 0
      counts[q] += 1
      k_sum += q
      break
    end
  end

  while(x = pq.get && deletes[x] && deletes[x] > 0) do
    deletes[x] -= 1
    pq.pop
  end
  while(x = k_list.get && deletes[x] && deletes[x] > 0) do
    deletes[x] -= 1
    k_list.pop
  end

  while pq.get && k_list.get && (pq.get < k_list.get) do
    pqi = pq.pop
    while((deletes[pqi] || 0) > 0 ) do
      deletes[pqi] -= 1
      pqi = pq.pop
    end
    lii = k_list.pop
    while((deletes[lii] || 0)> 0) do
      deletes[lii] -= 1
      lii = k_list.pop
    end
    break unless lii && pqi
    counts[lii] -= 1
    counts[pqi] ||= 0
    counts[pqi] += 1
    pq.push(lii)
    k_list.push(pqi)
    k_sum += pqi - lii
  end
  # warn counts.inspect
  results.push(k_sum)
end

puts results.join(' ')