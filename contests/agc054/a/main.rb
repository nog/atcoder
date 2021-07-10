N = gets.to_i
S = gets.chomp.split('')

if S[0] != S[-1]
  puts 1
  exit
end

bflag = false
a = S[0]
S.each do |s|
  if s == a
    bflag = false
  else
    if bflag
      puts 2
      exit
    else
      bflag = true
    end
  end
end

puts -1