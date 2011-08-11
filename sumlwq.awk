#  sum last word QUIETLY -- used by 'm2'
{ total += $NF }
END { print total }
