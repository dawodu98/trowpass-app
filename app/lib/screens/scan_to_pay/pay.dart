// ignore_for_file: prefer_const_constructors
import 'package:app/controllers/scan_to_pay_controllers/pay_screen_controller.dart';
import 'package:app/shareds/utils/app_colors.dart';
import 'package:app/widgets/app_styles.dart';
import 'package:app/widgets/standard_button.dart';
import 'package:app/widgets/text_form_input.dart';
import 'package:app/widgets/text_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PayScreen extends StatelessWidget {
  final String? scannedData; // Change the type to String?

  const PayScreen(this.scannedData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final PayController payController = Get.put(PayController());
    String? name;
    String? bank;
    String? accountNumber;

    if (scannedData != null) {
      final lines = scannedData!.split('\n');
      if (lines.length >= 3) {
        name = lines[0];
        bank = lines[1];
        accountNumber = lines[2];
      }
    }

    payController.nameController.text = name ?? '';
    payController.bankController.text = bank ?? '';
    payController.accountNumberController.text = accountNumber ?? '';

    return GestureDetector(
      onTap: () => Get.focusScope!.unfocus(),
      child: Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: primaryColor,
            statusBarBrightness: Brightness.light, // For iOS
            statusBarIconBrightness: Brightness.light, // For Android
            systemNavigationBarColor: navigationBarBackground,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: background,
          elevation: 0.0,
          title: Text(
            "Pay",
            style: appStyles(18, titleActive, FontWeight.w600),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications, color: Colors.black),
              onPressed: () {
                Get.back();
              },
            )
          ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 12),
                PayForm(payController: payController),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PayForm extends StatelessWidget {
  final PayController payController;

  PayForm({Key? key, required this.payController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        key: payController.formKey,
        child: Column(
          children: [
            LabelText(textLabel: "Phone Number"),
            const SizedBox(height: 10),
            TextInputForm(
              enabled: false,
              inputController: payController.accountNumberController,
              // textLabel: '08134678957462',
              // textHint: '08134678957462',
              isPassword: false,
              autoCorrect: false,
            ),
            const SizedBox(height: 10),
            LabelText(textLabel: "Full Name"),
            const SizedBox(height: 16),
            TextInputForm(
              enabled: true,
              inputController: payController.nameController,
              // textLabel: 'Abosede Bright',
              // textHint: 'Abosede Bright',
              isPassword: false,
              autoCorrect: false,
            ),
            const SizedBox(height: 10),
            LabelText(textLabel: "Amount"),
            const SizedBox(height: 16),
            TextInputForm(
              enabled: true,
              inputController: payController.amountController,
              // textLabel: 'Amount',
              textHint: 'N1200',
              validatorMessage: 'Please enter an amount',
              isPassword: true,
              autoCorrect: false,
            ),
            const SizedBox(height: 10),
            LabelText(textLabel: "PIN"),
            const SizedBox(height: 16),
             LabelText(textLabel: "Narration"),
            const SizedBox(height: 16),
            TextInputForm(
              enabled: true,
              inputController: payController.narrationController,
              // textLabel: 'Narration',
              textHint: 'Narration',
              isPassword: false,
              autoCorrect: false,
              validatorMessage: 'Please enter a narration',
            ),
            const SizedBox(height: 10),
            TextInputForm(
                enabled: true,
                inputController: payController.pinController,
                // textLabel: 'Pin',
                textHint: '0000',
                validatorMessage: 'Enter your pin',
                isPassword: true,
                autoCorrect: false),
            const SizedBox(height: 25),
            StandardButton(
              text: 'Continue to Pay',
              onPressed: () {
                if (payController.formKey.currentState!.validate()) {
                  payController.trySubmit();
                }
              },
            ),
          ],
        ));
  }
}
