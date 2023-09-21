// ignore_for_file: avoid_print, unnecessary_string_interpolations
import 'package:app/controllers/bloc/user_controller.dart';
import 'package:app/extensions/string_casting_extension.dart';
import 'package:app/shareds/managers/set_session_manager.dart';
import 'package:app/widgets/currency_format.dart';
import 'package:get/get.dart';

import '../shareds/managers/get_session_manager.dart';
import '../widgets/app_dialog.dart';

class DashboardController extends GetxController {
  final showBalance = true.obs;
  final userName = Rx<String>('');
  final fullName = Rx<String>('');
  final accountNumber = Rx<String>('');
  final bankName = Rx<String>('');
  final phoneNumber = Rx<String>('');
  final balance = Rx<String>('');
  final qrCodeUrl = Rx<String>('');
  final isLoaded = Rx<bool>(false);
 RxDouble sliderValue = 0.0.obs;
  final double slideWidth = 200.0;

  void onSlideChanged(double value) {
    sliderValue.value = value;
  }
  GetSessionManager session = GetSessionManager();
  SetSessionManager session2 = SetSessionManager();
  UserController userController = UserController();

  @override
  void onInit() {
    isLoaded.value = true;
    fullName.value = session.readRiderFullName() ?? '';
    balance.value = '';
    bankName.value = session.readUserBankName() ?? '';
    accountNumber.value = session.readUserAccountNumber() ?? '';
    phoneNumber.value = '';
    userProfile();
    userWallet();
    super.onInit();
  }

  void toggleBalanceVisibility() {
    showBalance.toggle();
  }

  Future userProfile() async {
    var response = await userController.userProfileAsync();
    if (response.status) {
      var fullName2 =
          '${response.data!.firstName.toTitleCase()} ${response.data!.lastName.toCapitalized()}';
      session2.writeUserFullName(fullName2);
      fullName.value = fullName2;
    }
  }

  Future userWallet() async {
    var response = await userController.userWalletAsync();
    if (response.status) {
      accountNumber.value = response.data!.accountNumber;
      bankName.value = response.data!.bankName;
      phoneNumber.value = response.data!.phoneNumber;
      balance.value = formatCurrency(response.data!.balance);
      // save bank and account number for use later
      session2.writeUserAccountNumber(accountNumber.value);
      session2.writeUserBankName(bankName.value);
    }
  }

  Future<dynamic> displayPlaceholderDialog(String pageTitle) {
    return placeholderDialog(pageTitle);
  }
}
