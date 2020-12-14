import 'package:codemod/codemod.dart';
import 'package:path/path.dart';
import 'dart:io';

import 'bloc_suggester.dart';

void main(List<String> arguments) {
  assert(arguments.isNotEmpty);
  final rootDirectoryPath = arguments.first;
  final rootDirectory = Directory(rootDirectoryPath);
  if (!rootDirectory.existsSync()) {
    stderr.writeln('Directory \"$rootDirectoryPath does not exist');
    exit(1);
  }

  final libPath = join(rootDirectoryPath, 'lib');
  final libDirectory = Directory(libPath);
  if (!libDirectory.existsSync()) {
    stderr.writeln('No lib directory found. Exiting');
    exit(2);
  }

  final filePaths = libDirectory
      .listSync(recursive: true)
      .whereType<File>()
      .map((e) => e.path);
  exitCode = runInteractiveCodemodSequence(filePaths, [BlocSuggester()],
      args: arguments);
}
