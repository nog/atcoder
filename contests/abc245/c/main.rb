N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)

before = [A[0], B[0]]
1.upto(N-1) do |i|
  a = A[i]
  b = B[i]
  nbe = []
  before.each do |be|
    if (be - a).abs <= K
      nbe.push(a)
    end
    if (be - b).abs <= K
      nbe.push(b)
    end
  end
  before = nbe.uniq
  if before.size == 0
    puts 'No'
    exit
  end
end

puts 'Yes'