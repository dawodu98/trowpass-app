import 'package:get_storage/get_storage.dart';

import '../constants/session_constants.dart';

//For getting session data
class GetSessionManager {
  final storage = GetStorage();

  String? readRiderPhoneNumber() => storage.read(riderMobilePhone);
  String? readRiderEmail() => storage.read(riderEmail);
  String? readAuthorizationToken() => storage.read(authorizationToken);
  int? readUserId() => storage.read(userIdKey);
  String? readUserFirstName() => storage.read(userFirstName);
  String? readRiderFullName() => storage.read(riderFullName);
  bool readIsUserLoggedIn() => storage.read(userLoggedIn) ?? false;
  bool readIsUserOnBoarded() => storage.read(userOnBoarded) ?? false;
  String? readUserBankName() => storage.read(userBankName);
  String? readUserAccountNumber() => storage.read(userAccountNumber);
  double? readUserAccountBalance() => storage.read(userAccountBalance);
  String? readVirtualCardPan() => storage.read(virtualCardPan);
  String? readVirtualCardExpiration() => storage.read(virtualCardExpiration);
  String? readVirtualCardCVV() => storage.read(virtualCardCVV);
  double? readVirtualCardBalance() => storage.read(virtualCardBalance);
  String? readVirtualCardType() => storage.read(virtualCardType);
  bool readPinCreated() => storage.read(pinCreated) ?? false;
  bool readWalletCreated() => storage.read(walletCreated) ?? false;
  List<String> readAllBanks(String key) => (storage.read(key) as List<dynamic>?)?.cast<String>() ?? [];
  String? readSelectedBankName(String key) => storage.read(key);
  Map<String, int> readBankIdMap(String key) => (storage.read(key) as Map<dynamic, dynamic>?)?.cast<String, int>() ?? {};
  Map<String, String> readbankCodeMap(String key) => (storage.read(key) as Map<dynamic, dynamic>?)?.cast<String, String>() ?? {};
  //transport
  List<String> readAllTransportCompanies(String key) => (storage.read(key) as List<dynamic>?)?.cast<String>() ?? [];
  String? readSelectedTransportCompanies(String key) => storage.read(key);
  Map<String, int> readTransportCompanyIdMap(String key) =>
    (storage.read(key) as Map<dynamic, dynamic>?)?.cast<String, int>() ?? {};
  bool readVirtualCardCreated() => storage.read(virtualCardCreated) ?? false;
  String readAccountType() => storage.read(accountType);
  String readTokenExpires() => storage.read(tokenExpiration) ?? '';

  bool readIsTokenExpired() {
    try {
      final date = DateTime.parse(readTokenExpires());
      return DateTime.now().isAfter(date);
    } catch (err) {
      return true;
    }
  }
}
