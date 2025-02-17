class PayToBankResponse {
  String message;
  bool status;
  String? responseCode;
  PayToBankData? data;

  PayToBankResponse({
    required this.message,
    required this.status,
    this.responseCode,
    this.data,
  });

  factory PayToBankResponse.fromJson(Map<String, dynamic> json) =>
      PayToBankResponse(
        status: json['status'],
        message: json['message'],
        responseCode: json['responseCode'],
        data: json['data'] != null
            ? PayToBankData.fromJson(json['data'])
            : null,
      );
}

class PayToBankData {
  String? senderName;
  String? recipientName;
  String? recipientPhoneNumber;
  String? recipientAccountNumber;
  String? narration;
  String? transactionType;
  String? transactionMethod;
  String? bank;
  int? amount;

  PayToBankData({
    this.senderName,
    this.recipientName,
    this.recipientPhoneNumber,
    this.recipientAccountNumber,
    this.narration,
    this.transactionType,
    this.transactionMethod,
    this.bank,
    this.amount,
  });

  factory PayToBankData.fromJson(Map<String, dynamic> json) =>
      PayToBankData(
        senderName: json['senderName'],
        recipientName: json['recipientName'],
        recipientPhoneNumber: json['recipientPhoneNumber'],
        recipientAccountNumber: json['recipientAccountNumber'],
        narration: json['narration'],
        transactionType: json['transactionType'],
        transactionMethod: json['transactionMethod'],
        bank: json['bank'],
        amount: json['amount'],
      );

  Map<String, dynamic> toJson() {
    return {
      'senderName': senderName,
      'recipientName': recipientName,
      'recipientPhoneNumber': recipientPhoneNumber,
      'recipientAccountNumber': recipientAccountNumber,
      'narration': narration,
      'transactionType': transactionType,
      'transactionMethod': transactionMethod,
      'bank': bank,
      'amount': amount,
    };
  }
}
