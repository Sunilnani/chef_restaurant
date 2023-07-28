import 'package:cheff_restaurant/utils/color_styles.dart';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatelessWidget {
  final String? title;
  final String? hintText;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final IconData? suffixIcon;
  final bool? readOnly;
  final GestureTapCallback? suffixIconOnTap;
  final String? Function(String?)? validator;
  final Color? color;
  final Color? focusColor;
  final Color? fillColor;
  final Color? borderColor;
  final Color? textColor;
  final TextEditingController? controller;
  final bool? enabled;
  final TextInputType? textInputType;
  final bool? obscureText;
  final Function(dynamic)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsets? inputDecorationPadding;
  final Decoration? decoration;
  final int? maxLines;
  final Icon? suffix;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;

  const AppTextFormField({
    Key? key,
    this.focusNode,
    this.textInputAction,
    this.title,
    this.decoration,
    this.hintText,
    this.suffixIcon,
    this.readOnly,
    this.suffixIconOnTap,
    this.validator,
    this.color,
    this.focusColor,
    this.controller,
    this.enabled,
    this.textInputType,
    this.inputFormatters,
    this.borderColor,
    this.fillColor,
    this.obscureText,
    this.onChanged,
    this.textColor,
    this.inputDecorationPadding,
    this.maxLines,
    this.suffix,
    this.hintStyle,
    this.labelStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: fillColor ?? Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              controller: controller,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              inputFormatters: inputFormatters ?? [],
              validator: validator,
              keyboardType: textInputType ?? TextInputType.text,
              decoration: InputDecoration(
                suffixIcon: suffix,
                hintStyle:
                hintStyle ?? TextStyle(fontSize: 14, color: Colors.black),
                labelText: title,
                labelStyle:
                labelStyle ?? TextStyle(fontSize: 12, color: Colors.grey),
                hintText: hintText ?? title,
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(20, 10, 24, 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppTextFormFieldTitled extends StatelessWidget {
  final String? title;
  final String? hintText;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final GestureTapCallback? suffixIconOnTap;
  final String? Function(String?)? validator;
  final Color? color;
  final Color? focusColor;
  final Color? fillColor;
  final Color? borderColor;
  final TextEditingController? controller;
  final bool? enabled;
  final TextInputType? textInputType;
  final bool? obscureText;
  final Function(dynamic)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsets? inputDecorationPadding;
  final ImageIcon? imageIcon;

  const AppTextFormFieldTitled(
      {Key? key,
        this.title,
        this.hintText,
        this.suffixIcon,
        this.prefixIcon,
        this.suffixIconOnTap,
        this.validator,
        this.color,
        this.focusColor,
        this.controller,
        this.enabled,
        this.textInputType,
        this.inputFormatters,
        this.borderColor,
        this.fillColor,
        this.obscureText,
        this.onChanged,
        this.inputDecorationPadding,
        this.imageIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (title != null)
              Text(
                title ?? "",
                style: TextStyle(
                    color: color ?? ThemeConfig.blackColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              ),
            if (title != null)
              const SizedBox(
                height: 10,
              ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                onChanged: onChanged,
                obscureText: obscureText ?? false,
                inputFormatters: inputFormatters ?? [],
                keyboardType: textInputType ?? TextInputType.text,
                enabled: enabled ?? true,
                controller: controller,
                validator: validator,
                cursorColor: focusColor ?? Colors.black,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  contentPadding: inputDecorationPadding ??
                      EdgeInsets.symmetric(vertical: 8, horizontal: 16),

                  prefixIcon: prefixIcon != null
                      ? IconButton(
                    icon: Icon(
                      prefixIcon,
                      color: color ?? ThemeConfig.secondaryColor,
                    ),
                    onPressed: suffixIconOnTap ?? null,
                  )
                      : null,

                  // suffixIcon: imageIcon != null
                  //     ? InkWell(
                  //     onTap:suffixIconOnTap ,
                  //     child: imageIcon)
                  //     : null,

                  suffixIcon: suffixIcon != null
                      ? IconButton(
                    icon: Icon(
                      suffixIcon,
                      color: color ?? Colors.black,
                    ),
                    onPressed: suffixIconOnTap ?? null,
                  )
                      : null,
                  suffixIconColor: color ?? Colors.black,
                  border: InputBorder.none,
                  hintText: hintText ?? title,
                  filled: true,
                  fillColor: fillColor ?? Colors.grey.withOpacity(0.1),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.error)),
                  disabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: borderColor ?? Colors.transparent)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.error)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: borderColor ?? Colors.transparent)),

                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: focusColor ?? Colors.black,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MandetoryTextFormFieldTitled extends StatelessWidget {
  final String? title;
  final String? hintText;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final GestureTapCallback? suffixIconOnTap;
  final String? Function(String?)? validator;
  final Color? color;
  final Color? focusColor;
  final Color? fillColor;
  final Color? borderColor;
  final TextEditingController? controller;
  final bool? enabled;
  final TextInputType? textInputType;
  final bool? obscureText;
  final Function(dynamic)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsets? inputDecorationPadding;
  final bool? readOnly;
  final String? suffixImage;
  final ImageIcon? imageIcon;
  final TextStyle? hintStyle;

  const MandetoryTextFormFieldTitled(
      {Key? key,
        this.title,
        this.hintText,
        this.suffixIcon,
        this.prefixIcon,
        this.suffixIconOnTap,
        this.validator,
        this.color,
        this.focusColor,
        this.controller,
        this.enabled,
        this.textInputType,
        this.inputFormatters,
        this.borderColor,
        this.fillColor,
        this.obscureText,
        this.onChanged,
        this.inputDecorationPadding,
        this.readOnly,
        this.suffixImage,
        this.imageIcon,
        this.hintStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14),
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (title != null)
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: title ?? "",
                      style: TextStyle(
                        color: color ?? Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.04,
                      ),
                    ),
                    TextSpan(
                      text: "*",
                      style: TextStyle(
                        color: ColorConstant.red700,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.04,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),

            // if(title!=null)Text(
            //   "${title}" ?? "",
            //   style: TextStyle(
            //       color: color ?? Colors.black,
            //       fontWeight: FontWeight.w500,
            //       fontSize: 12),
            // ),
            if (title != null)
              const SizedBox(
                height: 10,
              ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                readOnly: readOnly ?? false,
                onChanged: onChanged,
                obscureText: obscureText ?? false,
                inputFormatters: inputFormatters ?? [],
                keyboardType: textInputType ?? TextInputType.text,
                enabled: enabled ?? true,
                controller: controller,
                validator: validator,
                cursorColor: focusColor ?? Colors.black,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  contentPadding: inputDecorationPadding ??
                      EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  prefixIcon: prefixIcon != null
                      ? IconButton(
                    icon: Icon(
                      prefixIcon,
                      color: color ?? ThemeConfig.primaryColor,
                    ),
                    onPressed: suffixIconOnTap ?? null,
                  )
                      : null,
                  suffixIcon: imageIcon != null
                      ? InkWell(onTap: suffixIconOnTap, child: imageIcon)
                      : null,
                  suffixIconColor: color ?? Colors.black,
                  border: InputBorder.none,
                  hintText: hintText ?? title,
                  hintStyle: hintStyle,
                  filled: true,
                  fillColor: fillColor ?? Colors.grey.withOpacity(0.1),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.error)),
                  disabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: borderColor ?? Colors.transparent)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.error)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: borderColor ?? Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: focusColor ?? Colors.black,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeedbackInput extends StatelessWidget {
  const FeedbackInput({
    this.controller,
    super.key,
  });
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: ThemeConfig.primary.withOpacity(0.1)),
        color: ThemeConfig.whiteColor,
      ),
      child: TextField(
        controller: controller,
        maxLines: 10,
        decoration: const InputDecoration.collapsed(
          hintText: "Write Feedback",
        ),
        style: ThemeConfig.darkGrey12medium,
        keyboardType: TextInputType.multiline,
        textCapitalization: TextCapitalization.sentences,
      ),
    );
  }
}


