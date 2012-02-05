#!/usr/bin/ruby

require 'getoptlong'

# Define the constants here
PLUGIN_NAME = 'test'

def usage
    puts("#{$0} -h host <host_id> [-i <sampling_interval>]")
    exit
end

begin
  # Sync stdout so that it will flush to collectd properly
  $stdout.sync = true

  hostname = nil
  sampling_interval = 20  # sec, Default value
  opts = GetoptLong.new(
    [ '--hostid', '-h', GetoptLong::REQUIRED_ARGUMENT ],
    [ '--sampling-interval', '-i', GetoptLong::OPTIONAL_ARGUMENT ]
  )
  opts.each do |opt, arg|
    case opt
      when '--hostid'
        hostname = arg
      when '--sampling-interval'
        sampling_interval = arg.to_i
    end
  end
  usage if !hostname

# Collection loop
  while true do
    start_run = Time.now.to_i
    next_run = start_run + sampling_interval
    data = `cat /tmp/count-file`.chomp
    puts("PUTVAL #{hostname}/#{PLUGIN_NAME}/gauge-5_minute_load #{start_run}:#{data}")

# sleep to make the interval
    while((time_left = (next_run - Time.now.to_i)) > 0) do
      sleep(time_left)
    end
  end
end
