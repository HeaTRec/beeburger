import 'dart:convert';
import 'dart:math';
import 'package:country_code_picker/country_code.dart';
import 'package:efood_multivendor/controller/location_controller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:efood_multivendor/controller/auth_controller.dart';
import 'package:efood_multivendor/controller/splash_controller.dart';
import 'package:efood_multivendor/data/model/body/signup_body.dart';
import 'package:efood_multivendor/helper/responsive_helper.dart';
import 'package:efood_multivendor/helper/route_helper.dart';
import 'package:efood_multivendor/util/dimensions.dart';
import 'package:efood_multivendor/util/images.dart';
import 'package:efood_multivendor/util/styles.dart';
import 'package:efood_multivendor/view/base/custom_button.dart';
import 'package:efood_multivendor/view/base/custom_snackbar.dart';
import 'package:efood_multivendor/view/base/custom_text_field.dart';
import 'package:efood_multivendor/view/base/web_menu_bar.dart';
import 'package:efood_multivendor/view/screens/auth/widget/code_picker_widget.dart';
import 'package:efood_multivendor/view/screens/auth/widget/condition_check_box.dart';
import 'package:efood_multivendor/view/screens/auth/widget/guest_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_number/phone_number.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FocusNode _firstNameFocus = FocusNode();
  final FocusNode _lastNameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();
  final FocusNode _referCodeFocus = FocusNode();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _referCodeController = TextEditingController();
  String _countryDialCode="+44";

  Position _currentPosition;
  String _currentAddress;


  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResponsiveHelper.isDesktop(context) ? WebMenuBar() : null,
      body: SafeArea(child: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Container(
              width: context.width > 700 ? 700 : context.width,
              padding: context.width > 700 ? EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT) : null,
              decoration: context.width > 700 ? BoxDecoration(
                color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
                boxShadow: [BoxShadow(color: Colors.grey[Get.isDarkMode ? 700 : 300], blurRadius: 5, spreadRadius: 1)],
              ) : null,
              child: GetBuilder<AuthController>(builder: (authController) {

                return Column(children: [

                  Image.asset(Images.logo, width: 100),
                  SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                  Image.asset(Images.logo_name, width: 100),
                  SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),

                  Text('sign_up'.tr.toUpperCase(), style: robotoBlack.copyWith(fontSize: 30)),
                  SizedBox(height: 50),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
                      color: Theme.of(context).cardColor,
                      boxShadow: [BoxShadow(color: Colors.grey[Get.isDarkMode ? 800 : 200], spreadRadius: 1, blurRadius: 5)],
                    ),
                    child: Column(children: [

                      CustomTextField(
                        hintText: 'first_name'.tr,
                        controller: _firstNameController,
                        focusNode: _firstNameFocus,
                        nextFocus: _lastNameFocus,
                        inputType: TextInputType.name,
                        capitalization: TextCapitalization.words,
                        prefixIcon: Images.user,
                        divider: true,
                      ),

                      CustomTextField(
                        hintText: 'last_name'.tr,
                        controller: _lastNameController,
                        focusNode: _lastNameFocus,
                        nextFocus: _emailFocus,
                        inputType: TextInputType.name,
                        capitalization: TextCapitalization.words,
                        prefixIcon: Images.user,
                        divider: true,
                      ),

                      CustomTextField(
                        hintText: 'email'.tr,
                        controller: _emailController,
                        focusNode: _emailFocus,
                        nextFocus: _phoneFocus,
                        inputType: TextInputType.emailAddress,
                        prefixIcon: Images.mail,
                        divider: true,
                      ),

                      Row(children: [
                       /* CodePickerWidget(
                          onChanged: (CountryCode countryCode) {
                            _countryDialCode = countryCode.dialCode;
                          },
                          initialSelection: CountryCode.fromCountryCode(Get.find<SplashController>().configModel.country).code,
                          favorite: [CountryCode.fromCountryCode(Get.find<SplashController>().configModel.country).code],
                          showDropDownButton: true,
                          padding: EdgeInsets.zero,
                          showFlagMain: true,
                          dialogBackgroundColor: Theme.of(context).cardColor,
                          textStyle: robotoRegular.copyWith(
                            fontSize: Dimensions.fontSizeLarge, color: Theme.of(context).textTheme.bodyLarge.color,
                          ),
                        ),*/
                        Image.asset(Images.uk, width: 30,).paddingOnly(left:8,top:0,right:0,bottom:0),

                        Expanded(child: CustomTextField(
                          hintText: 'phone'.tr,
                          controller: _phoneController,
                          focusNode: _phoneFocus,
                          nextFocus: _passwordFocus,
                          inputType: TextInputType.phone,
                          divider: false,
                        )),
                      ]),
                      Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE), child: Divider(height: 1)),

                      CustomTextField(
                        hintText: 'password'.tr,
                        controller: _passwordController,
                        focusNode: _passwordFocus,
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
                        inputType: TextInputType.visiblePassword,
                        prefixIcon: Images.lock,
                        isPassword: true,
                        onSubmit: (text) => (GetPlatform.isWeb && authController.acceptTerms) ? _register(authController, _countryDialCode) : null,
                      ),



                    ]),
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                  ConditionCheckBox(authController: authController),
                  SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                  !authController.isLoading ? Row(children: [
                    Expanded(child: CustomButton(
                      buttonText: 'sign_in'.tr,
                      transparent: true,
                      onPressed: () =>Get.toNamed(RouteHelper.getSignInRoute(RouteHelper.signUp)),
                    )),
                    Expanded(child: CustomButton(
                      buttonText: 'sign_up'.tr,
                      onPressed: authController.acceptTerms ? () => _register(authController, _countryDialCode) : null,
                    )),
                  ]) : Center(child: CircularProgressIndicator()),
                  SizedBox(height: 30),

                  // SocialLoginWidget(),

                 /* GuestButton(),*/

                ]);
              }),
            ),
          ),
        ),
      )),
    );
  }

  _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, show an error dialog
      showCustomSnackBar('Location services are disabled.'.tr);
      return;
    }

    // Check for permission to access location
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, show an error dialog
        showCustomSnackBar('Location permissions are denied'.tr);
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are permanently denied, show an error dialog
      showCustomSnackBar('Location permissions are permanently denied, we cannot request permissions.'.tr);
      return;
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = position;
    });
    await _getAddressFromLatLng();
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks =
      await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);
      if (placemarks != null && placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        setState(() {
          _currentAddress =
          "${placemark.street}, ${placemark.locality}, ${placemark.country}";
        });
      }
    } catch (e) {
      print(e);
    }
  }


  void _register(AuthController authController, String countryCode) async {
    String _firstName = _firstNameController.text.trim();
    String _lastName = _lastNameController.text.trim();
    String _email = _emailController.text.trim();
    String _number = _phoneController.text.trim();
    String _password = _passwordController.text.trim();
    String _confirmPassword = _confirmPasswordController.text.trim();

    String _numberWithCountryCode = _number;


    if (_firstName.isEmpty) {
      showCustomSnackBar('enter_your_first_name'.tr);
    }else if (_lastName.isEmpty) {
      showCustomSnackBar('enter_your_last_name'.tr);
    }else if (_email.isEmpty) {
      showCustomSnackBar('enter_email_address'.tr);
    }else if (!GetUtils.isEmail(_email)) {
      showCustomSnackBar('enter_a_valid_email_address'.tr);
    }else if (_number.isEmpty) {
      showCustomSnackBar('enter_phone_number'.tr);
    }else if (_password.isEmpty) {
      showCustomSnackBar('enter_password'.tr);
    }else if (_password.length < 6) {
      showCustomSnackBar('password_should_be'.tr);
    }else if (_password != _confirmPassword) {
      showCustomSnackBar('confirm_password_does_not_matched'.tr);
    }else {

      String lati= "0.00";
      String longi= "0.00";

      if (_currentPosition != null) {
          lati=_currentPosition.latitude.toString();
          longi=_currentPosition.longitude.toString();
      }


      if (_currentAddress == null){
        _currentAddress = "address";
      }

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


      SignUpBody signUpBody = SignUpBody(
        firstName: _firstName, lastName: _lastName, email: _email, password: _password, phoneNo: _numberWithCountryCode,
        address: _currentAddress,latitude: lati,longitude: longi,deviceType: deviceType,deviceToken: device_token_rndm,title: "users"
      );
      authController.registration(signUpBody).then((status) async {
        if (status.statusCode==200) {

          showCustomSnackBar(status.data.otp.toString());
          Get.toNamed(RouteHelper.getVerificationRoute(_numberWithCountryCode, '', RouteHelper.forgotPassword, status.data.otp.toString()));
         /* if(Get.find<SplashController>().configModel.customerVerification) {
            List<int> _encoded = utf8.encode(_password);
            String _data = base64Encode(_encoded);
            Get.toNamed(RouteHelper.getVerificationRoute(_numberWithCountryCode, status.message, RouteHelper.signUp, _data));
          }else {
            Get.toNamed(RouteHelper.getAccessLocationRoute(RouteHelper.signUp));
          }*/
        }else {
          showCustomSnackBar(' ${status.message}'.tr);
        }
      });
    }
  }

  String getRandomAlphaNumeric(int length) {
    var r = Random();
    const chars = "abcdefghijklmnopqrstuvwxyz0123456789";
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(r.nextInt(chars.length))));
  }
}
