class QuoteResponse {
  String category;
  String message;

  QuoteResponse({this.category, this.message});

  QuoteResponse.fromJson(Map<String, dynamic> json) {
    category = json['Category'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Category'] = this.category;
    data['Message'] = this.message;
    return data;
  }
}
