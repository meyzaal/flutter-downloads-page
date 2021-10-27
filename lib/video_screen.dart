// import 'dart:html';
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
// import 'package:permission_handler/permission_handler.dart';

final Directory _videoDir = Directory('/storage/emulated/0/Project-KG/Video');
// final Directory _documentDir =
//     Directory('/storage/emulated/0/Project-KG/Document');

//DIR SALAH
// final Directory _videoDir = Directory('/storage/emulated/0/Vido');

class ListVideo extends StatefulWidget {
  const ListVideo({Key? key}) : super(key: key);

  @override
  _ListVideoState createState() => _ListVideoState();
}

class _ListVideoState extends State<ListVideo> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }

  // void requestPermission()async{
  //   var status = await Permission.
  // }

  var _openResult = 'Unknown';

  Future<void> openFile() async {
    // var filePath = r'/storage/emulated/0/update.apk';
    // final Directory _videoDir =
    //     Directory('/storage/emulated/0/Project-KG/Video');
    // FilePickerResult result = await FilePicker.platform.pickFiles();

    // if (result != null) {
    //   filePath = result.files.single.path;
    // } else {
    //   // User canceled the picker
    // }
    final _result = await OpenFile.open(_videoDir.path);
    print(_result.message);

    setState(() {
      _openResult = "type=${_result.type}  message=${_result.message}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Downloads'),
        ),
        body: Center(child: Builder(
          builder: (context) {
            if (!Directory(_videoDir.path).existsSync()) {
              return const Center(
                child: Text(
                  'Directory not found',
                  style: TextStyle(fontSize: 18.0),
                ),
              );
            } else {
              final videoList = _videoDir
                  .listSync()
                  .map((item) => item.path)
                  .where((item) => item.endsWith('.mp4'))
                  .toList(growable: false);

              if (videoList.isNotEmpty) {
                return InkWell(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 8.0),
                    // child: GridView.builder(
                    //   itemCount: videoList.length,
                    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    //     crossAxisCount: 3,
                    //     childAspectRatio: 1.6 / 2.0,
                    //     mainAxisSpacing: 8.0,
                    //     crossAxisSpacing: 8.0,
                    //   ),
                    // ),

                    child: ListView.builder(
                      // itemCount: files?.length ?? 0,
                      itemCount: videoList.length,
                      itemBuilder: (context, index) {
                        return Card(
                            child: ListTile(
                          title: Text(videoList[index].split('/').last),
                          leading: Icon(Icons.video_label_outlined),
                          trailing: Icon(
                            Icons.delete,
                            color: Colors.redAccent,
                          ),
                          onTap: openFile,
                        ));
                      },
                    ),
                  ),
                  // onTap: () {},
                );

                // return const Center(
                //   child: Text(
                //     'Yeayy, Videos Found!!!!',
                //     style: TextStyle(fontSize: 18.0),
                //   ),
                // );

              } else {
                return const Center(
                  // child: CircularProgressIndicator(),
                  child: Text(
                    'Sorry, No Videos Found!',
                    style: TextStyle(fontSize: 18.0),
                  ),
                );
              }
            }
          },
        )));
  }
}


// class VideoScreen extends StatefulWidget {
//   const VideoScreen({Key? key}) : super(key: key);

  

//   @override
//   _VideoScreenState createState() => _VideoScreenState();
// }

// class _VideoScreenState extends State<VideoScreen> {
  // @override
  // Widget build(BuildContext context) {
  //   if (!Directory(_videoDir.path).existsSync()) {
  //     return const Center(
  //       child: Text(
  //         'Directory not found',
  //         style: TextStyle(fontSize: 18.0),
  //       ),
  //     );
  //   } else {
  //     final videoList = _videoDir
  //         .listSync()
  //         .map((item) => item.path)
  //         .where((item) => item.endsWith('.mp4'))
  //         .toList(growable: false);

  //     if (videoList.isNotEmpty) {
  //       return const Center(
  //         child: Text(
  //           'Yeayy, Videos Found!!!!',
  //           style: TextStyle(fontSize: 18.0),
  //         ),
  //       );
  //     } else {
  //       return const Center(
  //         // child: CircularProgressIndicator(),
  //         child: Text(
  //           'Sorry, No Videos Found!',
  //           style: TextStyle(fontSize: 18.0),
  //         ),
  //       );
  //     }
  //   }
  // }

  // final FileModel file;

  