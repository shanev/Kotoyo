# Kotoyo

Kotoyo is a fast, parallel image downloader for the Bing search engine, built on Microsoft's Cognitive Services API. It's useful for getting training data for machine learning tasks that use convoluted neural networks.

## Usage

Get an API key: https://azure.microsoft.com/en-us/try/cognitive-services/?api=bing-image-search-api

```
git clone https://github.com/shanev/Kotoyo
cd Kotoyo && swift build
.build/debug/Kotoyo API_KEY QUERY [DOWNLOAD_PATH]
```

## Installing command line tool

```
swift build -c release -Xswiftc -static-stdlib
cp -f ./build/release/Kotoyo /usr/local/bin/kotoyo
```

