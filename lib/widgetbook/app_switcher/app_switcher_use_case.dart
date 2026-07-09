import 'package:flutter/material.dart';
import 'package:skai_widgetbook/feature/common/widget/app_switcher.dart';
import 'package:widgetbook/widgetbook.dart';

final appSwitcherComponent = WidgetbookComponent(
  name: 'AppSwitcher',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final label = context.knobs.string(
          label: 'Label',
          initialValue: 'Enable notifications',
        );
        final enabled = context.knobs.boolean(
          label: 'Enabled',
          initialValue: true,
        );
        final value = context.knobs.boolean(
          label: 'Initial value',
          initialValue: true,
        );

        return _SwitcherFrame(
          child: AppSwitcherWidget(
            label: label,
            enabled: enabled,
            valueNotifier: ValueNotifier(value),
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Disabled',
      builder: (context) => _SwitcherFrame(
        child: AppSwitcherWidget(
          label: 'Allow export',
          enabled: false,
          valueNotifier: ValueNotifier(false),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Error',
      builder: (context) => _SwitcherFrame(
        child: AppSwitcherWidget(
          label: 'Required confirmation',
          isRequired: true,
          errorText: 'This toggle must be enabled before publishing',
          valueNotifier: ValueNotifier(false),
        ),
      ),
    ),
  ],
);

class _SwitcherFrame extends StatelessWidget {
  const _SwitcherFrame({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(width: 320, child: child),
    );
  }
}
