<?php
$in = fopen("http://forecast.weather.gov/MapClick.php?lat=39.16954867942911&lon=-94.52716875183569&site=all&smap=1", "r");
#$in = fopen("http://forecast.weather.gov/MapClick.php?lat=39.160078&lon=-94.53150289999996&site=all&smap=1&searchresult=Kansas%20City%2C%20MO%2064117%2C%20USA#.UooxIcO0XmF", "r");
#$in = fopen("http://forecast.weather.gov/MapClick.php?lat=39.16954867942911&lon=-94.52716875183569&site=all&smap=1", "r");
#$in = fopen("http://forecast.weather.gov/MapClick.php?lat=39.160078&lon=-94.53150289999996&site=all&smap=1&searchresult=Kansas%20City%2C%20MO%2064117%2C%20USA#.Utbf15W0VQK", "r");
#$in = fopen("http://forecast.weather.gov/MapClick.php?lat=39.1854331703021&lon=-94.55859392881393#.UstIypW0VQI", "r");
#$in = fopen("http://forecast.weather.gov/MapClick.php?zoneid=MOZ029&zflg=1", "r");
while (!feof($in)) {
    $buffer = fread($in, 2048);
    print($buffer);
}
?>
