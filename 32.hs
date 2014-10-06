import Data.Digits (unDigits)
import Data.List

-- digs::[Int]
digs = [1..9]
perms = permutations digs
slice from to xs = take (to - from + 1) (drop from xs)
unDig = unDigits 10
productMultMult = [[unDig a,unDig b,unDig c] |
                   perm <- perms,
                   i <- [0..9-1],
                   j <-[i+1..9],
                   let a = slice 0 i perm,
                   let b = slice (i+1) (j-1) perm,
                   let c = slice j 9 perm ,
                   (unDig a) * (unDig b) == (unDig c)
                           ]
test = head productMultMult

result = sum $ nub $ map (!!2) productMultMult
