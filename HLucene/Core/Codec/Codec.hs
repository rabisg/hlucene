module HLucene.Core.Codec.Codec
       ( Codec(..)
       ) where

import HLucene.Core.Codec.FieldInfo
import HLucene.Core.Codec.Posting
import HLucene.Core.Codec.SegmentInfo
import HLucene.Core.Codec.StoredField

class Codec codec where
  getSegmentInfoFormat :: (SegmentInfoFormat segInfoFmt) => codec -> segInfoFmt
  getFieldInfoFormat :: (FieldInfoFormat fieldInfoFmt) => codec -> fieldInfoFmt
  getPostingsFormat :: (PostingFormat postingsFmt) => codec -> postingsFmt
  -- getStoredFieldsFormat :: (StoredFieldFormat storedFieldFmt) => codec -> storedFieldFmt
