N = gets.to_i
keta = N.to_s.length
max = keta * 9
nums = [1,2,3,4,5,6,7,8,9]

ketawa_list = Array.new(max+1){ Array.new }
1.upto(keta) do |k|
    nums.repeated_combination(k).each do |arr|
        s = arr.sum
        ketawa_list[s].push(arr)
    end
end

warn ketawa_list[2].inspect
warn ketawa_list[3].inspect