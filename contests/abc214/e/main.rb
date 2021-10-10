T = gets.to_i 
T.times do
  n = gets.to_i
  l = Array.new n 
  r = Array.new n
  hash = {}
  n.times do |i|
    l[i], r[i] = gets.split.map(&:to_i)
  end
  l.sort!
  r.sort!
  cur = 1
  count = 0

  result = true
  while(r[0]) do
    cl, cr = l[0], r[0]
    if cl && cl == cur
      count += 1
      l.shift
    elsif cl && cl <= cr
      count -= cl - cur
      count = 0 if count < 0
      l.shift
      cur = cl
      count += 1
    else
      if cur <= cr
        cur += 1
        count -= 1
        count = 0 if count < 0
        r.shift
      else
        if count > 0
          result = false
          break
        else
          r.shift 
        end
      end
    end
  end
  
  puts result ? 'Yes' : 'No'
end