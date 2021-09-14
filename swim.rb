require 'time'

def header
  %(
    <?xml version="1.0" encoding="UTF-8"?>
    <TrainingCenterDatabase
      xsi:schemaLocation="http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2 http://www.garmin.com/xmlschemas/TrainingCenterDatabasev2.xsd"
      xmlns:ns5="http://www.garmin.com/xmlschemas/ActivityGoals/v1"
      xmlns:ns3="http://www.garmin.com/xmlschemas/ActivityExtension/v2"
      xmlns:ns2="http://www.garmin.com/xmlschemas/UserProfile/v2"
      xmlns="http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xmlns:ns4="http://www.garmin.com/xmlschemas/ProfileExtension/v1">
      <Activities>
        <Activity Sport="swimming">
  )
end

def footer
%(
      <Training VirtualPartner="false">
        <Plan Type="Workout" IntervalWorkout="false">
          <Name>Pool swimming</Name>
          <Extensions></Extensions>
        </Plan>
      </Training>
        <Creator xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="Device_t">
          <Name>Polar M430</Name>
          <UnitId>0</UnitId>
          <ProductID>163</ProductID>
          <Version>
            <VersionMajor>1</VersionMajor>
            <VersionMinor>1</VersionMinor>
            <BuildMajor>0</BuildMajor>
            <BuildMinor>0</BuildMinor>
          </Version>
        </Creator>
      </Activity>
    </Activities>
    <Author xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="Application_t">
      <Name>Polar Flow Mobile Viewer</Name>
      <Build>
        <Version>
        <VersionMajor>0</VersionMajor>
        <VersionMinor>0</VersionMinor>
        </Version>
      </Build>
      <LangID>EN</LangID>
      <PartNumber>XXX-XXXXX-XX</PartNumber>
    </Author>
  </TrainingCenterDatabase>
)
end

def write_lap(start, duration, aggregated_distance, distance, intensity)
  heart_rate_bpm = 130

%(
      <Lap StartTime="#{start.iso8601}">
        <TotalTimeSeconds>#{duration}</TotalTimeSeconds>
        <DistanceMeters>#{sprintf('%.1f', distance)}</DistanceMeters>
        <Intensity>#{intensity}</Intensity>
        <TriggerMethod>Manual</TriggerMethod>

        <Trackpoint>
          <Time>#{start.iso8601}</Time>
          <DistanceMeters>#{sprintf('%.1f', aggregated_distance)}</DistanceMeters>
          <HeartRateBpm>
            <Value>#{heart_rate_bpm}</Value>
          </HeartRateBpm>
          <SensorState>Present</SensorState>
        </Trackpoint>

        <Trackpoint>
          <Time>#{(start + duration).iso8601}</Time>
          <DistanceMeters>#{sprintf('%.1f', aggregated_distance + distance)}</DistanceMeters>
          <HeartRateBpm>
            <Value>#{heart_rate_bpm}</Value>
          </HeartRateBpm>
          <SensorState>Present</SensorState>
        </Trackpoint>
      </Lap>
)
end

# Main
puts "Swim TCX Maker"

puts "When did you start training (YYYY-MM-DD hh:mm) ? ex: 2018-11-19 12:00:00"
date_string = gets.chomp
if date_string != ''
  start = Time.strptime(date_string, '%Y-%m-%d %H:%M:%S').utc
else
  start = Time.now.utc
end

file = "#{start.iso8601}.tcx"

# output = File.read('header.tcx')
output = header
output += "      <Id>#{start.iso8601}</Id> "


puts "Number of sets: "
set_number = gets.chomp.to_i

current_set = 0
minute_offset = 0
second_offset = 0

aggregated_distance = 0

while current_set < set_number do
  puts "#{current_set + 1}/ How far (m)?"
  distance = gets.chomp.to_i

  puts "#{current_set + 1}/ How long (min:sec)?"
  time = gets.chomp.split(':')
  duration = time[0].to_i * 60 + time[1].to_i

  output += write_lap(start, duration, aggregated_distance, distance, 'Active')
  aggregated_distance += distance
  start += duration

  if current_set < set_number - 1
    puts "#{current_set + 1}/ How long did you rest (min:sec)?"
    time = gets.chomp.split(':')
    duration = time[0].to_i * 60 + time[1].to_i

    output += write_lap(start, duration, aggregated_distance, 0, 'Resting')
    start += duration
  end

  current_set += 1
end

output += footer
# output += File.read('trailer.tcx')

puts "Output"
puts output
File.write("output/#{file}", output)
