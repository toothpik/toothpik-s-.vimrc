<?php
$in = fopen("http://forecast.weather.gov/MapClick.php?lat=39.160078&lon=-94.53150289999996&site=all&smap=1&searchresult=Kansas%20City%2C%20MO%2064117%2C%20USA#.Ua0Bm3y0XmE", "r");
while (!feof($in)) {
    $buffer = fread($in, 2048);
    print($buffer);
}
?>
