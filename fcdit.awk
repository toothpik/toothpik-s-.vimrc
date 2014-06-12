#  flag current date in tocal
BEGIN { sy = strftime("%Y")
        sa = strftime("%b %e") }
$0 ~ sy && length == 5 { oktoflag = 1 }
$0 ~ sa { if (oktoflag) { 
              print $0, " <────<<" 
              oktoflag = 0 }
          else { print } }
$0 !~ sa  { print }
