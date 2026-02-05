import Lake
open Lake DSL

package «afferent-spinners» where
  version := v!"0.1.0"

require crucible from "../../testing/crucible"
require afferent from "../afferent"

-- Common link arguments for executables (macOS frameworks + curl)
def commonLinkArgs : Array String := #[
  "-framework", "Metal",
  "-framework", "Cocoa",
  "-framework", "QuartzCore",
  "-framework", "Foundation",
  "-framework", "Security",
  "-framework", "SystemConfiguration",
  "-lobjc",
  "-L/opt/homebrew/lib",
  "-L/usr/local/lib",
  "-lfreetype",
  "-lassimp",
  "-lz",
  "-lc++",
  "-lcurl"
]

@[default_target]
lean_lib AfferentSpinners where
  roots := #[`AfferentSpinners]

lean_lib Tests where
  roots := #[`Tests]

@[test_driver]
lean_exe «afferent-spinners_tests» where
  root := `Tests.Main
  moreLinkArgs := commonLinkArgs
