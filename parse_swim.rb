require 'nokogiri'

require 'nori'
require 'gyoku'

require 'pry'

def find_distance(time)
  average_pace = 120 # s/100m
  pool_length = 50
  margin = 0.8

  lap_time = average_pace * (100 / (pool_length * 2))

  i = 1
  while time > lap_time * (i + margin) do
    i += 1
  end

  pool_length * 2 * i

  # if time < lap_time * (1 + margin)
  #   pool_length * 2
  # elsif time < lap_time * (2 + margin)
  #   pool_length * 4
  # elsif time < lap_time * (3 + margin)
  #   pool_length * 6
  # elsif time < lap_time * (4 + margin)
  #   pool_length * 8
  # else
  #   100000000
  # end
end

def time_in_minutes(seconds)
  hours = seconds / 3600
  seconds = seconds % 3600
  minutes = seconds / 60
  seconds = seconds % 60

  result = ""
  result += "#{hours}h" if hours > 0
  result += "#{minutes < 10 && hours > 0 ? '0' : ''}#{minutes}'"
  result += "#{seconds < 10 ? '0' : ''}#{seconds}\""
  result
end

def add_distance(filename)
  result = Nori.new.parse(File.read(filename))

  # result['TrainingCenterDatabase']['Activities']['Activity']['Lap'].first['Track']['Trackpoint'].first.keys

  # Operate
  # distances = result['TrainingCenterDatabase']['Activities']['Activity']['Lap'].map{|lap| find_distance(lap['TotalTimeSeconds'].to_i)}

  # Add a distance to first and last trackpoint, depending on time spent
  # ["140.0", "143.0", "139.0", "286.0", "144.0", "143.0", "140.0", "436.0", "144.0", "146.0", "291.0", "147.0"]

  aggregated_time = 0
  aggregated_distance = 0

  # Simplify
  # result['TrainingCenterDatabase']['Activities']['Activity']['Lap'].slice!(3..-1)

  puts "Filename : #{filename}"

  # count = result['TrainingCenterDatabase']['Activities']['Activity']['Lap'].count
  # puts "Laps: #{count}"
  # binding.pry

  laps = result['TrainingCenterDatabase']['Activities']['Activity']['Lap']

  if laps.is_a?(Hash)
    aggregated_time = laps['TotalTimeSeconds'].to_i
    aggregated_distance = laps['DistanceMeters'].to_i

    if aggregated_distance == 0
      aggregated_distance = find_distance(aggregated_time)
      laps['DistanceMeters'] = sprintf('%.1f', aggregated_distance)
    end

    # puts "Time: #{time_in_minutes(aggregated_time)} Distance: #{aggregated_distance}m"
    # aggregated_distance = laps['DistanceMeters'].to_i
  else
    laps.each_with_index do |lap, i|
      begin
        if lap['Track'].is_a?(Array)
          trackpoint = lap['Track'].first['Trackpoint']
          lap['Track'] = {}
          lap['Track']['Trackpoint'] = trackpoint
        end

        lap['Track']['Trackpoint'].first['DistanceMeters'] = sprintf('%.1f', aggregated_distance)

        lap_time = lap['TotalTimeSeconds'].to_i
        lap_distance = find_distance(lap_time)

        aggregated_time += lap_time
        aggregated_distance += lap_distance

        lap['DistanceMeters'] = sprintf('%.1f', lap_distance)
        lap['Track']['Trackpoint'].last['DistanceMeters'] = sprintf('%.1f', aggregated_distance)
      rescue => e
        binding.pry
      end
    end
  end

  begin

  pace = 100 * aggregated_time / aggregated_distance
  humanized_time = time_in_minutes(aggregated_time)
  humanized_pace = time_in_minutes(pace)
  puts "Summary: #{aggregated_distance}m - #{aggregated_distance / 100} laps - #{humanized_time} - #{humanized_pace}/100m"

  rescue => e
    binding.pry
  end


  # Recreate the xml
  # output = Gyoku.xml(result)
  # File.write("output/files/#{filename}.tcx.xml", '<?xml version="1.0" encoding="UTF-8"?>' + output)
  # File.write("output/files/#{filename}.tcx", '<?xml version="1.0" encoding="UTF-8"?>' + output)

  {
    'time' => aggregated_time,
    'distance' => aggregated_distance,
  }

end

# MAIN
path = "input/sample"
files = `ls #{path}`.split("\n")

total_distance = 0
total_time = 0
average_pace = 0

files.each do |file|
  result = add_distance("#{path}/#{file}")
  total_time += result['time']
  total_distance += result['distance']
end

average_pace = 100 * total_time / total_distance
humanized_time = time_in_minutes(total_time)
humanized_pace = time_in_minutes(average_pace)

puts "Overall"
puts "Summary: #{total_distance}m - #{total_distance / 100} laps - #{humanized_time} - #{humanized_pace}/100m"
