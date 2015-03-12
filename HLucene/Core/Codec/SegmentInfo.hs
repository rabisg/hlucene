{-# LANGUAGE FlexibleInstances    #-}
{-# LANGUAGE UndecidableInstances #-}
module HLucene.Core.Codec.SegmentInfo
       ( SegmentInfo(..)
       , SegmentInfoFormat
       , SegmentInfoReader(..)
       , SegmentInfoWriter(..)
       ) where

import Data.Map (Map)

import HLucene.Core.Codec.Types

data SegmentInfo = SegmentInfo
                   { dir         :: String
                   , version     :: String
                   , name        :: String
                   , docCount    :: Integer
                   , codec       :: String
                   , diagnostics :: Map String String
                   , attributes  :: Map String String
                   }

class SegmentInfoReader a where
  read :: a -> Directory -> SegmentName -> IO SegmentInfo

class SegmentInfoWriter a where
  write :: a -> Directory -> SegmentInfo -> IO ()

class SegmentInfoFormat a

instance (SegmentInfoReader a, SegmentInfoWriter a) => SegmentInfoFormat a
