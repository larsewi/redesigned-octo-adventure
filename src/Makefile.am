all-local: @CURL_PACKAGE_STRING@/debian/changelog

@CURL_PACKAGE_STRING@/debian/changelog: @CURL_PACKAGE_STRING@.debian.stamp
	touch $@

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
