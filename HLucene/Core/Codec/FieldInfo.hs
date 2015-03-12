{-# LANGUAGE FlexibleInstances    #-}
{-# LANGUAGE UndecidableInstances #-}
module HLucene.Core.Codec.FieldInfo
       ( FieldInfo(..)
       , FieldInfoFormat
       , FieldInfoReader(..)
       , FieldInfoWriter(..)
       ) where

import Data.Map (Map)

import HLucene.Core.Codec.Types
import HLucene.Core.Document.DocValue (DocValueType)
import HLucene.Core.Document.Field    (FieldIndexOptions)

data FieldInfo = FieldInfo
                 { name         :: String
                 , number       :: Integer
                 , indexed      :: Bool
                 , storePayload :: Bool
                 , indexOptions :: FieldIndexOptions
                 , docValues    :: DocValueType
                 , attributes   :: Map String String
                 }

class FieldInfoReader a where
  read :: a -> Directory -> SegmentName -> IO [FieldInfo]

class FieldInfoWriter a where
  write :: a -> Directory -> SegmentName -> [FieldInfo] -> IO ()

class FieldInfoFormat a

instance (FieldInfoReader a, FieldInfoWriter a) => FieldInfoFormat a
