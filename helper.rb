#! /usr/bin/env ruby

contest = ARGV[0]
task    = ARGV[1]
command = ARGV[2]

contest_dir = "#{__dir__}/contests/#{contest}"
task_dir = "#{contest_dir}/#{task}"
task_url = "https://atcoder.jp/contests/#{contest}/tasks/#{contest}_#{task}"

case command
when "dl"
  `mkdir -p #{task_dir}`
  `cd #{task_dir};oj download #{task_url}`
when "testrb"
  command = "ruby ./main.rb"
  `cd #{task_dir};oj test -c "#{command}"`
when "testgo"
  command = "go run ./main.go"
  `cd #{task_dir};oj test -c "#{command}"`
when "submitrb"
  file = "./main.rb"
  `cd #{task_dir};oj submit #{task_url} #{file} -y`
when "submitgo"
  file = "./main.go"
  `cd #{task_dir};oj submit #{task_url} #{file} -y`
end