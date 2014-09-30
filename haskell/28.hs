numList 0 = [1]
numList n = nums ++ lastList
              where lastList = numList (n-1)
                    num = head lastList
                    nums = [(num + 8*n), (num + 6*n), (num + 4*n), (num + 2*n) ]
-- 500 because we're counting from the middle out
result = sum $ numList 500
