abstract class PayViewEvents {
  const PayViewEvents();
}

class TriggerPayView extends PayViewEvents {
  final String url;
  const TriggerPayView(this.url) : super();
}
