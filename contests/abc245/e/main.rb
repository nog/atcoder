N, M = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)
C = gets.split.map(&:to_i)
D = gets.split.map(&:to_i)

AB = Array.new N
N.times do |i|
  AB[i] =[A[i], B[i]]
end
CD = Array.new M
M.times do |i|
  CD[i] = [C[i], D[i]]
end

AB.sort!.reverse!
CD.sort!.reverse!

def fail
  puts 'No'
  exit
end

class LazySortArray < Array
  def initialize *args
    @lazy = []
    super
  end

  def lazy_push x
    @lazy.push(x)
  end

  def lazy_sort
    xsize = self.size ** 0.5
    if @lazy.size == 0
      return
    elsif @lazy.size < xsize
      @lazy.each do |x|
        i = self.bsearch_index{|a| a >= x}
        if i
          self.insert(i, x)
        else
          self.push(x)
        end
      end
    else
      self.push(*@lazy)
      self.sort!
    end
    @lazy = []
  end
end
 
list = LazySortArray.new

# warn AB.inspect
AB.each do |a,b|
  while(CD[0] && CD[0][0] >= a) do
    c, d = CD.shift
    list.lazy_push d
  end
  fail if list.size == 0
  list.lazy_sort
  ind = list.bsearch_index do |d|
    d >= b
  end
  fail unless ind
  list.delete_at(ind)
end

puts 'Yes'