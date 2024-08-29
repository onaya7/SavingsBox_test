import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

GetIt sl = GetIt.instance;

@InjectableInit(asExtension: false)
void configureDependencies() => init(sl);
