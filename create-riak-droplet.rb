#!/usr/bin/env ruby
require 'barge'

barge = Barge::Client.new do |config|
    config.access_token = ENV['DIGITALOCEAN_TOKEN']
end

base_name = 'riak'
name = "#{base_name}-"+rand.to_s.slice(2,10)
region = 'nyc2'
image_id = 4686570
size = '8gb'

options = {name: name, region: region, image: image_id, size: size }

d = barge.droplet.create(options)

if d.success?
  puts "Created droplet #{d.droplet.name} with id #{d.droplet.id}"
  # TODO: maybe wait for an ipaddress
  #       barge.droplet.show(d.droplet.id).droplet.networks.v4[0].ip_address
else
  puts "It seems we failed to create a new droplet"
end


