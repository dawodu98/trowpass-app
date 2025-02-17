class PayToBankRequest {
  String beneficiaryAccountNumber;
  String beneficiaryName;
  int amount;
  int bankId;
  int senderUserId;
  String pin;

  PayToBankRequest({
    required this.beneficiaryAccountNumber,
    required this.beneficiaryName,
    required this.amount,
    required this.bankId,
    required this.senderUserId,
    required this.pin
  });

  Map<String, dynamic> toJson() => {
        'beneficiaryAccountNumber': beneficiaryAccountNumber,
        'beneficiaryName': beneficiaryName,
        'amount': amount,
        'bankId': bankId,
        'senderUserId': senderUserId,
        'pin': pin,
      };
}
