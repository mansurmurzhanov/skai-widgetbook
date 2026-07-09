import 'package:flutter/material.dart';
import 'package:skai_widgetbook/feature/common/widget/app_confirm_card.dart';
import 'package:widgetbook/widgetbook.dart';

final appConfirmCardComponent = WidgetbookComponent(
  name: 'AppConfirmCard',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final title = context.knobs.string(
          label: 'Title',
          initialValue: 'Approve changes?',
        );
        final description = context.knobs.string(
          label: 'Description',
          initialValue: 'This action will publish the selected report.',
          maxLines: 3,
        );
        final destructive = context.knobs.boolean(label: 'Destructive');

        return _ConfirmFrame(
          child: AppConfirmSheet(
            title: title,
            description: description,
            icon: destructive ? Icons.warning_amber_rounded : Icons.check_circle,
            isDestructive: destructive,
            confirmText: destructive ? 'Delete' : 'Approve',
            cancelText: 'Cancel',
            onConfirm: () {},
            onCancel: () {},
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Destructive',
      builder: (context) => const _ConfirmFrame(
        child: AppConfirmSheet(
          title: 'Delete report?',
          description: 'The report will be removed from the workspace.',
          icon: Icons.delete_outline,
          isDestructive: true,
          confirmText: 'Delete',
          cancelText: 'Keep',
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Long Text',
      builder: (context) => const _ConfirmFrame(
        child: AppConfirmSheet(
          title: 'Approve a long-running synchronization with external systems?',
          description:
              'This demonstrates how the confirmation sheet behaves with longer title and body copy in dashboard flows.',
          icon: Icons.sync,
          confirmText: 'Start sync',
          cancelText: 'Not now',
        ),
      ),
    ),
  ],
);

class _ConfirmFrame extends StatelessWidget {
  const _ConfirmFrame({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: child,
      ),
    );
  }
}
