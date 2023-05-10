#!/bin/sh

# http.proxy
git config --local http.proxy http://proxy-a.t-kougei.ac.jp:8080

# https.proxy
git config --local https.proxy http://proxy-a.t-kougei.ac.jp:8080

# http.sslVerify
git config --local http.sslVerify false
