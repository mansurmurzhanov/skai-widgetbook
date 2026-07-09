import 'package:flutter/material.dart';
import 'package:skai_widgetbook/feature/common/widget/app_text_field.dart';
import 'package:widgetbook/widgetbook.dart';

final appTextFieldComponent = WidgetbookComponent(
  name: 'AppTextField',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final label = context.knobs.string(label: 'Label', initialValue: 'Name');
        final hint = context.knobs.string(
          label: 'Hint',
          initialValue: 'Enter employee name',
        );
        final required = context.knobs.boolean(label: 'Required');
        final enabled = context.knobs.boolean(
          label: 'Enabled',
          initialValue: true,
        );

        return _FieldFrame(
          child: AppTextField(
            label: label,
            hintText: hint,
            isRequired: required,
            enabled: enabled,
            prefixIcon: const Icon(Icons.person_outline),
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Error',
      builder: (context) => const _FieldFrame(
        child: AppTextField(
          label: 'Email',
          hintText: 'name@company.com',
          errorText: 'Enter a valid corporate email address',
          prefixIcon: Icon(Icons.mail_outline),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Disabled',
      builder: (context) => _FieldFrame(
        child: AppTextField(
          label: 'Department',
          hintText: 'Analytics',
          enabled: false,
          controller: TextEditingController(text: 'Finance analytics'),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Long Text',
      builder: (context) => _FieldFrame(
        child: AppTextField.description(
          label: 'Description',
          hintText: 'Describe the report',
          controller: TextEditingController(
            text:
                'Revenue forecast details with a longer paragraph that should wrap inside the multiline field.',
          ),
        ),
      ),
    ),
  ],
);

class _FieldFrame extends StatelessWidget {
  const _FieldFrame({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(width: 360, child: child),
    );
  }
}
