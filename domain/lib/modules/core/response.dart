///
///  TMPS Project
///
///  This is an example of abstract factory
///
///

abstract class Failure {
  void display();
}

class ApiFailure implements Failure {
  final dynamic apiError;
  final StackTrace st;

  ApiFailure(this.apiError, this.st);

  @override
  void display() {
    print('//////////////////////////////////////////\n'
        '/////////////////\t\tAPI ERROR\n'
        '////////////////////////////////////////////\n'
        '$apiError\n\n\n'
        '$st');
  }
}

class OtherFailure implements Failure {
  final dynamic error;
  final StackTrace st;

  OtherFailure(this.error, this.st);

  @override
  void display() {
    print('//////////////////////////////////////////\n'
        '/////////////////\t\tOTHER ERROR\n'
        '////////////////////////////////////////////\n'
        '$error\n\n\n'
        '$st');
  }
}
