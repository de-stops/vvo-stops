psql^
 --username=postgres^
 --dbname VG^
 -f 01-filter-stops.sql^
 --set=stops_input="'%cd%\unfiltered-stops.txt'"^
 --set=stops_output="'%cd%\stops.txt'"^
 --set=selected_rs="'14612,14625,14627,14628'"