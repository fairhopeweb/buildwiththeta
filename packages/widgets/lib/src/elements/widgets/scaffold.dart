// Flutter imports:
// ignore_for_file: public_member_api_docs

// Package imports:

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:theta_models/theta_models.dart';
import 'package:theta_open_widgets/src/elements/builders/box_transform.dart';
import 'package:theta_open_widgets/theta_open_widgets.dart';

class OpenWScaffold extends NodeWidget {
  const OpenWScaffold({
    super.key,
    required super.nodeState,
    required this.children,
    required this.fill,
    required this.showAppBar,
    required this.showBottomBar,
    required this.showDrawer,
    required this.isScrollable,
    required this.isClipped,
    required this.bodyExtended,
    required this.isBoxed,
    required this.flag,
  });

  final List<CNode> children;
  final bool isBoxed;
  final FFill fill;
  final bool showAppBar;
  final bool showBottomBar;
  final bool showDrawer;
  final bool isScrollable;
  final bool isClipped;
  final bool bodyExtended;
  final bool flag;

  @override
  Widget build(final BuildContext context, final TreeState state,
      final WidgetState nodeState) {
    final widgets =
        children.map((final e) => BoxTransformBuilder(node: e)).toList();
    if (state.forPlay) {
      return Stack(
        children: widgets,
      );
    }
    return DragTarget<DragTargetSingleNodeModel>(
      onAcceptWithDetails: (data) {
        var renderBox = context.findRenderObject() as RenderBox;
        final offsetLocalRelative = renderBox.globalToLocal(data.offset);
        TreeGlobalState.onNodeAdded(
          data.data.node,
          nodeState.node,
          offsetLocalRelative,
        );
      },
      builder: (context, _, __) => Stack(
        children: widgets,
      ),
    );
  }
}
