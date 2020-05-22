n, m, x = gets.split.map(&:to_i)

c = Array.new n
a = Array.new(n)

n.times do |i|
  c[i], *a[i] = gets.split.map(&:to_i)
end

books = (0..(n-1)).to_a

result = 10**9

1.upto(n) do |i|
  books.combination(i) do |l|
    sum = Array.new(m){ 0 }
    price = 0
    l.each do |j|
      a[j].each_with_index do |ri, index|
        sum[index] += ri
      end
      price += c[j]
    end
    if sum.all?{|k| k >= x} && price < result
      result = price 
    end
  end
end

if result > 10**8
  puts -1
else
  puts result
end