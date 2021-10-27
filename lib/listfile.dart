import 'dart:io';
import 'dart:async'; // Import not needed but added here to explicitly assign type for clarity below.

main() async {
  // Get the system temp directory.
  var systemTempDir = Directory.systemTemp;

  // List directory contents, recursing into sub-directories, but not following
  // symbolic links.
  Stream<FileSystemEntity> entityList =
      systemTempDir.list(recursive: true, followLinks: false);
  await for (FileSystemEntity entity in entityList) print(entity.path);
}
