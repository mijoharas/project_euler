my_list=[]
(0..2).each { |a|
  (0..(200-(a*100))/50).each { |b|
    (0..(200-(a*100)-(b*50))/20).each { |c|
      (0..(200-(a*100)-(b*50)-(c*20))/10).each { |d|
        (0..(200-(a*100)-(b*50)-(c*20)-(d*10))/5).each { |e|
          (0..(200-(a*100)-(b*50)-(c*20)-(d*10)-(e*5))/2).each { |f|
            (0..200-(a*100)-(b*50)-(c*20)-(d*10)-(e*5)-(f*2)).each { |g| my_list<<[a,b,c,d,e,f,g]
            }
          }
        }
      }
    }
  }
}
my_list.count {|a,b,c,d,e,f,g| a*100+b*50+c*20+d*10+e*5+f*2+g=200}+1
