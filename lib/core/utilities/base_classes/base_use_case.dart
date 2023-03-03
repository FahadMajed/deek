abstract class UseCase<Response, Request> {
  UseCase();

  Future<Response> call(Request request);
}

abstract class NoRequestUseCase<Response> {
  Future<Response> call();
}
