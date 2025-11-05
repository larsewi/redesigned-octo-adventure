EXTRA_DIST: render-changelog.sh

all-local: @CURL_PACKAGE_STRING@/debian/changelog

@CURL_PACKAGE_STRING@/debian/changelog: @CURL_PACKAGE_STRING@.extracted.stamp
	chmod +x ${srcdir}/render-changelog.sh
	${srcdir}/render-changelog.sh "@CURL_PACKAGE_NAME@" "@CURL_PACKAGE_VERSION@" "@BUILD_DATE@"

@CURL_PACKAGE_STRING@.extracted.stamp: @CURL_PACKAGE_TARNAME@
	@TAR@ -xf $<
	echo "Extracted tarball '$<' to '@CURL_PACKAGE_STRING@'..." > $@

@CURL_PACKAGE_TARNAME@:
	@WGET@ @CURL_PACKAGE_SOURCE@
	echo "@CURL_PACKAGE_SHASUM@  $@" | @SHA256SUM@ --check

clean-local:
	rm -f *.stamp
	rm -f @CURL_PACKAGE_TARNAME@
	rm -rf @CURL_PACKAGE_STRING@
