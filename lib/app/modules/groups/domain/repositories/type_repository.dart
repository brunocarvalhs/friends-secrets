import 'package:dartz/dartz.dart';

import '../entities/logged_type_info.dart';
import '../../domain/errors/errors.dart';

abstract class TypesRepository {
  Future<Either<Failure, Iterable<LoggedTypeInfo>>> all();
}
