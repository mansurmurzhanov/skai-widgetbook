import 'package:flutter/material.dart';
import 'package:skai_widgetbook/feature/common/widget/app_text_field.dart';
import 'package:widgetbook/widgetbook.dart';

final appPasswordFieldComponent = WidgetbookComponent(
  name: 'AppPasswordField',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final label = context.knobs.string(
          label: 'Label',
          initialValue: 'Password',
        );
        final hint = context.knobs.string(
          label: 'Hint',
          initialValue: 'Enter password',
        );
        final enabled = context.knobs.boolean(
          label: 'Enabled',
          initialValue: true,
        );

        return _PasswordFrame(
          child: AppPasswordField(
            label: label,
            hintText: hint,
            enabled: enabled,
            prefixIcon: const Icon(Icons.lock_outline),
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Error',
      builder: (context) => const _PasswordFrame(
        child: AppPasswordField(
          label: 'Password',
          hintText: 'Enter password',
          errorText: 'Password must contain at least 8 characters',
          prefixIcon: Icon(Icons.lock_outline),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Disabled',
      builder: (context) => _PasswordFrame(
        child: AppPasswordField(
          label: 'Password',
          enabled: false,
          controller: TextEditingController(text: 'secret-password'),
        ),
      ),
    ),
  ],
);

class _PasswordFrame extends StatelessWidget {
  const _PasswordFrame({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(width: 360, child: child),
    );
  }
}
