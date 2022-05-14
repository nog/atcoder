Q = gets.to_i
 
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
          max = i
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
 
Q.times do
  q, x, k = gets.split.map(&:to_i)
  if q == 1
    list.lazy_push(x)
  elsif q == 2
    list.lazy_sort
    i = list.bsearch_index{|a| a > x }
    i ||= list.size
    i -= k
    if i >= 0
      puts list[i]
    else
      puts -1
    end
  elsif q == 3
    list.lazy_sort
    i = list.bsearch_index{|a| a >= x }
    i ||= list.size
    i += k - 1
    if list[i]
      puts list[i]
    else
      puts -1
    end
  else
    raise
  end
end