{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE FlexibleInstances         #-}
module HLucene.Core.Analysis.CharFilter
       ( CharStream
       , CharFilter(..)
       , IsCharFilter(..)
       , ToCharStream(..)
       ) where

import qualified Data.Stream as S
import           Data.Text

import HLucene.Core.Analysis.Types

class IsCharFilter c where
  applyCharFilter :: c -> CharStream -> CharStream

data CharFilter = forall cf. (IsCharFilter cf) => MkCharFilter cf

class ToCharStream a where
  toCharStream :: a -> CharStream

instance ToCharStream Text where
  toCharStream text = toCharStream textS
                      where
                        -- Is there a better way to do this?
                        textS = S.stream $ unpack text

instance ToCharStream (S.Stream Char) where
  toCharStream textS = S.zip textS indexes
                       where
                         indexes = S.scanl f 0 textS
                         f :: Integer -> Char -> Integer
                         f i _ = i+1
