month=[31,"february",31,30,31,30,31,31,30,31,30,31]
day=0
(1900..1999).inject(0) do |acc,x|
  month.each {|y|
    if y=="february"
      day+=(x%4==0)?29:28
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