import 'dart:developer';

import 'package:boily/stores/boily_message_store.dart';
import 'package:boily/stores/boily_store.dart';
import 'package:boily/widgets/boily_try_again_widget.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

import '../boily.dart';

class BoilyWidget extends StatefulWidget {
  final Widget child;
  final BoilyStore store;
  final EdgeInsets padding;
  final Widget emptyBody;
  final bool handleFetchAndErrorStatesLocally;
  final VoidCallback onTryAgain;
  final String tryAgainText;
  final Widget customFetchingWidget;
  final Widget customErrorWidget;
  final String emptyText;
  final String tag;

  BoilyWidget({
    Key key,
    @required this.store,
    @required this.child,
    this.padding,
    this.emptyBody,
    this.handleFetchAndErrorStatesLocally = false,
    this.onTryAgain,
    this.tryAgainText,
    this.customFetchingWidget,
    this.customErrorWidget,
    this.emptyText,
    this.tag = '',
  }) : super(key: key);

  @override
  _BoilyWidgetState createState() => _BoilyWidgetState();
}

class _BoilyWidgetState extends State<BoilyWidget> {
  List<ReactionDisposer> _reactions;
  BoilyMessageStore _messageStore;

  void _log(String message) {
    String finalMessage = 'BoilyWidget';
    if (widget.tag?.isNotEmpty ?? false) {
      finalMessage += ' (${widget.tag})';
    }
    finalMessage += ' -> $message';
    log(finalMessage);
  }

  @override
  void didChangeDependencies() {
    _messageStore ??= Provider.of<BoilyMessageStore>(context);
    _reactions ??= [
      reaction((_) => widget.store.errorStore.snackError, (String snackError) {
        if (snackError != null && snackError.isNotEmpty) {
          _log('snackError: $snackError');
          FlushbarHelper.createError(message: snackError)
              .show(context)
              .then((value) => widget.store.errorStore.resetErrors());
        }
      }),
    ];

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _log('dispose');
    _reactions?.forEach((element) => element());
    widget.store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => widget.handleFetchAndErrorStatesLocally
            ? buildMainBody(context)
            : buildBuiltinLoading(context));
  }

  ModalProgressHUD buildBuiltinLoading(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: widget.store.isLoading,
      child: buildMainBody(context),
    );
  }

  // ignore: missing_return
  Widget buildMainBody(BuildContext context) {
    switch (widget.store.status) {
      case StoreStatus.error:
        if (widget.handleFetchAndErrorStatesLocally) {
          return buildChild();
        }
        return Center(
            child: BoilyTryAgainWidget(
              errorMessage: widget.store.errorStore.errorMessage,
              onTryAgain: widget.onTryAgain,
              buttonText: widget.tryAgainText,
            ));
      case StoreStatus.fetching:
        if (widget.handleFetchAndErrorStatesLocally) {
          return buildChild();
        }
        return Center(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Boily.customFetching ?? const CircularProgressIndicator()),
        );
      case StoreStatus.none:
      case StoreStatus.success:
      case StoreStatus.loading:
      case StoreStatus.warn:
        return buildChild();
      case StoreStatus.empty:
        return widget.emptyBody ??
            Center(
              child: Text(
                  widget.emptyText ?? Boily.emptyWidgetMessage ?? 'Empty!'),
            );
    }
  }

  Widget buildChild() {
    return Container(padding: widget.padding, child: widget.child);
  }
}
