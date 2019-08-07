# Volunteer Tracker
## written by Alexander Sergejev

### Description:
* an application that tracks projects and the volunteers working on them. Each volunteer will belong to only one project (one project, many volunteers).


As a non-profit employee, You can view, add, update and delete projects.
As a non-profit employee, You can view and add volunteers.
As a non-profit employee, You can add volunteers to a project.



#### Program Setup:
* clone repository to local desktop. Run bundle from root of project.
* run in command line:
* $ createdb volunteer_tracker_test
* $ psql volunteer_tracker < database_backup.psql
* $ createdb -T volunteer_tracker volunteer_tracker_test
* $ ruby app.rp
* open app in broawser at localhost:4567

##### This program is licensed under the MIT license.
##### Copyright (c) Alexander Sergejev 2019
