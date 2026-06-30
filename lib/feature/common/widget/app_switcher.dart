import 'package:flutter/material.dart';
import 'package:skai_data_mobile/feature/common/presentation/widget/app_text_field.dart';

class AppSwitcherWidget extends StatefulWidget {
  final String? label;
  final String? description;
  final bool isRequired;
  final String? errorText;
  final ValueNotifier<bool> valueNotifier;
  final ValueChanged<bool>? onChanged;
  final bool enabled;

  const AppSwitcherWidget({
    super.key,
    this.label,
    required this.valueNotifier,
    this.description,
    this.isRequired = false,
    this.errorText,
    this.onChanged,
    this.enabled = true,
  });

  @override
  State<AppSwitcherWidget> createState() => _AppSwitcherWidgetState();
}

class _AppSwitcherWidgetState extends State<AppSwitcherWidget> with SingleTickerProviderStateMixin {
  late AnimationController _errorController;
  late Animation<double> _errorAnimation;

  @override
  void initState() {
    super.initState();
    _errorController = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
    _errorAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _errorController, curve: Curves.elasticOut));
  }

  @override
  void dispose() {
    _errorController.dispose();
    super.dispose();
  }

  bool get hasErrorText => widget.errorText != null && widget.errorText!.isNotEmpty;

  @override
  void didUpdateWidget(AppSwitcherWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (hasErrorText != (oldWidget.errorText != null && oldWidget.errorText!.isNotEmpty)) {
      if (hasErrorText) {
        _errorController.forward();
      } else {
        _errorController.reverse();
      }
    }
  }

  void _handleChanged(bool _) {
    if (!widget.enabled) return;
    widget.valueNotifier.value = !widget.valueNotifier.value;
    widget.onChanged?.call(widget.valueNotifier.value);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null)
          AppFieldLabel(label: widget.label!, isRequired: widget.isRequired, style: textTheme.bodySmall),
        ValueListenableBuilder<bool>(
          valueListenable: widget.valueNotifier,
          builder: (context, value, _) {
            return Align(
              alignment: Alignment.centerLeft,
              child: Switch(
                value: value,
                onChanged: widget.enabled ? _handleChanged : null,
                activeThumbColor: colorScheme.primary,
                activeTrackColor: colorScheme.primary.withValues(alpha: 0.5),
                inactiveThumbColor: colorScheme.onSurface.withValues(alpha: 0.6),
                inactiveTrackColor: colorScheme.surfaceContainerHighest,
                trackOutlineColor: WidgetStatePropertyAll<Color>(
                  colorScheme.outline.withValues(alpha: isDark ? 0.6 : 0.4),
                ),
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: _errorAnimation,
          builder: (context, child) {
            return AnimatedSize(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: hasErrorText
                  ? Padding(
                      padding: const EdgeInsets.only(top: 4, left: 4, right: 4),
                      child: Row(
                        children: [
                          Icon(Icons.error_outline_rounded, size: 14, color: colorScheme.error),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              widget.errorText!,
                              style: textTheme.bodySmall!.copyWith(
                                color: colorScheme.error,
                                fontWeight: FontWeight.w400,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
            );
          },
        ),
      ],
    );
  }
}
