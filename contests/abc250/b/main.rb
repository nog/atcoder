N, A, B = gets.split.map(&:to_i)

map = Array.new(A * N) do |h|
  Array.new(B * N) do |w|
    # warn "h:#{h} w:#{w}"
    if (h / A).even?
      (w / B).even? ? '.' : '#'
    else
      (w / B).even? ? '#' : '.'
    end
  end
end

map.each do |line|
  puts line.join('')
end
