ARG_N = gets.to_i
ARG_a = gets.split.map(&:to_i)
nglist = [-1] + ARG_a
i = 1
left_ng = {}
ARG_a.each do |x|
  left_ng[x] ||= []
  left_ng[x].push(i)
  i+=1
end
nums = (1..ARG_N).to_a
result = []
nums[0]
result.push nums.unshift