{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_hello_world (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,1,0,5] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/home/frank/dev/exercism/haskell/hello-world/.stack-work/install/x86_64-linux-tinfo6/36d151cebbb6511e0b5bb0f1eb601f1d4ebca060ac46ec90ff8d1045286e6824/9.2.7/bin"
libdir     = "/home/frank/dev/exercism/haskell/hello-world/.stack-work/install/x86_64-linux-tinfo6/36d151cebbb6511e0b5bb0f1eb601f1d4ebca060ac46ec90ff8d1045286e6824/9.2.7/lib/x86_64-linux-ghc-9.2.7/hello-world-1.1.0.5-DIIW6rwtZ5HtYAQSIemrk"
dynlibdir  = "/home/frank/dev/exercism/haskell/hello-world/.stack-work/install/x86_64-linux-tinfo6/36d151cebbb6511e0b5bb0f1eb601f1d4ebca060ac46ec90ff8d1045286e6824/9.2.7/lib/x86_64-linux-ghc-9.2.7"
datadir    = "/home/frank/dev/exercism/haskell/hello-world/.stack-work/install/x86_64-linux-tinfo6/36d151cebbb6511e0b5bb0f1eb601f1d4ebca060ac46ec90ff8d1045286e6824/9.2.7/share/x86_64-linux-ghc-9.2.7/hello-world-1.1.0.5"
libexecdir = "/home/frank/dev/exercism/haskell/hello-world/.stack-work/install/x86_64-linux-tinfo6/36d151cebbb6511e0b5bb0f1eb601f1d4ebca060ac46ec90ff8d1045286e6824/9.2.7/libexec/x86_64-linux-ghc-9.2.7/hello-world-1.1.0.5"
sysconfdir = "/home/frank/dev/exercism/haskell/hello-world/.stack-work/install/x86_64-linux-tinfo6/36d151cebbb6511e0b5bb0f1eb601f1d4ebca060ac46ec90ff8d1045286e6824/9.2.7/etc"

getBinDir     = catchIO (getEnv "hello_world_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "hello_world_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "hello_world_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "hello_world_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hello_world_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "hello_world_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
