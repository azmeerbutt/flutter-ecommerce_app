class PayViewStates {
  final String url;
  const PayViewStates({this.url = ''});

  PayViewStates copywith({String? url}) {
    return PayViewStates(url: url ?? this.url);
  }
}
