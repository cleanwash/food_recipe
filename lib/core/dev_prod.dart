import 'package:injectable/injectable.dart';


abstract class EnvironmentConfig {
  String get greetingMessage;
  String get subtitleMessage;
}

@Injectable(as: EnvironmentConfig, env: ['dev'])
class DevEnvironmentConfig implements EnvironmentConfig {
  @override
  String get greetingMessage => 'Hello Jega';

  @override
  String get subtitleMessage => 'What would you like today?';
}

@Injectable(as: EnvironmentConfig, env: ['prod'])
class ProdEnvironmentConfig implements EnvironmentConfig {
  @override
  String get greetingMessage => '안녕 Jega';

  @override
  String get subtitleMessage => '오늘은 무엇을 드시겠어요?';
}