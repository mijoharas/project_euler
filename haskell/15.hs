import qualified Data.MemoCombinators as Memo
getSquarePath :: Integer -> Integer
getSquarePath x = getRectanglePath x x

getRectanglePath :: Integer -> Integer -> Integer
getRectanglePath = Memo.memo2 Memo.integral Memo.integral f
                   where
                     f 0 x = 1
                     f x 0 = 1
                     f w h = (getRectanglePath (w - 1) h) + (getRectanglePath w (h-1))

test = getSquarePath 2
main = print $ getSquarePath 20
