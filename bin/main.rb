# !/usr/bin/env ruby

require_relative '../lib/action_listeners.rb'
# al = ActionListener.new('./examples/other_sample.css')
al = ActionListener.new('./examples/style.css')
puts al.al_init_file
