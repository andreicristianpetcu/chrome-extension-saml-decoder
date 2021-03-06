import 'dart:io';
import 'package:path/path.dart' as path;

void main() {
  var scriptDir = path.dirname(Platform.script.toFilePath());
  var p = path.join(scriptDir, "../");
  Process.run('pub', ['build', '--mode', 'release', '--output', 'build/release'], workingDirectory: "${p}").then((ProcessResult results) {
    print(results.stdout);
    print(results.stderr);

    new File(path.join(p, "manifest.json")).copy(path.join(p, "build", "release", "manifest.json"));
    new File(path.join(p, "promotion.png")).copy(path.join(p, "build", "release", "promotion.png"));
    new File(path.join(p, "screenshot-1.png")).copy(path.join(p, "build", "release", "screenshot-1.png"));
    new File(path.join(p, "icon_128.png")).copy(path.join(p, "build", "release", "icon_128.png"));
    new File(path.join(p, "icon_48.png")).copy(path.join(p, "build", "release", "icon_48.png"));
    new File(path.join(p, "icon_16.png")).copy(path.join(p, "build", "release", "icon_16.png"));
    new File(path.join(p, "..", "LICENSE")).copy(path.join(p, "build", "release", "LICENSE"));


    Process.run('pub', ['build', '--mode', 'debug', '--output', 'build/debug'], workingDirectory: "${p}").then((ProcessResult results) {
      print(results.stdout);
      print(results.stderr);

      new File(path.join(p, "manifest.json")).copy(path.join(p, "build", "debug", "manifest.json"));
      new File(path.join(p, "promotion.png")).copy(path.join(p, "build", "debug", "promotion.png"));
      new File(path.join(p, "screenshot-1.png")).copy(path.join(p, "build", "debug", "screenshot-1.png"));
      new File(path.join(p, "icon_128.png")).copy(path.join(p, "build", "debug", "icon_128.png"));
      new File(path.join(p, "icon_48.png")).copy(path.join(p, "build", "debug", "icon_48.png"));
      new File(path.join(p, "icon_16.png")).copy(path.join(p, "build", "debug", "icon_16.png"));
      new File(path.join(p, "..", "LICENSE")).copy(path.join(p, "build", "debug", "LICENSE"));
    });

  });
}