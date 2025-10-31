all-local: curl-8.16.0.tar.gz

curl-8.16.0.tar.gz:
	chmod +x fetch-tarball.sh
	./fetch-tarball.sh https://curl.haxx.se/download/ $@

clean-local:
	rm -f curl-8.16.0.tar.gz
