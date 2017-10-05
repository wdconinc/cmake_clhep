[CLHEP](http://proj-clhep.web.cern.ch/proj-clhep/) is a set of HEP-specific foundation and utility classes such as random generators, physics vectors, geometry and linear algebra.

# Synopsis

```
cmake_clhep.sh <version>
```

# Description

This script downloads and builds CLHEP from the source distribution. It installs the resulting binaries in `/usr/local/clhep/<version>`. Multiple versions can be installed next to each other, and the desired version can be loaded through the file `bin/clhep-config`.

# Examples

```
./cmake_clhep.sh 2.3.4.5
```

# License

This work is provided under the license described in the `LICENSE` file.
