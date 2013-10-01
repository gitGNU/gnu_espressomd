#!/bin/bash --login -e
# Copyright (C) 2013 Olaf Lenz
#
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.
source maintainer/jenkins/common.sh

bootstrap

start "CONFIGURE"
./configure CPU_COUNT=4
end "CONFIGURE"

use_config default-maxset

start "BUILD"
make -j 4
end "BUILD"

check
doc
dist
