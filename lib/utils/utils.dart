import 'dart:async';

Future<dynamic> doOnFuture(FutureOr<dynamic> Function() function) {
  return Future.delayed(Duration.zero, function);
}
