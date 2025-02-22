# Status Based State Management

A lightweight Flutter package for managing UI states using a status-based approach. Easily switch between **initial**, **loading**, **loaded**, and **error** states with minimal boilerplate.

## Features

- **State Management:** Provides an abstract `StatusBasedState` for handling different UI states.
- **Automatic Updates:** Uses `changeStateStatus` to update the UI via `setState`.
- **Optional Background:** Automatically wraps content with a container matching the scaffold background color (toggle via `addBackgroundContainer`).

## Usage

Extend `StatusBasedState` in your widget’s state class and implement the abstract methods:

- `loadingBuild(BuildContext context)`
- `contentBuild(BuildContext context)`

You can also override:

- `initialBuild(BuildContext context)` – default: a container with the scaffold background color.
- `errorBuild(BuildContext context)` – default: a container with the scaffold background color.

## Example Snippet

Below is a snippet for a `StatusBasedStatefulWidget` template that can be used in your code editor:

```json
"StatusBasedStatefulWidget":{
	"prefix": "sts",
	"body": [
		"import 'package:flutter/material.dart';",
		"import 'package:status_based_state/status_based_state.dart';",
		"",
		"",
		"class ${1:MyWidget} extends StatefulWidget {",
		"  const ${1:MyWidget}({Key? key}) : super(key: key);",
		"",
		"  @override",
		"  StatusBasedState<${1:MyWidget}> createState() => _${1:MyWidget}State();",
		"}",
		"",
		"class _${1:MyWidget}State extends StatusBasedState<${1:MyWidget}> {",
		"  @override",
		"  Widget initialBuild(BuildContext context) {",
		"    // TODO: Implement your initial UI here (Optional)",
		"    return Placeholder();",
		"  }",
		"",
		"  @override",
		"  Widget loadingBuild(BuildContext context) {",
		"    // TODO: Implement your loading UI here",
		"    return Center(child: CircularProgressIndicator());",
		"  }",
		"",
		"  @override",
		"  Widget errorBuild(BuildContext context) {",
		"    // TODO: Implement your error UI here (Optional)",
		"    return Placeholder();",
		"  }",
		"",
		"  @override",
		"  Widget contentBuild(BuildContext context) {",
		"    // TODO: Implement your content UI here",
		"    return Placeholder();",
		"  }",
		"}"
	],
	"description": "StatusBasedStatefulWidget template"
}
```

## Customization

* Background Wrapper: Set `addBackgroundContainer` to false if you prefer not to wrap your content with the scaffold’s background color.
* State Transitions: Call `changeStateStatus(newStatus)` to update the UI based on state changes.

