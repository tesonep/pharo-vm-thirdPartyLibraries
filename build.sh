 #!/bin/bash
 
set -x 
set -e
 

./scripts/buildSDL.sh
./scripts/buildZLib.sh
./scripts/buildLibPNG.sh

./scripts/buildBZip2.sh
./scripts/buildFreetype.sh
./scripts/buildFontConfig.sh

./scripts/buildPixman.sh
./scripts/buildCairo.sh
./scripts/buildHarfbuzz.sh

./scripts/buildFreetype-secondTime.sh

./scripts/buildLibgit2.sh

./scripts/packageOSX.sh