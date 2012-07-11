#  sum last word QUIETLY -- used by 'mu'
{ total += $NF }
END { print total }
