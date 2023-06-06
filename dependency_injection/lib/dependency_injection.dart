import 'package:dependency_injection/data_dependency_injection.dart' as data_di;
import 'package:dependency_injection/domain_dependency_injection.dart' as domain_di;

Future<void> init() async {

  await data_di.init();
  await domain_di.init();

}