import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:status_based_state/status_based_state.dart';

// A simple widget that extends StatusBasedState for testing purposes.
class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  StatusBasedState<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends StatusBasedState<TestWidget> {
  // Overriding initialBuild to return a Text widget for testing.
  @override
  Widget initialBuild(BuildContext context) {
    return const Text('Initial');
  }

  // Overriding loadingBuild to return a Text widget for testing.
  @override
  Widget loadingBuild(BuildContext context) {
    return const Text('Loading');
  }

  // Overriding errorBuild to return a Text widget for testing.
  @override
  Widget errorBuild(BuildContext context) {
    return const Text('Error');
  }

  // Overriding contentBuild to return a Text widget for testing.
  @override
  Widget contentBuild(BuildContext context) {
    return const Text('Content');
  }
}

void main() {
  testWidgets('StatusBasedState widget changes state correctly', (WidgetTester tester) async {
    // Build the widget wrapped in MaterialApp (needed for Theme access).
    await tester.pumpWidget(const MaterialApp(home: TestWidget()));

    // Verify that the initial state is displayed.
    expect(find.text('Initial'), findsOneWidget);

    // Obtain the state instance from the widget.
    final state = tester.state<_TestWidgetState>(find.byType(TestWidget));

    // Change to loading state and verify.
    state.changeStateStatus(StateStatus.loading);
    await tester.pump();
    expect(find.text('Loading'), findsOneWidget);

    // Change to error state and verify.
    state.changeStateStatus(StateStatus.error);
    await tester.pump();
    expect(find.text('Error'), findsOneWidget);

    // Change to loaded (content) state and verify.
    state.changeStateStatus(StateStatus.loaded);
    await tester.pump();
    expect(find.text('Content'), findsOneWidget);
  });
}