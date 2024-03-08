import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_it/common/widgets/common_widgets.dart';
import 'package:learn_it/pages/payment/bloc/paywebview_blocs.dart';
import 'package:learn_it/pages/payment/bloc/paywebview_events.dart';
import 'package:learn_it/pages/payment/bloc/paywebview_states.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PayView extends StatefulWidget {
  const PayView({super.key});

  @override
  State<PayView> createState() => _PayViewState();
}

class _PayViewState extends State<PayView> {
  late final WebViewController controller;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    context.read<PayViewBlocs>().add(TriggerPayView(args["url"]));
  }

  @override
  void dispose() {
    controller.clearCache();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBarWithBack('Payment'),
      body: BlocBuilder<PayViewBlocs, PayViewStates>(
        builder: (context, state) {
          return state.url == ""
              ? const CircularProgressIndicator()
              : WebView(
                  initialUrl: state.url,
                  javascriptMode: JavascriptMode.unrestricted,
                  javascriptChannels: {
                    JavascriptChannel(
                      name: 'Pay',
                      onMessageReceived: (JavascriptMessage msg) {
                        print(msg.message);
                      },
                    ),
                  },
                  onWebViewCreated: (WebViewController w) {
                    controller = w;
                  },
                );
        },
      ),
    );
  }
}
