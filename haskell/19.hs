import Data.Time.Calendar
import Data.Time.Format
import System.Locale

date_range = [fromGregorian 1901 01 01..fromGregorian 2000 12 31]
ans = length $ filter (=="01,7") $ map (formatTime defaultTimeLocale "%d,%u") date_range
main = print ans
