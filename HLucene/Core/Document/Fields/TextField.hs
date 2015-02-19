{-# LANGUAGE TypeFamilies #-}
module HLucene.Core.Document.Fields.TextField
       (TextField) where

import qualified Data.Text as T

import HLucene.Core.Document.DocValue
import HLucene.Core.Document.Field

data TextField = TextField String T.Text FieldOptions

instance Show TextField where
  show (TextField name value _) = name ++ ": " ++ show value

instance Field TextField where
  type FieldData TextField = T.Text
  fieldData (TextField _ value _) = value
  fieldName (TextField name _ _) = name
  fieldType _ = FieldType True DocValueTypeVarBytes DocsFreqPosAndOffset
  fieldOptions (TextField _ _ options) = options
