import 'dart:io';

import 'package:path_provider/path_provider.dart';

class Logger {
  static const _logFileName = 'app_log.txt';

  static Future<void> debugLog(String message) async {
    String path = await _getLogFilePath();
    final logFile = File(path);
    final timestamp = DateTime.now().toString();
    final logMessage = '$timestamp: -- DEBUG : $message\n';
    await logFile.writeAsString(logMessage, mode: FileMode.append);
  }

  static Future<void> errorLog(String message) async {
    String path = await _getLogFilePath();
    final logFile = File(path);
    final timestamp = DateTime.now().toString();
    final logMessage = '$timestamp: -- ERROR : $message\n';
    await logFile.writeAsString(logMessage, mode: FileMode.append);
  }

  static Future<String> _getLogFilePath() async {
    final appDocumentsDirectory = await getApplicationDocumentsDirectory();
    final logFilePath = '${appDocumentsDirectory.path}/$_logFileName';
    return logFilePath;
  }

  static Future<String> readLogFile() async {
    final logFile = File(await _getLogFilePath());
    if (await logFile.exists()) {
      return await logFile.readAsString();
    } else {
      return 'Log file not found.';
    }
  }

  static Future<Object> logFilePath() async {
    final logFile = await _getLogFilePath();

    print("log file path ----->>"+logFile.toString());
    // File(await _getLogFilePath());
    if (logFile.isNotEmpty) {
      return  logFile;
    } else {
      return 'Log file not found.';
    }
  }

  static Future<void> clearLogFile() async {
    final logFile = File(await _getLogFilePath());
    if (await logFile.exists()) {
      await logFile.delete();
      await _getLogFilePath();
    }
  }
}
