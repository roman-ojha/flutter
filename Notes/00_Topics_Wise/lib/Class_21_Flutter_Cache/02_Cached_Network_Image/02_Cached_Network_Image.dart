import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

/*
  -> flutter pub add cached_network_image
  -> flutter pub add flutter_cache_manager
*/

class CacheNetworkImageTut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: unused_field
  static final customCacheManager = CacheManager(
    Config(
      // now here we can configure our own custom cahche manager
      "customCacheKey",
      // here 'customCacheKey' this is the key where image will stored
      stalePeriod: Duration(days: 15),
      // now here we can define the time period to store the image in cache
      // in this case if image will not use for 15 days then it will clear this cache image
      // maxNrOfCacheObjects: 100,
      // number of image/object that are allowed to be cached
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CacheNetworkImageTut'),
        actions: [
          TextButton(
            child: Text("Clear Cache"),
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
            onPressed: _clearCache,
            // after pressing this button we want to delete or clear cached image
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: 50,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                leading: buildImage(index),
                title: Text(
                  "Image ${index + 1}",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildImage(int index) {
    return ClipRRect(
      // backgroundImage: CachedNetworkImageProvider(
      //   "https://source.unsplace.com/random?sig=$index",
      // 'CachedNetworkImageProvider' is not an widget so we will use "CachedNetworkImage"
      // ),
      child: CachedNetworkImage(
        // cacheManager: customCacheManager,
        // here we can set our own cache manager
        key: UniqueKey(),
        imageUrl: "https://source.unsplash.com/random?sig=$index/100x100",
        height: 50,
        width: 50,
        fit: BoxFit.cover,
        placeholder: (context, url) {
          // here while image is downloading we can display another widget
          return Container(
            color: Colors.black12,
          );
        },
        errorWidget: (context, url, error) {
          // if image faile to load that we will display errorWidget
          return Container(
            color: Colors.black12,
            child: Icon(
              Icons.error,
              color: Colors.red,
            ),
          );
        },
        maxHeightDiskCache: 75,
        // here widget will be 75px while storing and height will be dynamically
        // Will resize the image and store the resized image in the disk cache.
      ),
    );
  }

  void _clearCache() {
    // we also have to clear the chache that had been stored by cache_network_image package which uses different cache
    // so here we will use 'flutter_cache_manager' package
    DefaultCacheManager().emptyCache();

    imageCache.clear();
    // this imageCache come's with flutter sdk
    imageCache.clearLiveImages();

    // after clearing cached image we have to update an UI;
    setState(() {});
  }
}
