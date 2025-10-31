CURL_VERSION = 8.16.0

.ONESHELL:
.SHELLFLAGS = -ec . ${builddir}/config.sh

all-local: curl-"$CURL_VERSION"/

curl-"${CURL_VERSION}"/: verify-curl.stamp
	log_debug "Verifying integrity of '$@'..."
	@TAR@ -xf curl-"${CURL_VERSION}".tar.gz

verify-curl.stamp: curl-"${CURL_VERSION}".tar.gz
	@SHA256SUM@ --check --ignore-missing "$srcdir"/checksums.txt
	touch "$@"

curl-"${CURL_VERSION}".tar.gz:
	@WGET@ "https://curl.haxx.se/download/$@"

clean-local:
	rm -f curl-"${CURL_VERSION}".tar.gz
	rm -rf curl-"${CURL_VERSION}"
