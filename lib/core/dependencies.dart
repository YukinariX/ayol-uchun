import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../data/repositories/accounts_repository.dart';
import '../data/repositories/authorization_repository.dart';
import '../data/repositories/categories_repository.dart';
import '../data/repositories/courses_epository.dart';
import '../data/repositories/interviews_repository.dart';
import '../features/authorization/blocs/login_bloc/login_bloc.dart';
import 'client.dart';

List<SingleChildWidget> providers = [
  Provider(create: (context) => ApiClient()),
  Provider(
    create: (context) => AccountsRepository(client: context.read()),
  ),
  Provider(create: (context) => InterviewRepository(client: context.read())),
  Provider(create: (context) => AuthRepository(client: context.read())),
  Provider(create: (context) => CoursesRepository(client: context.read())),
  Provider(create: (context) => CategoriesRepository(client: context.read())),
  BlocProvider(create: (context) => LoginBloc(repo: context.read())),

];
