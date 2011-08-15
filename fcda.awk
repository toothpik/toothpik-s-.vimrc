#  flag current weekday
BEGIN { sa = strftime("%A");
        firstime = 1 }
$0 ~ sa  { if (firstime) { print $0, "  <----<<";
               firstime = 0 } 
           else { print } }
$0 !~ sa  { print }
