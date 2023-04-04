import 'package:efood_multivendor/controller/auth_controller.dart';
import 'package:efood_multivendor/controller/user_controller.dart';
import 'package:efood_multivendor/data/model/response/userinfo_model.dart';
import 'package:efood_multivendor/helper/route_helper.dart';
import 'package:efood_multivendor/util/dimensions.dart';
import 'package:efood_multivendor/util/images.dart';
import 'package:efood_multivendor/util/styles.dart';
import 'package:efood_multivendor/view/base/custom_app_bar.dart';
import 'package:efood_multivendor/view/base/custom_button.dart';
import 'package:efood_multivendor/view/base/custom_snackbar.dart';
import 'package:efood_multivendor/view/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

class NewPassScreen extends StatefulWidget {
  final String resetToken;
  final String number;
  final bool fromPasswordChange;
  NewPassScreen({@required this.resetToken, @required this.number, @required this.fromPasswordChange});

  @override
  State<NewPassScreen> createState() => _NewPassScreenState();
}

class _NewPassScreenState extends State<NewPassScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final FocusNode _newPasswordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.fromPasswordChange ? 'change_password'.tr : 'reset_password'.tr),
      body: SafeArea(child: Center(child: Scrollbar(child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
        child: Center(child: Container(
          width: context.width > 700 ? 700 : context.width,
          padding: context.width > 700 ? EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT) : null,
          decoration: context.width > 700 ? BoxDecoration(
            color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
            boxShadow: [BoxShadow(color: Colors.grey[Get.isDarkMode ? 700 : 300], blurRadius: 5, spreadRadius: 1)],
          ) : null,
          child: Column(children: [

            Text('enter_new_password'.tr, style: robotoRegular, textAlign: TextAlign.center),
            SizedBox(height: 50),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
                color: Theme.of(context).cardColor,
                boxShadow: [BoxShadow(color: Colors.grey[Get.isDarkMode ? 800 : 200], spreadRadius: 1, blurRadius: 5)],
              ),
              child: Column(children: [

                CustomTextField(
                  hintText: 'new_password'.tr,
                  controller: _newPasswordController,
                  focusNode: _newPasswordFocus,
                  nextFocus: _confirmPasswordFocus,
                  inputType: TextInputType.visiblePassword,
                  prefixIcon: Images.lock,
                  isPassword: true,
                  divider: true,
                ),

                CustomTextField(
                  hintText: 'confirm_password'.tr,
                  controller: _confirmPasswordController,
                  focusNode: _confirmPasswordFocus,
                  inputAction: TextInputAction.done,
                  inputType: TextInputType.visiblePassword,
                  prefixIcon: Images.lock,
                  isPassword: true,
                  onSubmit: (text) => GetPlatform.isWeb ? _resetPassword() : null,
                ),

              ]),
            ),
            SizedBox(height: 30),

            GetBuilder<UserController>(builder: (userController) {
              return GetBuilder<AuthController>(builder: (authBuilder) {
                return (!authBuilder.isLoading && !userController.isLoading) ? CustomButton(
                  buttonText: 'done'.tr,
                  onPressed: () => _resetPassword(),
                ) : Center(child: CircularProgressIndicator());
              });
            }),

          ]),
        )),
      )))),
    );
  }

  void _resetPassword() {
    String _password = _newPasswordController.text.trim();
    String _confirmPassword = _confirmPasswordController.text.trim();
    if (_password.isEmpty) {
      showCustomSnackBar('enter_password'.tr);
    }else if (_password.length < 6) {
      showCustomSnackBar('password_should_be'.tr);
    }else if(_password != _confirmPassword) {
      showCustomSnackBar('confirm_password_does_not_matched'.tr);
    }else {
      if(widget.fromPasswordChange) {
        UserInfoModel _user = Get.find<UserController>().userInfoModel;
        _user.password = _password;
        Get.find<UserController>().changePassword(_user).then((response) {
          if(response.isSuccess) {
            showCustomSnackBar('password_updated_successfully'.tr, isError: false);
          }else {
            showCustomSnackBar(response.message);
          }
        });
      }else {
        Get.find<AuthController>().resetPassword( widget.number.trim(), _password).then((value) {
          if (value.statusCode==200) {
            final device_token_rndm = getRandomAlphaNumeric(10);

            var deviceType ="";
            if(GetPlatform.isAndroid){
              deviceType="Android";
            }
            else if(GetPlatform.isIOS){
              deviceType="IOS";
            }
            else if(GetPlatform.isWeb){
              deviceType="Web";
            }
            Get.find<AuthController>().login('+44', widget.number.trim(), _password,device_token_rndm,deviceType).then((value) async {
              Get.offAllNamed(RouteHelper.getAccessLocationRoute('reset-password'));
            });
          } else {
            showCustomSnackBar(value.message);
          }
        });
      }
    }
  }

  String getRandomAlphaNumeric(int length) {
    var r = Random();
    const chars = "abcdefghijklmnopqrstuvwxyz0123456789";
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(r.nextInt(chars.length))));
  }
}
