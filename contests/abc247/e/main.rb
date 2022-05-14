N, X, Y = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

lists = []
l = []
xl = []
yl = []
i = 0
A.each.with_index do |a|
  if a < Y || X < a
    if l.size > 0
      lists.push({
        list: l,
        xl: xl,
        yl: yl,
        size: i
      })
      l = []
      xl = []
      yl = []
      i = 0
    end
  else
    l.push(a)
    xl.push(i) if a == X
    yl.push(i) if a == Y
    i += 1
  end
end

if l.size > 0
  lists.push({
    list: l,
    xl: xl,
    yl: yl,
    size: i
  })
end

# warn lists.inspect
result = 0

def max a, b
  a > b ? a : b
end

def min a, b
  a > b ? b : a
end

lists.each do |lhash|
  # warn lhash.inspect
  size = lhash[:size]
  xl = lhash[:xl]
  yl = lhash[:yl]
  next if xl.size == 0
  next if yl.size == 0

  if X == Y
    l = 0
    x = xl.shift
    while(x) do
      c = (x-l+1) * (size - x)
      # warn "x:#{x} l:#{l} c:#{c}"
      result += c
      l = x+1
      x = xl.shift
    end
  else
    l = 0
    x = xl.shift
    y = yl.shift
    while(x && y) do
      ma = max(x,y)
      mi = min(x,y)
      c = (mi-l+1) * (size - ma)
      # warn "x:#{x} y:#{y} l:#{l} c:#{c}"
      result += c
      if mi == x
        l = x+1
        x = xl.shift
      else
        l = y + 1
        y = yl.shift
      end
    end
  end
end

puts result