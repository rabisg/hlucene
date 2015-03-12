{-# LANGUAGE TypeFamilies #-}
module HLucene.Core.Store.File
       ( Offset
       , Stream(..)
       , InputStream(..)
       , OutputStream(..)
       ) where

import Data.ByteString

type Offset = Integer

class Stream f where
  type StreamM f :: * -> *
  close :: f -> StreamM f ()

class Stream f => InputStream f where
  readAbsolute :: f -> Offset -> Integer -> StreamM f ByteString

class Stream f => OutputStream f where
  write :: f -> ByteString -> StreamM f ()
