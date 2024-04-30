import '../Network/i_network_client.dart';

abstract class IApiProvider {
  final INetworkClient client;

  IApiProvider(this.client);
}