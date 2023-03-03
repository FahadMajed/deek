abstract class Router {
  void onSuccess({Map? params, String? message});
  void onFail(dynamic message);

  void call(bool clause) {
    if (clause) {
      onSuccess();
    } else {
      onFail("");
    }
  }
}
