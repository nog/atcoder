#! /usr/bin/env ruby

require 'securerandom'

def main
  contest = ARGV[0]
  contest = contest.tr('-', '_')
  task    = ARGV[1]
  lang    = get_lang(ARGV[2])
  command = ARGV[3]

  contest_dir = "#{__dir__}/contests/#{contest}"
  task_dir = "#{contest_dir}/#{task}"
  task_url = get_task_url(contest, task)

  script_file = case lang
  when :ruby
    "#{task_dir}/main.rb"
  when :golang
    "#{task_dir}/main.go"
  else
    raise
  end

  image = docker_image(lang)
  case command
  when "setup"
    `mkdir -p #{task_dir}`
    `touch #{script_file}`
    `cd #{task_dir};oj download #{task_url}`
  when "test"
    docker_name = "atcoder-#{SecureRandom.hex}"
    `docker run -di --name=#{docker_name} -v #{__dir__}:/atcoder #{image} sleep 30`
    docker_exec = "docker exec -i #{docker_name}"
    test_command = case lang
    when  :ruby
      "#{docker_exec} ruby /atcoder/contests/#{contest}/#{task}/main.rb"
    when :golang
      "#{docker_exec} go run /atcoder/contests/#{contest}/#{task}/main.go"
    else
      raise
    end
    system %Q(cd #{task_dir};oj test -c "#{test_command}")
  when "submit"
    `cd #{task_dir};oj submit #{task_url} #{script_file} -y -w 0`
  when "git"
    `git add #{task_dir};git commit -m "[#{lang}]#{contest}-#{task}";git push`
  else
    raise
  end
end

def get_task_url contest, task
  return (
    ENV['TASK_URL'] ||
    "https://atcoder.jp/contests/#{contest.tr('_', '-')}/tasks/#{contest}_#{task}"
  )
end

def get_lang(name)
  result = {
    ruby: :ruby,
    ruby23: :ruby23,
    rb: :ruby,
    go: :golang,
    golang: :golang
  }[name.to_sym]
  raise unless result
  result
end

def docker_image(lang)
  result = {
    ruby: "ruby:2.7.1",
    ruby23: "ruby:2.3",
    golang: "golang:1.6"
  }[lang]
  raise unless result
  result
end

main()
