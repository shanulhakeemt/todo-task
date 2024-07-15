import 'package:fpdart/fpdart.dart';
import 'package:todo_task/features/home/model/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_task/features/home/repository/home_remote_repository.dart';
part 'home_viewmodel.g.dart';

@riverpod
class HomeViewmodel extends _$HomeViewmodel {
  late HomeRemoteRepositry _homeRemoteRepositry;

  Future<void> addUser(UserModel userModel) async {
    state = const AsyncValue.loading();
    final res = await _homeRemoteRepositry.addUser(userModel);

    final val = switch (res) {
      Left(value: final l) => state =
          AsyncValue.error(l.message, StackTrace.current),
      Right(value: final r) => r,
    };
    print(val);
  }

  AsyncValue checkUser(UserModel? userModel) {
    if (userModel == null) {
      return state = AsyncError('user is null', StackTrace.current);
    } else {
      return state = AsyncValue.data([userModel]);
    }
  }

  @override
  AsyncValue<List<UserModel>>? build() {
    _homeRemoteRepositry = ref.watch(homeRemoteRepositoryProvider);
    return null;
  }
}
