import Data.List
perm = permutations ['0'..'9']
sortPerm = sort perm
result = head $ drop 999999 sortPerm
