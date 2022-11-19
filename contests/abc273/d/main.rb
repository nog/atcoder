H, W, RS, CS = gets.split.map(&:to_i)
N = gets.to_i

field = Hash.new
blocks_col = Hash.new
blocks_row = Hash.new
N.times do
  r, c = gets.split.map(&:to_i)
  field[r] ||= {}
  field[r][c] = -1
  blocks_col[c] ||= []
  blocks_col[c].push(r)

  blocks_row[r] ||= []
  blocks_row[r].push(c)
end

blocks_col.keys.each do |c|
  blocks_col[c].sort!
end
blocks_row.keys.each do |r|
  blocks_row[r].sort!
end

Q = gets.to_i
cr = RS
cc = CS
Q.times do
  d, l = gets.split
  l = l.to_i
  # warn "cr:#{cr} cc:#{cc} d:#{d} l:#{l}"
  if d == 'U'
    blocks = blocks_col[cc] || []
    # warn blocks.inspect
    bi = blocks.bsearch_index{|x| cr < x }
    # warn "cr:#{cr} bi:#{bi}"
    cr -= l
    if !bi || bi > 0
      b = blocks[(bi || 0)-1]
      if b && cr <= b
        cr = b+1
      end
    end
    cr = 1 if cr < 1
  elsif d == 'D'
    blocks = blocks_col[cc] || []
    bi = blocks.bsearch_index{|x| cr < x }
    cr += l
    if bi
      b = blocks[bi]
      if b && cr >= b
        cr = b-1
      end
    end
    cr = H if cr > H
  elsif d == 'L'
    blocks = blocks_row[cr] || []
    bi = blocks.bsearch_index{|x| cc < x }
    cc -= l
    if !bi || bi > 0
      b = blocks[(bi || 0)-1]
      if b && cc <= b
        cc = b+1
      end
    end
    cc = 1 if cc < 1
  elsif d == 'R'
    blocks = blocks_row[cr] || []
    bi = blocks.bsearch_index{|x| cc < x }
    cc += l
    if bi
      b = blocks[bi]
      if b && cc >= b
        cc = b - 1
      end
    end
    cc = W if cc > W
  else
    raise
  end
  puts "#{cr} #{cc}"
end

