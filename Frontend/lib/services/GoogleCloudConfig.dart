import 'dart:convert';
import 'dart:io';

import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:googleapis/bigquery/v2.dart' as bigquery;
import 'package:googleapis/aiplatform/v1.dart' as aiplatform;
import 'package:googleapis/storage/v1.dart' as storage;

class GoogleCloudConfig {
  static const _credentialsFile = 'path/to/credentials.json';

  static Future<storage.Storage> getStorageClient() async {
    final credentials = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(await _loadCredentials()),
      storage.StorageApi.devStorageReadWriteScope,
    );

    return storage.Storage(credentials);
  }

  static Future<bigquery.Bigquery> getBigQueryClient() async {
    final credentials = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(await _loadCredentials()),
      bigquery.BigqueryApi.bigqueryScope,
    );

    return bigquery.Bigquery(credentials);
  }

  static Future<aiplatform.AIPlatformApi> getVertexAIClient() async {
    final credentials = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(await _loadCredentials()),
      aiplatform.AIPlatformApi.cloudPlatformScope,
    );

    return aiplatform.AIPlatformApi(credentials);
  }

  static Future<Map<String, dynamic>> _loadCredentials() async {
    final credentialsJson = await File(_credentialsFile).readAsString();
    return json.decode(credentialsJson);
  }
}
