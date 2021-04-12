abstract class IRequestResult<T> {
  T data;
  Status status;
}

enum Status { failure, success }
