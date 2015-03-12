{-# LANGUAGE FlexibleInstances    #-}
{-# LANGUAGE Rank2Types           #-}
{-# LANGUAGE UndecidableInstances #-}
module HLucene.Core.Codec.Posting
       ( PostingFormat
       , PostingWriter(..)
       ) where

import HLucene.Core.Codec.Types
import HLucene.Core.Document.Field (Fields)

-- What should this do?
-- class PostingReader a where

class PostingWriter a where
  write :: a -> Directory -> Fields -> IO ()

class PostingFormat a

instance (PostingWriter a) => PostingFormat a
