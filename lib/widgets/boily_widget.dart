import 'package:boily/stores/boily_store.dart';
import 'package:boily/widgets/boily_try_again_widget.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

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

  List<ReactionDisposer> _reactions;
  BuildContext context;

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
  }) : super(key: key) {
    _reactions = [
      reaction((_) => store.errorStore.snackError, (String snackError) {
        if (snackError != null && snackError.isNotEmpty) {
          print('snackError: $snackError');
          FlushbarHelper.createError(message: snackError)
              .show(context)
              .then((value) => store.errorStore.resetErrors());
        }
      }),
      reaction((_) => store.successSnack, (String successMessage) {
        print('successMessage: $successMessage');
        if (successMessage != null && successMessage.isNotEmpty) {
          FlushbarHelper.createSuccess(message: successMessage)
              .show(context)
              .then((value) => store.resetSuccessSnack());
        }
      }),
      reaction((_) => store.infoSnack, (String successMessage) {
        print('infoMessage: $successMessage');
        if (successMessage != null && successMessage.isNotEmpty) {
          FlushbarHelper.createSuccess(message: successMessage)
              .show(context)
              .then((value) => store.resetInfoSnack());
        }
      }),
    ];
  }

  void dispose() {
    print("dispose base page");
    _reactions?.forEach((element) => element());
  }

  @override
  _BoilyWidgetState createState() => _BoilyWidgetState();
}

class _BoilyWidgetState extends State<BoilyWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    print("dispose base page state");
    widget.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.context = context;
    return Observer(
        builder: (_) => widget.handleFetchAndErrorStatesLocally
            ? buildMainBody(context)
            : ModalProgressHUD(
                inAsyncCall: widget.store.isLoading,
                child: buildMainBody(context),
              ));
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
        return const Center(
          child: Padding(
              padding: EdgeInsets.all(20), child: CircularProgressIndicator()),
        );
      case StoreStatus.none:
      case StoreStatus.success:
      case StoreStatus.loading:
      case StoreStatus.warn:
        return buildChild();
      case StoreStatus.empty:
        return widget.emptyBody ??
            Center(
              child:
                  Text(widget.emptyText ?? Boily.emptyWidgetMessage ?? 'Empty!'),
            );
    }

  }

  Widget buildChild() {
    return Container(padding: widget.padding, child: widget.child);
  }
}
