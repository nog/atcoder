N, M = gets.split.map(&:to_i)
bases = Array.new(N+1)
bases[0] = 0
1.upto(N) do |i|
  bases[i] = (bases[i-1] * 10 + 1) % M
end
N.downto(1) do |i|
  9.downto(1) do |j|
    if (bases[i] * j) % M == 0
      puts (("1" * i).to_i * j)
      exit
    end
  end
end

puts -1