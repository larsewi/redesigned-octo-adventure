all-local: @CURL_PACKAGE_STRING@.stamp

@CURL_PACKAGE_STRING@.stamp: @CURL_PACKAGE_TARNAME@
	@TAR@ -xf $<
	echo "Extracted $< to @CURL_PACKAGE_STRING@..." > $@

@CURL_PACKAGE_TARNAME@:
	@WGET@ @CURL_PACKAGE_SOURCE@
	echo "@CURL_PACKAGE_SHASUM@  $@" | @SHA256SUM@ --check

clean-local:
	rm -f *.stamp
	rm -f @CURL_PACKAGE_TARNAME@
	rm -rf @CURL_PACKAGE_STRING@
