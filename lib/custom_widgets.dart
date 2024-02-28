import 'package:flutter/material.dart';
import 'package:slot_seek/app_colors.dart';

class PrimaryElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const PrimaryElevatedButton({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        textStyle: const TextStyle(fontSize: 20, fontFamily: "Gabriela"),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(20), // Adjust the border radius as needed
        ),
      ),
      child: Text(text),
    );
  }
}



class BackButtonWidget extends StatelessWidget {
  final BuildContext context;

  const BackButtonWidget({required this.context, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      child: IconButton(
        icon: const Icon(Icons.arrow_back),
        color: AppColors.primaryColor,
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}



class CustomTextFormField extends StatelessWidget {
  final String labelText;
  

  const CustomTextFormField({
    Key? key,
    required this.labelText,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.secondaryColor,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          color: AppColors.greyMedium,
          fontSize: 18,
          fontFamily: 'Gabriela',
          fontWeight: FontWeight.w400,
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color:  AppColors.secondaryColor,),
        ),
      ),
      
    );
  }
}
