module Main

import Data.Vect

data HL : List Type -> Type where
     HNil : HL []
     (::) : t -> HL ts -> HL (t :: ts)

is : HL [Int, String]
is = 1 :: "" :: HNil

head : HL (t :: ts) -> t
head (x :: xs) = x

tail : HL (t :: ts) -> HL ts
tail (x :: xs) = xs

concat : HL ts -> HL ts2 -> HL (ts ++ ts2)
concat HNil y = y
concat {ts} hList HNil = rewrite (appendNilRightNeutral ts) in hList
concat (x :: xs) hList2 = x :: concat xs hList2

cc : HL [String, Int, Nat, Bool]
cc = concat ("hello hlist"::1::HNil) (Z::True::HNil)

main : IO ()
main = putStrLn (head cc)
