import 'package:flutter/material.dart';
import 'package:status_based_state/src/enums.dart';

// An abstract class that extends the State of a StatefulWidget
// to provide a status-based state management approach.
abstract class StatusBasedState<T extends StatefulWidget> extends State<T> {
  // The current status of the state.
  StateStatus status = StateStatus.initial;

  // Determines whether to wrap the content with a background container.
  bool addBackgroundContainer = true;

  // Getters to check the current status.
  bool get isInitial => status == StateStatus.initial;
  bool get isLoading => status == StateStatus.loading;
  bool get isLoaded => status == StateStatus.loaded;
  bool get isError => status == StateStatus.error;

  // Method to change the current state status and call setState() accordingly.
  void changeStateStatus(StateStatus newStatus) {
    if (!mounted) return;
    setState(() {
      status = newStatus;
    });
  }

  // Optionally wraps the provided child widget with a Container
  // that sets the background color to the scaffold's background color.
  Widget maybeWrap(BuildContext context, Widget child) {
    if (addBackgroundContainer) {
      return Container(
          color: Theme.of(context).scaffoldBackgroundColor, child: child);
    }
    return child;
  }

  // Default build method for the initial state.
  // Returns a Container with the scaffold's background color.
  Widget initialBuild(BuildContext context) =>
      Container(color: Theme.of(context).scaffoldBackgroundColor);
  
  // Default build method for the error state.
  // Returns a Container with the scaffold's background color.
  Widget errorBuild(BuildContext context) =>
      Container(color: Theme.of(context).scaffoldBackgroundColor);
  
  // Abstract method to build the loading state.
  // Must be implemented by subclasses.
  Widget loadingBuild(BuildContext context);
  
  // Abstract method to build the content state.
  // Must be implemented by subclasses.
  Widget contentBuild(BuildContext context);

  // The build method determines which widget to display based on the current state.
  @override
  Widget build(BuildContext context) {
    return switch (status) {
      StateStatus.loading => maybeWrap(context, loadingBuild(context)),
      StateStatus.error => maybeWrap(context, errorBuild(context)),
      StateStatus.initial => initialBuild(context),
      StateStatus.loaded => contentBuild(context),
    };
  }
}
