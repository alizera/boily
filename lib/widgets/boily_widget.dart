import 'package:boily/stores/boily_store.dart';
import 'package:boily/widgets/try_again_widget.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class BoilyWidget extends StatefulWidget {
  final Widget child;
  final BoilyStore store;
  final EdgeInsets padding;
  final Widget emptyBody;
  final bool useCustomLoading;
  final VoidCallback onTryAgain;

  List<ReactionDisposer> _reactions;
  BuildContext context;

  BoilyWidget({
    Key key,
    @required this.child,
    @required this.store,
    this.padding,
    this.emptyBody,
    this.useCustomLoading = false,
    this.onTryAgain,
  }) : super(key: key) {
    _reactions = [
      reaction((_) => store.errorStore.snackError, (String snackError) {
        if (snackError != null && snackError.isNotEmpty) {
          print('snackError: $snackError');
          FlushbarHelper.createError(message: snackError)
              .show(context)
              .then((value) => store.errorStore.resetSnackError());
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
        builder: (_) => widget.useCustomLoading
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
        return Center(
            child: TryAgainWidget(
          errorMessage: widget.store.errorStore.errorMessage,
          onTryAgain: widget.onTryAgain,
        ));
      case StoreStatus.fetching:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case StoreStatus.none:
      case StoreStatus.success:
      case StoreStatus.loading:
      case StoreStatus.warn:
        return Container(padding: widget.padding, child: widget.child);
      case StoreStatus.empty:
        return widget.emptyBody ??
            const Center(
              child: Text('Empty!'),
            );
    }
  }
}
