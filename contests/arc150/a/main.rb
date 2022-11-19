T = gets.to_i
Q = '?'
ZERO = '0'
ONE = '1'
T.times do
  n, k = gets.split.map(&:to_i)
  s = gets.chomp.split('')
  while(s[-1] == ZERO) do
    s.pop
  end
  while(s[0] == ZERO) do
    s.shift
  end
  indexes = s.map.with_index{|e,i| e == ONE ? i : nil }.compact
  # warn s.inspect
  # warn indexes.inspect
  if indexes.size == 0
    if s.count(Q) < k
      puts 'No'
      next
    end

    ren = 0
    cnts = {}
    renmax = 0
    s.each do |c|
      if c == Q
        ren += 1
      elsif ren != 0
        cnts[ren] ||= 0
        cnts[ren] += 1
        renmax = ren if ren > renmax
        ren = 0
      end
    end
    if ren != 0
      cnts[ren] ||= 0
      cnts[ren] += 1
      renmax = ren if ren > renmax
    end
    # warn cnts.inspect

    if renmax != k
      puts 'No'
      next
    end

    if cnts[k] == 1
      puts 'Yes'
    else
      # warn cnts.inspect
      puts 'No'
    end
    next
  end
  
  if indexes.size == 1
    if k == 1
      puts 'Yes'
      next
    end
    bcounts = 0
    ncounts = 0
    index = indexes[0]
    bi = index - 1
    while(0 <= bi && s[bi] == Q) do
      bi -= 1
      bcounts += 1
    end
    ni = index + 1
    while(ni < n && s[ni] == Q)
      ni += 1
      ncounts += 1
    end

    # warn "bcounts:#{bcounts} ncounts:#{ncounts}"

    cnts = bcounts + ncounts + 1
    if cnts < k
      puts 'No'
      next
    elsif cnts == k
      puts 'Yes'
      next
    elsif bcounts == 0 || ncounts == 0
      puts 'Yes'
      next
    else
      puts 'No'
      next
    end
  else
    first = indexes[0]
    last  = indexes[-1]
    if last - first >= k
      puts 'No'
      next
    end

    if s[(first+1)..(last-1)].find{|x| x == ZERO }
      puts 'No'
      next
    end

    if last - first == k - 1
      puts 'Yes'
      next
    end

    nokori = k - (last - first + 1)
    bcounts = 0
    ncounts = 0
    bi = first - 1
    ni = last + 1
    while(0 <= bi && s[bi] == Q) do
      bi -= 1
      bcounts += 1
    end
    while(ni < n && s[ni] == Q)
      ni += 1
      ncounts += 1
    end

    if nokori > bcounts + ncounts
      puts 'No'
      next
    end

    if nokori == bcounts + ncounts
      puts 'Yes'
      next
    end

    if bcounts == 0 || ncounts == 0
      puts 'Yes'
    else
      puts 'No'
    end
    next
  end

end