CURL_VERSION=8.16.0

all-local: curl-$(CURL_VERSION)/

curl-$(CURL_VERSION)/: curl-$(CURL_VERSION).tar.gz
	@TAR@ -xf $<

curl-$(CURL_VERSION).tar.gz:
	@WGET@ "https://curl.haxx.se/download/$@"
	@SHA256SUM@ --check --ignore-missing --quiet checksums.txt

clean-local:
	rm -f curl-$(CURL_VERSION).tar.gz
	rm -rf curl-$(CURL_VERSION)/
