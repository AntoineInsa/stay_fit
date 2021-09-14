## Summary

This project has been create to manipulate .tcx file, especially swim files.

## Enrich a swim file

Enrich an existing swim file (.tcx) with laps and distance based triggered laps

```
bundle exec ruby parse_swim.rb
Filename : input/sample/Antoine_Censi_2018-01-04_12-21-50.tcx
Summary: 1500m - 15 laps - 41'12" - 2'44"/100m
Filename : input/sample/Antoine_Censi_2018-01-17_19-30-53.tcx
Summary: 1500m - 15 laps - 35'07" - 2'20"/100m
Overall
Summary: 3000m - 30 laps - 1h16'19" - 2'32"/100m
```

## Create a swim file manually

Create a swim file (.tcx) manually by specifying the distance/duration

```
(base) /stay_fit antoine$ bundle exec ruby swim.rb
Swim TCX Maker
When did you start training (YYYY-MM-DD hh:mm) ? ex: 2018-11-19 12:00:00
2018-11-19 12:00:00
Number of sets:
4
1/ How far (m)?
400
1/ How long (min:sec)?
8:20
1/ How long did you rest (min:sec)?
0:30
2/ How far (m)?
400
2/ How long (min:sec)?
8:00
2/ How long did you rest (min:sec)?
0:30
3/ How far (m)?
400
3/ How long (min:sec)?
8:00
3/ How long did you rest (min:sec)?
0:30
4/ How far (m)?
400
4/ How long (min:sec)?
10:00
Output

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
        <Id>2018-11-19T11:00:00Z</Id>
      <Lap StartTime="2018-11-19T11:00:00Z">
        <TotalTimeSeconds>500</TotalTimeSeconds>
        <DistanceMeters>400.0</DistanceMeters>
        <Intensity>Active</Intensity>
        <TriggerMethod>Manual</TriggerMethod>

        <Trackpoint>
          <Time>2018-11-19T11:00:00Z</Time>
          <DistanceMeters>0.0</DistanceMeters>
          <HeartRateBpm>
            <Value>130</Value>
          </HeartRateBpm>
          <SensorState>Present</SensorState>
        </Trackpoint>

        <Trackpoint>
          <Time>2018-11-19T11:08:20Z</Time>
          <DistanceMeters>400.0</DistanceMeters>
          <HeartRateBpm>
            <Value>130</Value>
          </HeartRateBpm>
          <SensorState>Present</SensorState>
        </Trackpoint>
      </Lap>

      <Lap StartTime="2018-11-19T11:08:20Z">
        <TotalTimeSeconds>30</TotalTimeSeconds>
        <DistanceMeters>0.0</DistanceMeters>
        <Intensity>Resting</Intensity>
        <TriggerMethod>Manual</TriggerMethod>

        <Trackpoint>
          <Time>2018-11-19T11:08:20Z</Time>
          <DistanceMeters>400.0</DistanceMeters>
          <HeartRateBpm>
            <Value>130</Value>
          </HeartRateBpm>
          <SensorState>Present</SensorState>
        </Trackpoint>

        <Trackpoint>
          <Time>2018-11-19T11:08:50Z</Time>
          <DistanceMeters>400.0</DistanceMeters>
          <HeartRateBpm>
            <Value>130</Value>
          </HeartRateBpm>
          <SensorState>Present</SensorState>
        </Trackpoint>
      </Lap>

      <Lap StartTime="2018-11-19T11:08:50Z">
        <TotalTimeSeconds>480</TotalTimeSeconds>
        <DistanceMeters>400.0</DistanceMeters>
        <Intensity>Active</Intensity>
        <TriggerMethod>Manual</TriggerMethod>

        <Trackpoint>
          <Time>2018-11-19T11:08:50Z</Time>
          <DistanceMeters>400.0</DistanceMeters>
          <HeartRateBpm>
            <Value>130</Value>
          </HeartRateBpm>
          <SensorState>Present</SensorState>
        </Trackpoint>

        <Trackpoint>
          <Time>2018-11-19T11:16:50Z</Time>
          <DistanceMeters>800.0</DistanceMeters>
          <HeartRateBpm>
            <Value>130</Value>
          </HeartRateBpm>
          <SensorState>Present</SensorState>
        </Trackpoint>
      </Lap>

      <Lap StartTime="2018-11-19T11:16:50Z">
        <TotalTimeSeconds>30</TotalTimeSeconds>
        <DistanceMeters>0.0</DistanceMeters>
        <Intensity>Resting</Intensity>
        <TriggerMethod>Manual</TriggerMethod>

        <Trackpoint>
          <Time>2018-11-19T11:16:50Z</Time>
          <DistanceMeters>800.0</DistanceMeters>
          <HeartRateBpm>
            <Value>130</Value>
          </HeartRateBpm>
          <SensorState>Present</SensorState>
        </Trackpoint>

        <Trackpoint>
          <Time>2018-11-19T11:17:20Z</Time>
          <DistanceMeters>800.0</DistanceMeters>
          <HeartRateBpm>
            <Value>130</Value>
          </HeartRateBpm>
          <SensorState>Present</SensorState>
        </Trackpoint>
      </Lap>

      <Lap StartTime="2018-11-19T11:17:20Z">
        <TotalTimeSeconds>480</TotalTimeSeconds>
        <DistanceMeters>400.0</DistanceMeters>
        <Intensity>Active</Intensity>
        <TriggerMethod>Manual</TriggerMethod>

        <Trackpoint>
          <Time>2018-11-19T11:17:20Z</Time>
          <DistanceMeters>800.0</DistanceMeters>
          <HeartRateBpm>
            <Value>130</Value>
          </HeartRateBpm>
          <SensorState>Present</SensorState>
        </Trackpoint>

        <Trackpoint>
          <Time>2018-11-19T11:25:20Z</Time>
          <DistanceMeters>1200.0</DistanceMeters>
          <HeartRateBpm>
            <Value>130</Value>
          </HeartRateBpm>
          <SensorState>Present</SensorState>
        </Trackpoint>
      </Lap>

      <Lap StartTime="2018-11-19T11:25:20Z">
        <TotalTimeSeconds>30</TotalTimeSeconds>
        <DistanceMeters>0.0</DistanceMeters>
        <Intensity>Resting</Intensity>
        <TriggerMethod>Manual</TriggerMethod>

        <Trackpoint>
          <Time>2018-11-19T11:25:20Z</Time>
          <DistanceMeters>1200.0</DistanceMeters>
          <HeartRateBpm>
            <Value>130</Value>
          </HeartRateBpm>
          <SensorState>Present</SensorState>
        </Trackpoint>

        <Trackpoint>
          <Time>2018-11-19T11:25:50Z</Time>
          <DistanceMeters>1200.0</DistanceMeters>
          <HeartRateBpm>
            <Value>130</Value>
          </HeartRateBpm>
          <SensorState>Present</SensorState>
        </Trackpoint>
      </Lap>

      <Lap StartTime="2018-11-19T11:25:50Z">
        <TotalTimeSeconds>600</TotalTimeSeconds>
        <DistanceMeters>400.0</DistanceMeters>
        <Intensity>Active</Intensity>
        <TriggerMethod>Manual</TriggerMethod>

        <Trackpoint>
          <Time>2018-11-19T11:25:50Z</Time>
          <DistanceMeters>1200.0</DistanceMeters>
          <HeartRateBpm>
            <Value>130</Value>
          </HeartRateBpm>
          <SensorState>Present</SensorState>
        </Trackpoint>

        <Trackpoint>
          <Time>2018-11-19T11:35:50Z</Time>
          <DistanceMeters>1600.0</DistanceMeters>
          <HeartRateBpm>
            <Value>130</Value>
          </HeartRateBpm>
          <SensorState>Present</SensorState>
        </Trackpoint>
      </Lap>

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
```
