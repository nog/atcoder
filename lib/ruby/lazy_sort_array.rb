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