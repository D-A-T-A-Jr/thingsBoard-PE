import 'dart:typed_data' show Uint8List;

import 'package:esp_softap_provisioning/esp_softap_provisioning.dart';
import 'package:esp_softap_provisioning/src/connection_models.dart';

abstract interface class ISoftApService {
  Future<Provisioning> startProvisioning({
    required String hostname,
    required String pop,
  });

  Future<List<Map<String, dynamic>>?> startScanWiFi(Provisioning prov);

  Future<Uint8List> sendReceiveCustomData(
    Provisioning prov, {
    required Uint8List data,
    int packageSize = 256,
    String endpoint = 'custom-data',
  });

  Future<bool> sendWifiConfig(
    Provisioning prov, {
    required String ssid,
    required String password,
  });

  Future<bool> applyWifiConfig(Provisioning prov);

  Future<ConnectionStatus?> getStatus(Provisioning prov);
}
