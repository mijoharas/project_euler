month=[31,"february",31,30,31,30,31,31,30,31,30,31]
# 1st Jan 1901 was a tues
day=1
leap_func = -> x {(x%4==0) && ((x%100!=0) || (x%400==0) )}
(1901..2000).inject(0) do |acc,x|
  month.each {|y|
    if y=="february"
      day+=(leap_func.(x))?29:28
    else
      day+=y
    end
    day%=7
    if day==6
      acc+=1
    end
  }
  acc
end
