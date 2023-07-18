import 'dart:io';

String jsonString(String name) =>
    File('test/test_assets/$name').readAsStringSync();
