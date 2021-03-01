import 'package:flutter/material.dart';
import 'package:school_sawaari_app/components/custom_surfix_icon.dart';
import 'package:school_sawaari_app/components/default_button.dart';
import 'package:school_sawaari_app/size_config.dart';

class ParentEditProfile extends StatefulWidget {
  static String routeName = "/parent_edit_profile";
  @override
  _ParentEditProfileState createState() => _ParentEditProfileState();
}

class _ParentEditProfileState extends State<ParentEditProfile> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: TextStyle(
            color: Color(0XFF8B8B8B),
          ),
        ),
        elevation: 2,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    SizedBox(height: SizeConfig.screenHeight * 0.03),
                    Text("You can edit your profile here!",style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    buildNameFormField(),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    buildCNICFormField(),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    buildPhoneNumberFormField(),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    buildAddressFormField(),
                    SizedBox(height: getProportionateScreenHeight(40)),
                    DefaultButton(
                      text: "Update",
                      press: () async{
                        // if (_formKey.currentState.validate()) {
                        //   try {
                        //     await FirebaseFirestore.instance.collection('Parents').doc(auth.currentUser.email).set({
                        //       'Name': name,
                        //       'CNIC': cnic,
                        //       'Address': address,
                        //       'PhoneNo': phoneNo,
                        //       'Email': FirebaseAuth.instance.currentUser.email,
                        //     });
                        //     Navigator.pushNamed(context, ParentBottomNavigation.routeName);
                        //   }
                        //   catch (e){
                        //     print(e);
                        //   }
                        // }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  TextFormField buildAddressFormField() {
    return TextFormField(
      keyboardType: TextInputType.streetAddress,
      // onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        // if (value.isNotEmpty) {
        //   removeError(error: kAddressNullError);
        // }
        // address = value;
      },
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Enter your Home address",
        // If  you are using latest version of flutter then label text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
        CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      initialValue: '+92',
      maxLength: 13,
      keyboardType: TextInputType.phone,
      // onSaved: (newValue) => phoneNo = newValue,
      onChanged: (value) {
        // if (value.isNotEmpty) {
        //   removeError(error: kPhoneNumberNullError);
        // }
        // phoneNo = value;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildCNICFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      maxLength: 13,
      // onSaved: (newValue) => cnic = newValue,
      onChanged: (value) {
        // if (value.isNotEmpty) {
        //   removeError(error: kNamelNullError);
        // }
        // cnic = value;
      },
      decoration: InputDecoration(
        labelText: "CNIC",
        hintText: "Enter your CNIC",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
        CustomSurffixIcon(svgIcon: "assets/icons/card.svg"),
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      // onSaved: (newValue) => name = newValue,
      onChanged: (value) {
        // if (value.isNotEmpty) {
        //   removeError(error: kNamelNullError);
        // }
        // name = value;
      },

      decoration: InputDecoration(
        labelText: "Name",
        hintText: "Enter your name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
