import 'package:collection/collection.dart';

import 'package:widgetbook/src/models/organizers/organizer.dart';
import 'package:widgetbook/src/models/organizers/organizers.dart';

/// ExpandableOrganizer is an abstract model which can host
/// WidgetElements and/or Folders
abstract class ExpandableOrganizer extends Organizer {
  ExpandableOrganizer({
    required String name,
    required this.isExpanded,
    List<WidgetbookFolder>? folders,
    List<WidgetbookWidget>? widgets,
  })  : folders = folders ?? List<WidgetbookFolder>.empty(),
        widgets = widgets ?? List<WidgetbookWidget>.empty(),
        super(
          name,
        );

  /// Used to implement collapsing and expanding of the folder tree.
  bool isExpanded;

  /// The folders of one level in the folder tree.
  /// Folders will be shown above widgets.
  final List<WidgetbookFolder> folders;

  /// The widgets of one level in the folder tree.
  /// Widgets will be shown below folders;
  final List<WidgetbookWidget> widgets;

  /// Abstract class for organizer panel in the left.

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is ExpandableOrganizer &&
        other.isExpanded == isExpanded &&
        listEquals(other.folders, folders) &&
        listEquals(other.widgets, widgets);
  }

  @override
  int get hashCode => isExpanded.hashCode ^ folders.hashCode ^ widgets.hashCode;
}
