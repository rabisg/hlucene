{-# LANGUAGE TypeFamilies #-}
module HLucene.Core.Store.Directory
       ( ActionResult,
         Directory(..)
       ) where

import HLucene.Core.Store.File

type ActionResult a = Maybe a

class (Show dir) => Directory dir where
  type DirectoryM dir :: * -> *
  list :: dir -> DirectoryM dir (ActionResult [String])
  openInput :: InputStream f => dir -> String -> DirectoryM dir (ActionResult f)
  createOutput :: OutputStream f => dir -> String -> DirectoryM dir (ActionResult f)
  renameFile :: dir -> String -> String -> dir -> DirectoryM dir (ActionResult ())
  deleteFile :: dir -> String -> DirectoryM dir (ActionResult ())
  sync :: dir -> [String] -> DirectoryM dir (ActionResult ())
  fileSize :: dir -> String -> DirectoryM dir (ActionResult Integer)
