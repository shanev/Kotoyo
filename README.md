# Kotoyo

Kotoyo is a Swift command line tool for downloading images from Bing Image Search. It's useful for getting training data for machine learning tasks like convoluted neural networks.

## Usage

Get an API key: https://azure.microsoft.com/en-us/try/cognitive-services/?api=bing-image-search-api

```
git clone https://github.com/shanev/Kotoyo
cd Kotoyo && swift build
.build/debug/Kotoyo API_KEY QUERY [DOWNLOAD_PATH]
```

A folder will be created for each query, so if you search for 'leopard' and 'snow leopard', you'll have the directory structure:

```
images\
   leopard\
     image_001.jpg
     image_002.jpg
...
   snow_leopard\
     image_001.jpg
     image_002.jpg
...
```

## Installing command line tool

```
swift build -c release -Xswiftc -static-stdlib
cp -f ./build/release/Kotoyo /usr/local/bin/kotoyo
```

