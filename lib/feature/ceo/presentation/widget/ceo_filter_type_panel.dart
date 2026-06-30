import 'package:flutter/material.dart';
import 'package:skai_widgetbook/core/extensions/context_extension.dart';
import 'package:skai_widgetbook/core/theme/app_spacing.dart';
import 'package:skai_widgetbook/feature/common/widget/app_card.dart';

class AppFilterTypePanel<T> extends StatelessWidget {
  const AppFilterTypePanel({
    super.key,
    required this.title,
    required this.items,
    required this.selectedValue,
    required this.onTap,
    required this.labelBuilder,
  });

  final String title;
  final List<T> items;
  final T selectedValue;
  final ValueChanged<T> onTap;
  final String Function(T) labelBuilder;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 260),
      child: AppCard(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.textTheme.titleMedium,
              ),
              const SizedBox(height: AppSpacing.md),
              ...items.map(
                (item) {
                  final selected = item == selectedValue;

                  return ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text(labelBuilder(item)),
                    trailing: selected
                        ? Icon(
                            Icons.check,
                            color: context.colorScheme.primary,
                          )
                        : null,
                    onTap: () => onTap(item),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}