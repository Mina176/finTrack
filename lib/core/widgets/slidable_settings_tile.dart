import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableSettingsTile extends StatelessWidget {
  const SlidableSettingsTile({
    super.key,
    required this.itemKey,
    required this.groupTag,
    required this.child,
    required this.onDeleteTapped,
  });

  final Key itemKey;
  final Object? groupTag;
  final Widget child;
  final VoidCallback onDeleteTapped;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: itemKey,
      groupTag: groupTag,
      closeOnScroll: true,
      startActionPane: ActionPane(
        extentRatio: 0.3,
        openThreshold: 0.12,
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => onDeleteTapped(),
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
          ),
        ],
      ),
      child: child,
    );
  }
}
