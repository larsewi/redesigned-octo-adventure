# Whether to build community or enterprise packages.
#
# PROJECT=[community|nova]
PROJECT=${PROJECT:-nova}

# Whether to build agent or hub packages.
# Hub packages only make sense for enterprise builds.
#
# EXPLICIT_ROLE=[hub|agent]
EXPLICIT_ROLE=${EXPLICIT_ROLE:-agent}

# Whether to build in release or debug mode.
# Debug packages include debug symbols.
# Release packages are stripped to a smaller size.
#
# BUILD_TYPE=[DEBUG|RELEASE]
BUILD_TYPE=${BUILD_TYPE:-DEBUG}
