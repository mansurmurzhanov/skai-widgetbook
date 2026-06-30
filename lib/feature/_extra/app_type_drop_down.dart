import 'package:flutter/material.dart';
import 'package:skai_widgetbook/core/extensions/context_extension.dart';
import 'package:skai_widgetbook/core/theme/app_colors.dart';
import 'package:skai_widgetbook/feature/ceo/presentation/widget/ceo_filter_type_panel.dart';
import 'package:skai_widgetbook/feature/common/widget/app_glass_card.dart';

class AppTypeDropDown<T> extends StatefulWidget {
  final T? value;
  final T initialValue;
  final ValueChanged<T>? onChanged;
  final String title;
  final List<T> items;
  final String Function(T) itemLabel;
  final String Function(T) chipTitle;

  const AppTypeDropDown({
    super.key,
    this.value,
    required this.initialValue,
    this.onChanged,
    required this.title,
    required this.items,
    required this.itemLabel,
    required this.chipTitle,
  });

  @override
  State<AppTypeDropDown<T>> createState() => _AppTypeDropDownState<T>();
}

class _AppTypeDropDownState<T> extends State<AppTypeDropDown<T>> {
  late final LayerLink _layerLink;
  late final OverlayPortalController _overlayPortalController;
  late final ValueNotifier<bool> _isOpenController;
  ValueNotifier<T>? _internalSelection;

  @override
  void initState() {
    super.initState();
    _layerLink = LayerLink();
    _overlayPortalController = OverlayPortalController();
    _isOpenController = ValueNotifier(false);
    if (widget.value == null) {
      _internalSelection = ValueNotifier<T>(widget.initialValue);
    }
  }

  @override
  void dispose() {
    _isOpenController.dispose();
    _internalSelection?.dispose();
    super.dispose();
  }

  void _toggle() {
    if (_overlayPortalController.isShowing) {
      _overlayPortalController.hide();
      _isOpenController.value = false;
    } else {
      _overlayPortalController.show();
      _isOpenController.value = true;
    }
  }

  void _hideOverlay() {
    _overlayPortalController.hide();
    _isOpenController.value = false;
  }

  void _onTypeSelected(T nextValue) {
    if (widget.value == null) {
      _internalSelection!.value = nextValue;
    }
    widget.onChanged?.call(nextValue);
    _hideOverlay();
  }

  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
      controller: _overlayPortalController,
      overlayChildBuilder: (context) {
        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: _hideOverlay,
              ),
            ),
            CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              targetAnchor: Alignment.bottomLeft,
              followerAnchor: Alignment.topLeft,
              offset: const Offset(-18, 12),
              child: Material(
                color: AppColors.transparent,
                child: _SelectionListenable<T>(
                  value: widget.value,
                  internal: _internalSelection,
                  builder: (context, selected) {
                    return AppFilterTypePanel<T>(
                      title: widget.title,
                      items: widget.items,
                      selectedValue: selected,
                      onTap: _onTypeSelected,
                      labelBuilder: widget.itemLabel,
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
      child: CompositedTransformTarget(
        link: _layerLink,
        child: _SelectionListenable<T>(
          value: widget.value,
          internal: _internalSelection,
          builder: (context, selected) {
            return ValueListenableBuilder<bool>(
              valueListenable: _isOpenController,
              builder: (context, isOpen, _) {
                return AppGlassCard(
                  borderRadius: 8,
                  padding: const EdgeInsets.all(8),
                  onTap: _toggle,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          widget.chipTitle(selected),
                          overflow: TextOverflow.ellipsis,
                          style: context.theme.textTheme.bodyMedium?.copyWith(
                            color: context.theme.colorScheme.onSurface,
                          ),
                        ),
                      ),
                      AnimatedRotation(
                        turns: isOpen ? 0.5 : 0,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: context.theme.colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _SelectionListenable<T> extends StatelessWidget {
  final T? value;
  final ValueNotifier<T>? internal;
  final Widget Function(BuildContext context, T selected) builder;

  const _SelectionListenable({
    required this.value,
    required this.internal,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    final external = value;
    if (external != null) {
      return builder(context, external as T);
    }
    return ValueListenableBuilder<T>(
      valueListenable: internal!,
      builder: (context, selected, _) => builder(context, selected),
    );
  }
}
