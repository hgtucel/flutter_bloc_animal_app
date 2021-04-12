class RequestResult<T> {
  final T data;
  final Status status;

  RequestResult(this.data, this.status);
}

enum Status { failure, success }
