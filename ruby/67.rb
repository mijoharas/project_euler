file=open "triangle.txt"
list=[]
file.each_line {|x| list << x.split(/ /).map {|x| x.gsub("\n", "").to_i}}

list.reverse.each_with_index {|x,i|
  x.each_with_index {|y,j|
    if (j<list.length-1-i)
      p [list.length-2-i,j,list[list.length-1-i][j..j+1].max]
      list[list.length-2-i][j]+=list[list.length-1-i][j..j+1].max
    end
    }
  }
