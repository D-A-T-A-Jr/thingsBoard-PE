import 'dart:typed_data';

import 'package:esp_softap_provisioning/esp_softap_provisioning.dart';
import 'package:esp_softap_provisioning/src/connection_models.dart';
import 'package:thingsboard_app/utils/services/provisioning/soft_ap/i_soft_ap_service.dart';

class SoftApService implements ISoftApService {
  @override
  Future<Provisioning> startProvisioning({
    required String hostname,
    required String pop,
  }) async {
    // [ALTERAÇÃO - PROVISIONAMENTO ESP]
    // Utiliza TransportHTTP posicional compatível com o fork esp_softap_provisioning_fix.
    final prov = Provisioning(
      transport: TransportHTTP(hostname),
      security: Security1(pop: pop),
    );

    final success = await prov.establishSession();
    if (!success) {
      await prov.dispose();
      throw Exception('Error establishSession');
    }

    return prov;
  }

  @override
  Future<bool> applyWifiConfig(Provisioning prov) {
    return prov.applyWifiConfig();
  }

  @override
  Future<ConnectionStatus?> getStatus(Provisioning prov) {
    return prov.getStatus();
  }

  @override
  Future<Uint8List> sendReceiveCustomData(
    Provisioning prov, {
    required Uint8List data,
    int packageSize = 256,
    String endpoint = 'custom-data',
  }) {
    return prov.sendReceiveCustomData(
      data,
      packageSize: packageSize,
    );
  }

  @override
  Future<bool> sendWifiConfig(
    Provisioning prov, {
    required String ssid,
    required String password,
  }) {
    return prov.sendWifiConfig(ssid: ssid, password: password);
  }

  @override
  Future<List<Map<String, dynamic>>?> startScanWiFi(Provisioning prov) {
    return prov.startScanWiFi();
  }
}
