import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_task/core/constants/firebase_constants.dart';
import 'package:todo_task/core/error/failure.dart';
import 'package:todo_task/core/providers/firebase_providers.dart';
import 'package:todo_task/features/home/model/user_model.dart';
part 'home_remote_repository.g.dart';

// final homeRemoteRepositryProvider = Provider(
//   (ref) => HomeRemoteRepositry(firestore: ref.read(firestoreProvider)),
// );
@riverpod
HomeRemoteRepositry homeRemoteRepository(HomeRemoteRepositoryRef ref) {
  return HomeRemoteRepositry(firestore: ref.read(firestoreProvider));
}

// final testRemoteRepositoryProvider = Provider(
//   (ref) => HomeRemoteRepositry(firestore: ref.read(firestoreProvider)),
// );

class HomeRemoteRepositry {
  final FirebaseFirestore _firestore;

  HomeRemoteRepositry({required FirebaseFirestore firestore})
      : _firestore = firestore;

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.users);

  Future<Either<AppFailure, UserModel?>> addUser(UserModel userModel) async {
    try {
      UserModel? user;
      await _users.add(userModel.toMap()).then(
        (value) async {
          await value.update(
              userModel.copyWith(id: value.id, reference: value).toMap());

          user = userModel.copyWith(id: value.id, reference: value);
          return right(userModel.copyWith(id: value.id, reference: value));
        },
      );
      
      return right(user);
    } catch (e) {
      return left(AppFailure(e.toString()));
    }
  }
}
