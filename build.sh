 #!/bin/bash

./scripts/buildSDL.sh
./scripts/buildZLib.sh
./scripts/buildLibPNG.sh
./scripts/buildBZip2.sh
./scripts/buildFreetype.sh
./scripts/buildFontConfig.sh

./scripts/packageSDL.sh