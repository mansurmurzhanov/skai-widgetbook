import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:skai_widgetbook/core/theme/app_colors.dart';
import 'package:skai_widgetbook/core/theme/app_spacing.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final TextStyle? labelStyle;
  final String? errorText;
  final bool isRequired;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function(String)? onSubmit;
  final int? maxLength;
  final bool? enabled;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? minLines;
  final List<TextInputFormatter>? inputFormatters;
  final bool? isDense;
  final bool? filled;
  final Color? fillColor;
  final Widget? suffix;
  final bool? isCollapsed;
  final FocusNode? focusNode;
  final String? obscureText;
  final bool? obscurePassword;
  final TextAlign textAlign;
  final InputBorder? inputBorder;
  final double? borderRadius;
  final double? contentPadding;
  final bool? autofocus;
  final TextCapitalization textCapitalization;
  final Function(String)? onChanged;
  final Function()? onTap;
  final bool? readOnly;

  const AppTextField({
    super.key,
    this.controller,
    this.label,
    this.isRequired = false,
    this.suffixIcon,
    this.prefixIcon,
    this.onSubmit,
    this.hintText,
    this.maxLength,
    this.enabled,
    this.errorText,
    this.keyboardType,
    this.maxLines = 1,
    this.textAlign = TextAlign.start,
    this.minLines = 1,
    this.inputFormatters,
    this.isDense = false,
    this.labelStyle,
    this.filled,
    this.fillColor,
    this.suffix,
    this.isCollapsed,
    this.focusNode,
    this.inputBorder,
    this.borderRadius,
    this.obscureText,
    this.obscurePassword,
    this.contentPadding,
    this.autofocus = false,
    this.textCapitalization = TextCapitalization.none,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
  });

  static final MaskTextInputFormatter _phoneMask = MaskTextInputFormatter(
    mask: '+# (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    initialText: '7',
    type: MaskAutoCompletionType.lazy,
  );

  static final MaskTextInputFormatter _dateMask = MaskTextInputFormatter(
    mask: '##.##.####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    final textStyle = theme.textTheme.bodyLarge!;
    final radius = borderRadius ?? AppSpacing.radiusMd;

    bool isError = errorText != null;
    bool isDisabled = enabled == false;

    Color borderColor = isError
        ? colorScheme.error
        : isDark
        ? AppColors.darkBorder
        : AppColors.lightBorder;

    Color textColor = isError
        ? colorScheme.error
        : isDisabled
        ? (isDark
              ? AppColors.darkMutedForeground
              : AppColors.lightMutedForeground)
        : (isDark ? AppColors.darkForeground : AppColors.lightForeground);

    Color iconColor = isError
        ? colorScheme.error
        : isDisabled
        ? (isDark
              ? AppColors.darkMutedForeground
              : AppColors.lightMutedForeground)
        : (isDark ? AppColors.darkAccent : AppColors.primary);

    OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: borderColor, width: 1),
    );

    OutlineInputBorder focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(
        color: isError
            ? colorScheme.error
            : (isDark ? AppColors.darkRing : AppColors.lightRing),
        width: 2,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          AppFieldLabel(
            label: label!,
            isRequired: isRequired,
            style: labelStyle,
          ),
          const SizedBox(height: 8),
        ],
        TextField(
          textAlign: textAlign,
          keyboardType: keyboardType,
          enabled: enabled,
          onSubmitted: onSubmit,
          controller: controller,
          maxLength: maxLength,
          obscureText:
              obscurePassword ??
              (obscureText != null && obscureText!.isNotEmpty),
          obscuringCharacter: obscureText ?? '*',
          style: textStyle.copyWith(
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
          inputFormatters: inputFormatters,
          maxLines: maxLines,
          minLines: minLines,
          focusNode: focusNode,
          autofocus: autofocus ?? false,
          textCapitalization: textCapitalization,
          onChanged: onChanged,
          onTap: onTap,
          readOnly: readOnly ?? false,
          decoration: InputDecoration(
            suffixIconColor: iconColor,
            prefixIconColor: iconColor,
            errorStyle: textStyle.copyWith(
              color: colorScheme.error,
              fontWeight: FontWeight.w400,
            ),
            errorMaxLines: 3,
            errorBorder: border,
            suffix: suffix,
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 16, right: 12),
                    child: prefixIcon,
                  )
                : null,
            suffixIcon: suffixIcon,
            prefixIconConstraints: const BoxConstraints(
              minWidth: 36,
              minHeight: 28,
            ),
            suffixIconConstraints: const BoxConstraints(
              minWidth: 28,
              minHeight: 28,
            ),
            filled: filled ?? true,
            fillColor:
                fillColor ??
                (isDisabled
                    ? (isDark ? AppColors.darkMuted : AppColors.lightMuted)
                    : (isDark
                          ? colorScheme.surfaceContainer
                          : AppColors.lightMuted)),
            hintText: hintText,
            errorText: errorText,
            hintStyle: textStyle.copyWith(
              color: isDark
                  ? AppColors.darkMutedForeground
                  : AppColors.lightMutedForeground,
              fontWeight: FontWeight.w500,
            ),
            isDense: isDense,
            isCollapsed: isCollapsed,
            contentPadding: EdgeInsets.all(contentPadding ?? 16),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide.none,
            ),
            enabledBorder: inputBorder ?? border,
            focusedBorder: inputBorder ?? focusedBorder,
            focusedErrorBorder: inputBorder ?? focusedBorder,
            border: inputBorder ?? border,
          ),
        ),
      ],
    );
  }

  factory AppTextField.description({
    Key? key,
    TextEditingController? controller,
    String? label,
    String? hintText,
    String? errorText,
    bool isRequired = false,
    Widget? suffixIcon,
    Widget? prefixIcon,
    Function(String)? onSubmit,
    int? maxLength,
    int? maxLines = 4,
    bool? enabled,
    bool? isDense = false,
    bool? isCollapsed = false,
    TextStyle? hintStyle,
    TextStyle? textStyle,
    bool? filled,
    Color? fillColor,
    FocusNode? focusNode,
    double? contentPadding,
    double? borderRadius,
    Function(String)? onChanged,
    Function()? onTap,
    bool? readOnly,
  }) {
    return AppTextField(
      key: key,
      controller: controller,
      label: label,
      hintText: hintText,
      errorText: errorText,
      isRequired: isRequired,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      onSubmit: onSubmit,
      maxLength: maxLength,
      maxLines: maxLines,
      enabled: enabled,
      minLines: maxLines,
      isDense: isDense,
      filled: filled,
      fillColor: fillColor,
      contentPadding: contentPadding,
      borderRadius: borderRadius,
      focusNode: focusNode,
      onChanged: onChanged,
      onTap: onTap,
      readOnly: readOnly,
    );
  }

  factory AppTextField.email({
    Key? key,
    TextEditingController? controller,
    String? label,
    String? hintText,
    String? errorText,
    bool isRequired = false,
    Widget? suffixIcon,
    Widget? prefixIcon,
    Function(String)? onSubmit,
    int? maxLength,
    bool? enabled,
    bool? isDense = false,
    bool? isCollapsed = false,
    TextStyle? hintStyle,
    TextStyle? textStyle,
    bool? filled,
    Color? fillColor,
    FocusNode? focusNode,
    double? contentPadding,
    double? borderRadius,
    Function(String)? onChanged,
    Function()? onTap,
    bool? readOnly,
  }) {
    return AppTextField(
      key: key,
      controller: controller,
      label: label,
      hintText: hintText,
      errorText: errorText,
      isRequired: isRequired,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      onSubmit: onSubmit,
      keyboardType: TextInputType.emailAddress,
      enabled: enabled,
      filled: filled,
      fillColor: fillColor,
      isCollapsed: isCollapsed,
      isDense: isDense,
      focusNode: focusNode,
      contentPadding: contentPadding,
      borderRadius: borderRadius,
      onChanged: onChanged,
      onTap: onTap,
      readOnly: readOnly,
    );
  }

  factory AppTextField.number({
    Key? key,
    TextEditingController? controller,
    String? label,
    String? hintText,
    String? errorText,
    bool isRequired = false,
    Widget? suffixIcon,
    Widget? prefixIcon,
    Function(String)? onSubmit,
    int? maxLength,
    bool? enabled,
    bool? isDense = true,
    bool? isCollapsed = false,
    TextStyle? hintStyle,
    TextStyle? textStyle,
    bool? filled,
    Color? fillColor,
    FocusNode? focusNode,
    InputBorder? inputBorder,
    List<TextInputFormatter>? inputFormatters,
    TextAlign textAlign = TextAlign.start,
    double? contentPadding,
    double? borderRadius,
    Function(String)? onChanged,
    Function()? onTap,
    bool? readOnly,
  }) {
    return AppTextField(
      key: key,
      controller: controller,
      label: label,
      hintText: hintText,
      errorText: errorText,
      isRequired: isRequired,
      suffixIcon: suffixIcon,
      textAlign: textAlign,
      prefixIcon: prefixIcon,
      onSubmit: onSubmit,
      keyboardType: TextInputType.number,
      enabled: enabled,
      maxLength: maxLength,
      inputFormatters:
          inputFormatters ?? [FilteringTextInputFormatter.digitsOnly],
      filled: filled,
      isCollapsed: isCollapsed,
      isDense: isDense,
      fillColor: fillColor,
      focusNode: focusNode,
      inputBorder: inputBorder,
      contentPadding: contentPadding,
      borderRadius: borderRadius,
      onChanged: onChanged,
      onTap: onTap,
      readOnly: readOnly,
    );
  }

  factory AppTextField.phone({
    Key? key,
    TextEditingController? controller,
    String? label,
    String? hintText,
    String? errorText,
    bool isRequired = false,
    Widget? suffixIcon,
    Widget? prefixIcon,
    Function(String)? onSubmit,
    bool? enabled,
    bool? isDense = false,
    bool? isCollapsed = false,
    TextStyle? hintStyle,
    TextStyle? textStyle,
    bool? filled,
    Color? fillColor,
    FocusNode? focusNode,
    double? contentPadding,
    double? borderRadius,
    Function(String)? onChanged,
    Function()? onTap,
    bool? readOnly,
  }) {
    return AppTextField(
      key: key,
      controller: controller,
      label: label,
      hintText: hintText,
      errorText: errorText,
      isRequired: isRequired,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      onSubmit: onSubmit,
      keyboardType: TextInputType.phone,
      enabled: enabled,
      inputFormatters: [_phoneMask],
      filled: filled,
      isCollapsed: isCollapsed,
      isDense: isDense,
      fillColor: fillColor,
      focusNode: focusNode,
      contentPadding: contentPadding,
      borderRadius: borderRadius,
      onChanged: onChanged,
      onTap: onTap,
      readOnly: readOnly,
    );
  }

  factory AppTextField.date({
    Key? key,
    TextEditingController? controller,
    String? label,
    String? hintText,
    String? errorText,
    bool isRequired = false,
    Widget? suffixIcon,
    Widget? prefixIcon,
    Function(String)? onSubmit,
    bool? enabled,
    bool? isDense = false,
    bool? isCollapsed = false,
    TextStyle? hintStyle,
    TextStyle? textStyle,
    bool? filled,
    Color? fillColor,
    FocusNode? focusNode,
    double? contentPadding,
    double? borderRadius,
    Function(String)? onChanged,
    Function()? onTap,
    bool? readOnly,
  }) {
    return AppTextField(
      key: key,
      controller: controller,
      label: label,
      hintText: hintText,
      errorText: errorText,
      isRequired: isRequired,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      onSubmit: onSubmit,
      keyboardType: TextInputType.phone,
      enabled: enabled,
      inputFormatters: [_dateMask],
      filled: filled,
      isCollapsed: isCollapsed,
      isDense: isDense,
      fillColor: fillColor,
      focusNode: focusNode,
      contentPadding: contentPadding,
      borderRadius: borderRadius,
      onChanged: onChanged,
      onTap: onTap,
      readOnly: readOnly,
    );
  }

  factory AppTextField.password({
    Key? key,
    TextEditingController? controller,
    String? label,
    String? hintText,
    String? errorText,
    bool isRequired = false,
    Widget? suffixIcon,
    Widget? prefixIcon,
    Function(String)? onSubmit,
    int? maxLength,
    bool? enabled,
    bool? isDense = false,
    bool? isCollapsed = false,
    TextStyle? hintStyle,
    TextStyle? textStyle,
    bool? filled,
    Color? fillColor,
    FocusNode? focusNode,
    String obscureText = '*',
    bool? obscurePassword,
    double? contentPadding,
    double? borderRadius,
    Function(String)? onChanged,
    Function()? onTap,
    bool? readOnly,
  }) {
    return AppTextField(
      key: key,
      controller: controller,
      label: label,
      hintText: hintText,
      errorText: errorText,
      isRequired: isRequired,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      onSubmit: onSubmit,
      maxLength: maxLength,
      enabled: enabled,
      filled: filled,
      fillColor: fillColor,
      isCollapsed: isCollapsed,
      isDense: isDense,
      focusNode: focusNode,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      obscurePassword: obscurePassword,
      contentPadding: contentPadding,
      borderRadius: borderRadius,
      onChanged: onChanged,
      onTap: onTap,
      readOnly: readOnly,
    );
  }
}

class AppPasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final TextStyle? labelStyle;
  final String? errorText;
  final bool isRequired;
  final Widget? hideIcon;
  final Widget? showIcon;
  final Widget? prefixIcon;
  final Function(String)? onSubmit;
  final int? maxLength;
  final bool? enabled;
  final bool? isDense;
  final bool? isCollapsed;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final bool? filled;
  final Color? fillColor;
  final FocusNode? focusNode;
  final double? contentPadding;
  final double? borderRadius;
  final Function(String)? onChanged;
  final Function()? onTap;
  final bool? readOnly;

  const AppPasswordField({
    super.key,
    this.controller,
    this.label,
    this.hintText,
    this.labelStyle,
    this.errorText,
    this.isRequired = false,
    this.hideIcon,
    this.showIcon,
    this.prefixIcon,
    this.onSubmit,
    this.maxLength,
    this.enabled,
    this.isDense = false,
    this.hintStyle,
    this.textStyle,
    this.filled,
    this.fillColor,
    this.isCollapsed = false,
    this.focusNode,
    this.contentPadding,
    this.borderRadius,
    this.onChanged,
    this.onTap,
    this.readOnly,
  });

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool _isObscured = true;

  void _toggleObscure() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final hideIcon =
        widget.hideIcon ??
        Icon(
          Icons.visibility_off_outlined,
          color: isDark
              ? AppColors.darkMutedForeground
              : AppColors.lightMutedForeground,
        );

    final showIcon =
        widget.showIcon ??
        Icon(
          Icons.visibility_outlined,
          color: isDark
              ? AppColors.darkMutedForeground
              : AppColors.lightMutedForeground,
        );

    return AppTextField.password(
      key: widget.key,
      controller: widget.controller,
      label: widget.label,
      hintText: widget.hintText,
      errorText: widget.errorText,
      isRequired: widget.isRequired,
      suffixIcon: InkWell(
        onTap: _toggleObscure,
        splashColor: AppColors.transparent,
        highlightColor: AppColors.transparent,
        hoverColor: AppColors.transparent,
        child: _isObscured ? hideIcon : showIcon,
      ),
      obscurePassword: _isObscured,
      prefixIcon: widget.prefixIcon,
      onSubmit: widget.onSubmit,
      maxLength: widget.maxLength,
      enabled: widget.enabled,
      isDense: widget.isDense,
      isCollapsed: widget.isCollapsed,
      hintStyle: widget.hintStyle,
      textStyle: widget.textStyle,
      filled: widget.filled,
      fillColor: widget.fillColor,
      focusNode: widget.focusNode,
      contentPadding: widget.contentPadding,
      borderRadius: widget.borderRadius,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      readOnly: widget.readOnly,
    );
  }
}

class AppFieldLabel extends StatelessWidget {
  final String label;
  final bool isRequired;
  final TextStyle? style;

  const AppFieldLabel({
    super.key,
    required this.label,
    this.isRequired = false,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final textStyle =
        style ??
        theme.textTheme.bodyMedium!.copyWith(
          color: isDark ? AppColors.darkForeground : AppColors.lightForeground,
          fontWeight: FontWeight.w100,
        );

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: label, style: textStyle),
          if (isRequired)
            TextSpan(
              text: ' *',
              style: textStyle.copyWith(color: theme.colorScheme.error),
            ),
        ],
      ),
    );
  }
}
