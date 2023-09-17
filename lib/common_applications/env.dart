import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied()
abstract class Env {
  @EnviedField(varName: 'supaBaseProjectUrl', obfuscate: true)
  static String supaBaseProjectUrl = _Env.supaBaseProjectUrl;

  @EnviedField(varName: 'supaBaseAnonKey', obfuscate: true)
  static String supaBaseAnonKey = _Env.supaBaseAnonKey;
}
