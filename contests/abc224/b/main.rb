H, W = gets.split.map(&:to_i)
A = Array.new H
H.times do |i|
  A[i] = gets.split.map(&:to_i)
end

(H-1).times do |i1|
  ai1 = A[i1]
  (i1+1).upto(H-1) do |i2|
    ai2 = A[i2]
    (W-1).times do |j1|
      ai1j1 = ai1[j1]
      ai2j1 = ai2[j1]

      (j1+1).upto(W-1) do |j2|
        ai2j2 = ai2[j2]
        ai1j2 = ai1[j2]
        unless ai1j1 + ai2j2 <= ai2j1 + ai1j2
          puts 'No'
          exit
        end
      end
    end
  end
end

puts 'Yes'