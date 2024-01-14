M = gets.to_i
S1 = gets.chomp.split('').map(&:to_i)
S2 = gets.chomp.split('').map(&:to_i)
S3 = gets.chomp.split('').map(&:to_i)

result = nil

S = [S1,S2,S3]

0.upto(9) do |i|
  ilists = []
  S.permutation.each do |s|
    t = 0
    s.each do |ss|
        while(ss[t%M] != i) do
            t += 1
            if t > 3 * M
                break
            end
        end
        t += 1
        break if t > 3 * M
    end
    t -= 1
    if t <= 3 * M
        result ||= t
        result = t if t < result
    end
  end
end

puts result || -1