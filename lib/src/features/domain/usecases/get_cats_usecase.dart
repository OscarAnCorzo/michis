

import 'package:dartz/dartz.dart';
import 'package:michis/src/core/failures.dart';
import 'package:michis/src/features/domain/entities/breed_entity.dart';
import 'package:michis/src/features/domain/repositories/cats_repository.dart';

class GetCatsUseCase {
  final CatsRepository _repository;

  GetCatsUseCase(this._repository);

  Future<Either<Failure, List<BreedEntity>>> call() async {
    return await _repository.getCats();
  }
}