class CommentTextFormField extends StatelessWidget {
  const CommentTextFormField({
    Key? key,
    this.title,
    this.hintText,
    this.suffixIcon,
    this.suffixIconOnTap,
    this.validator,
    this.color,
    this.focusColor,
    this.controller,
    this.enabled,
    this.textInputType,
    this.inputFormatters,
    this.borderColor,
    this.fillColor,
    this.obscureText,
    this.onChanged,
    this.textColor,
    this.inputDecorationPadding,
    this.maxLines,
  }) : super(key: key);

  final String ?title;
  final String ?hintText;
  final IconData? suffixIcon;
  final GestureTapCallback? suffixIconOnTap;
  final String? Function(String?)? validator;
  final Color? color;
  final Color? focusColor;
  final Color? fillColor;
  final Color? borderColor;
  final Color? textColor;
  final TextEditingController ?controller;
  final bool ?enabled;
  final TextInputType ?textInputType;
  final bool ?obscureText;
  final Function(dynamic) ?onChanged;
  final List<TextInputFormatter> ?inputFormatters;
  final EdgeInsets? inputDecorationPadding;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(title!=null)Text(
            title ?? "",
            style: TextStyle(
                color: color ??  Theme.of(context).primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 16),
          ),
          if(title!=null) const SizedBox(
            height: 20,
          ),
          TextFormField(
            maxLines: maxLines ?? 1,
            onChanged: onChanged,
            obscureText: obscureText ?? false,
            inputFormatters: inputFormatters ?? [],
            keyboardType: textInputType ?? TextInputType.text,
            enabled: enabled ?? true,
            controller: controller,
            validator: validator,
            cursorColor: focusColor ?? Theme.of(context).primaryColor,
            style: TextStyle(fontSize: 14, color: textColor ?? ThemeConfig.blackColor),
            decoration: InputDecoration(
              contentPadding:
              inputDecorationPadding ?? const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
              suffixIcon: suffixIcon != null
                  ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: Icon(suffixIcon,
                      color: color??  Theme.of(context).primaryColor),
                  onPressed: suffixIconOnTap,
                ),
              )
                  : null,
              suffixIconColor: color ??  Theme.of(context).primaryColor,
              hintText: hintText ?? title,
              filled: true,
              fillColor: fillColor ?? ThemeConfig.whiteColor.withOpacity(0.2),
              errorBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(ThemeConfig.borderRadius),
                  borderSide: BorderSide(color:Theme.of(context).errorColor)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(ThemeConfig.borderRadius),
                  borderSide: BorderSide(color: borderColor ?? Colors.transparent)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(ThemeConfig.borderRadius),
                  borderSide: BorderSide(color:Theme.of(context).errorColor)),
              enabledBorder: OutlineInputBorder(

                  borderRadius: BorderRadius.circular(ThemeConfig.roundBorderRadius),
                  borderSide: BorderSide(color: borderColor ?? Theme.of(context).shadowColor.withOpacity(0.1))),

              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(ThemeConfig.roundBorderRadius),
                  borderSide: BorderSide(color: focusColor ??  Theme.of(context).primaryColor)),
            ),
          ),
        ],
      ),

    );
  }
}
