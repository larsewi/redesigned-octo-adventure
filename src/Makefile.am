EXTRA_DIST: debian/changelog.in

all-local: @CURL_PACKAGE_STRING@/debian/changelog

@CURL_PACKAGE_STRING@/debian/changelog: @CURL_PACKAGE_STRING@.debian.stamp
	echo "cfbuild-@CURL_PACKAGE_NAME@ (@CURL_PACKAGE_VERSION@) unstable; urgency=low" > $@
	echo "" >> $@
	echo "  * New build." >> $@
	echo "" >> $@
	echo " -- CFEngine Autobuild System <packager@cfengine.com>  @BUILD_DATE@" >> $@

@CURL_PACKAGE_STRING@.debian.stamp: @CURL_PACKAGE_STRING@.extracted.stamp
	mkdir -p @CURL_PACKAGE_STRING@/debian
	echo "Created directory '@CURL_PACKAGE_STRING@/debian' (needed by deb packaging tool)..." > $@

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
