import 'package:bloc/bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(AuthState initialState) : super(initialState);
}
