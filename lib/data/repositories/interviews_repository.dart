import '../../core/client.dart';
import '../models/interviews/interviews_model.dart';

class InterviewRepository{
  final ApiClient client;
  InterviewRepository({required this.client});

  Future<List<InterviewsModel>>fetchInterview()async{
    final rawInterview = await client.fetchInterview();
    final interviews = rawInterview.map((e)=> InterviewsModel.fromJson(e)).toList();
    print("repo:$interviews");
    return interviews;
  }
}