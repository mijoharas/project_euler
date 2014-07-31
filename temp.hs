-- ;; This buffer is for notes you don't want to save, and for Lisp evaluation.
-- ;; If you want to create a file, visit that file with C-x C-f,
-- ;; then enter the text in that file's own buffer.

import Data.List

nums = [[1,2,3,4], [5,6,7,8], [9,10,11,12], [13,14,15,16]]

southwest = transpose . zipWith (drop) [0..]
southwest2 = transpose . zipWith (drop) [0..] . transpose

my_ans = southwest nums ++ southwest2 nums

my_ans2 x = (diagFunc x) ++ ((diagFunc . transpose) (x))
              where diagFunc = transpose . zipWith (drop) [0..]

-- my_ans3 x = concat [(diagFunc x), (diagFunc . transpose x)]
--               where diagFunc = transpose . zipWith (drop) [0..]
