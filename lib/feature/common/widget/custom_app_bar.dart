import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skai_widgetbook/core/extensions/context_extension.dart';
import 'package:skai_widgetbook/core/theme/app_colors.dart';
import 'package:skai_widgetbook/core/theme/app_spacing.dart';
import 'package:skai_widgetbook/feature/_extra/app_type_drop_down.dart';
import 'package:skai_widgetbook/feature/_extra/company_analytics_entity.dart';
import 'package:skai_widgetbook/feature/_extra/assets.gen.dart';

class CustomAppBar<T> extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onDatePickerTap;
  final String? dateRangeText;
  final bool showDatePicker;
  final T? selectedType;
  final T? initValue;
  final ValueChanged<T>? onTypeChanged;
  final bool showFullLogo;
  final bool showCeoFilterPanel;
  final String? title;
  final String? filterDropDownTitle;
  final List<T>? filterItems;
  final String Function(T)? filterItemLabel;
  final String Function(T)? filterChipTitle;
  final bool showCompanyFilterPanel;
  final CompanyAnalyticsEntity? selectedCompany;
  final CompanyAnalyticsEntity? companyInitValue;
  final ValueChanged<CompanyAnalyticsEntity>? onCompanyChanged;
  final String? companyDropDownTitle;
  final List<CompanyAnalyticsEntity>? companyItems;
  final String Function(CompanyAnalyticsEntity)? companyItemLabel;
  final String Function(CompanyAnalyticsEntity)? companyChipTitle;

  const CustomAppBar({
    super.key,
    this.onDatePickerTap,
    this.dateRangeText,
    this.showDatePicker = false,
    this.showCeoFilterPanel = false,
    this.showFullLogo = false,
    this.selectedType,
    this.onTypeChanged,
    this.title,
    this.initValue,
    this.filterDropDownTitle,
    this.filterItems,
    this.filterItemLabel,
    this.filterChipTitle,
    this.showCompanyFilterPanel = false,
    this.selectedCompany,
    this.companyInitValue,
    this.onCompanyChanged,
    this.companyDropDownTitle,
    this.companyItems,
    this.companyItemLabel,
    this.companyChipTitle,
  });

  static const double _logoAspectRatio = 470 / 212;
  static const double _logoHeight = 46;
  static const double _logoWidth = _logoHeight * _logoAspectRatio;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AppBar(
      titleSpacing: AppSpacing.md,
      backgroundColor: AppColors.transparent,
      surfaceTintColor: AppColors.transparent,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: _logoHeight,
            width: _logoWidth,
            child: SvgPicture.asset(
              theme.brightness == Brightness.dark
                  ? (!showFullLogo
                        ? Assets.icons.whiteLogo.path
                        : Assets.icons.whiteFullLogo.path)
                  : Assets.images.logo.path,
              fit: BoxFit.contain,
            ),
          ),
          const Spacer(),
          if (title != null) Text(title!, style: context.textTheme.titleLarge),
          if (showCeoFilterPanel)
            if (initValue != null &&
                filterDropDownTitle != null &&
                filterItems != null &&
                filterItemLabel != null &&
                filterChipTitle != null)
              AppTypeDropDown<T>(
                value: selectedType,
                onChanged: onTypeChanged,
                initialValue: initValue as T,
                title: filterDropDownTitle!,
                items: filterItems!,
                itemLabel: filterItemLabel!,
                chipTitle: filterChipTitle!,
              ),
          if (showCompanyFilterPanel &&
              companyInitValue != null &&
              companyDropDownTitle != null &&
              companyItems != null &&
              companyItems!.isNotEmpty &&
              companyItemLabel != null &&
              companyChipTitle != null) ...[
            const SizedBox(width: 4),
            AppTypeDropDown<CompanyAnalyticsEntity>(
              value: selectedCompany,
              onChanged: onCompanyChanged,
              initialValue: companyInitValue!,
              title: companyDropDownTitle!,
              items: companyItems!,
              itemLabel: companyItemLabel!,
              chipTitle: companyChipTitle!,
            ),
          ],

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showDatePicker) ...[
                const SizedBox(width: AppSpacing.md),
                DatePickerChip(
                  onTap: onDatePickerTap,
                  dateRangeText: dateRangeText,
                  primaryColor: colorScheme.primary,
                  textStyle: theme.textTheme.bodySmall,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class DatePickerChip extends StatelessWidget {
  final VoidCallback? onTap;
  final String? dateRangeText;
  final Color primaryColor;
  final TextStyle? textStyle;

  const DatePickerChip({
    super.key,
    required this.onTap,
    required this.primaryColor,
    this.dateRangeText,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SvgPicture.asset(
        Assets.icons.datePicker.path,
        width: 32,
        height: 32,
        colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn),
      ),
    );
  }
}
