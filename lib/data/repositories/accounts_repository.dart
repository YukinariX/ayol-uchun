import '../../core/client.dart';
import '../models/accounts/social_media_accounts_model.dart';

class AccountsRepository{

  final ApiClient client;
  AccountsRepository({required this.client});

  Future<List<SocialMediaAccountsModel>>fetchAccounts()async{
    final rawSocialAccount = await client.fetchSocialMediaAccount();
    final socialAccounts  = rawSocialAccount.map((e)=> SocialMediaAccountsModel.fromJson(e)).toList();
    print("repo:$socialAccounts");
    return socialAccounts;
  }
}