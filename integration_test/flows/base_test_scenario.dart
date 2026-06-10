import 'package:patrol/patrol.dart';

abstract base class BaseTestScenario {
  BaseTestScenario(this.$, {this.next});

  final PatrolIntegrationTester $;
  final BaseTestScenario? next;

  Future<void> run();
  Future<bool> waitAndCheckValid();

  Future<void> startFlow() async {
    if (await waitAndCheckValid()) {
      await run();
    }

    await next?.startFlow();
  }
}
