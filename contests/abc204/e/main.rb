N, M = gets.split.map(&:to_i)

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
  
HeapQueue = PriorityQueue
routes = {}
M.times do |i|
    a, b, c, d = gets.split.map(&:to_i)
    routes[a] ||= {}
    routes[a][b] ||= []
    routes[a][b].push  [c, d]
    routes[b] ||= {}
    routes[b][a] ||= []
    routes[b][a].push  [c, d]
end

queue = PriorityQueue.new() do |x,y|
    x[1] < y[1]
end

if routes[1]
    queue.push([1,0])
end

timemap = {
    1 => 0
}

while(q = queue.pop) do
    cur, t = q
    next if timemap[cur] && timemap[cur] < t
    # warn q.inspect

    routes[cur].each do |to, ar|
        next if timemap[to] && timemap[to] < t
        tt = nil
        ar.each do |c, d|
            r = t + c + (d / (t+1))
            tt ||= r
            tt = r if r < tt
            _t = (d**0.5).to_i
            [_t-2,_t-1, _t, _t+1, _t+2].each do |ttt|
                next if ttt <= t || ttt <= 0
                r = ttt + c + (d /(ttt+1))
                tt = r if r < tt
            end
        end

        if !timemap[to] || (tt < timemap[to])
            timemap[to] = tt
            queue.push([to, tt]) if routes[to]
        end
    end
    # if timemap[N] && timemap[N] < t
    #     puts timemap[N]
    #     exit
    # end
end

if timemap[N]
    puts timemap[N]
else
    puts -1
end
