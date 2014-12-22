import System.Environment (getArgs)
import Network.Curl.Download (openURI)
import qualified Data.ByteString.Char8 as Char8
import Data.Char (toLower)

urlEncode :: Char -> Char
urlEncode c = c

gitignoreURL :: String -> String
gitignoreURL s = "https://raw.githubusercontent.com/github/gitignore/master/" ++ lookupFileName (s ++".gitignore")

lookupFileName = lookupFileNameIn supportedLanguages

lookupFileNameIn [] s = s
lookupFileNameIn (h:t) s
	| map toLower h == map toLower s = h
	| otherwise                      = lookupFileNameIn t s

rightOnly :: [Either a b] -> [b]
rightOnly [] = []
rightOnly (Left  _:t) =   rightOnly t
rightOnly (Right v:t) = v:rightOnly t

sampleArgs = ["Haskell", "Scala"]

main = do
	args <- getArgs
	dlResults <- sequence $ map (openURI . gitignoreURL . map urlEncode) args
	mapM_ Char8.putStrLn $ rightOnly dlResults

supportedLanguages = ["Actionscript.gitignore","Ada.gitignore","Agda.gitignore","Android.gitignore","AppceleratorTitanium.gitignore","ArchLinuxPackages.gitignore","Autotools.gitignore","CakePHP.gitignore","CFWheels.gitignore","C.gitignore","C++.gitignore","ChefCookbook.gitignore","Clojure.gitignore","CMake.gitignore","CodeIgniter.gitignore","CommonLisp.gitignore","Composer.gitignore","Concrete5.gitignore","CONTRIBUTING.md","Coq.gitignore","CraftCMS.gitignore","Dart.gitignore","Delphi.gitignore","DM.gitignore","Drupal.gitignore","Eagle.gitignore","Elisp.gitignore","Elixir.gitignore","EPiServer.gitignore","Erlang.gitignore","ExpressionEngine.gitignore","ExtJs.gitignore","Fancy.gitignore","Finale.gitignore","ForceDotCom.gitignore","Fortran.gitignore","FuelPHP.gitignore","gcov.gitignore","GitBook.gitignore","Go.gitignore","Gradle.gitignore","Grails.gitignore","GWT.gitignore","Haskell.gitignore","Idris.gitignore","Java.gitignore","Jboss.gitignore","Jekyll.gitignore","Joomla.gitignore","Jython.gitignore","Kohana.gitignore","LabVIEW.gitignore","Laravel.gitignore","Leiningen.gitignore","LemonStand.gitignore","LICENSE","Lilypond.gitignore","Lithium.gitignore","Magento.gitignore","Maven.gitignore","Mercury.gitignore","MetaProgrammingSystem.gitignore","Meteor.gitignore","nanoc.gitignore","Node.gitignore","Objective-C.gitignore","OCaml.gitignore","Opa.gitignore","OpenCart.gitignore","OracleForms.gitignore","Packer.gitignore","Perl.gitignore","Phalcon.gitignore","PlayFramework.gitignore","Plone.gitignore","Prestashop.gitignore","Processing.gitignore","Python.gitignore","Qooxdoo.gitignore","Qt.gitignore","Rails.gitignore","README.md","R.gitignore","RhodesRhomobile.gitignore","ROS.gitignore","Ruby.gitignore","Rust.gitignore","Sass.gitignore","Scala.gitignore","SCons.gitignore","Scrivener.gitignore","Sdcc.gitignore","SeamGen.gitignore","SketchUp.gitignore","stella.gitignore","SugarCRM.gitignore","Swift.gitignore","Symfony.gitignore","SymphonyCMS.gitignore","TeX.gitignore","Textpattern.gitignore","TurboGears2.gitignore","Typo3.gitignore","Umbraco.gitignore","Unity.gitignore","VisualStudio.gitignore","VVVV.gitignore","Waf.gitignore","WordPress.gitignore","Xojo.gitignore","Yeoman.gitignore","Yii.gitignore","ZendFramework.gitignore","Zephir.gitignore"]