import 'package:flutter/material.dart';

Widget InputTextFieLd(
    {required TextEditingController controller, required String hintText}) {
  return SizedBox(
    width: 327.0,
    height: 51.0,
    child: TextField(
      controller: controller,
      style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w500,
          fontFamily: 'Inter'),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9.0),
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.06),
        hintText: hintText,
        hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.40),
            fontSize: 13,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter'),
      ),
    ),
  );
}

Widget InputPasswordField(
    {required TextEditingController controller,
    required String hintText,
    required bool showPassword,
    required void Function() onPressed}) {
  return SizedBox(
    width: 327.0,
    height: 51.0,
    child: TextField(
      controller: controller,
      style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w500,
          fontFamily: 'Inter'),
      obscureText: !showPassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9.0),
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.06),
        hintText: hintText,
        hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.40),
            fontSize: 13,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter'),
        suffixIcon: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            onPressed();
          },
          icon: goldenGradientWidget(
            Icon(
              showPassword
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
            ),
          ),
        ),
      ),
    ),
  );
}

class goldenGradientWidget extends StatelessWidget {
  goldenGradientWidget(this.child);

  final Widget child;
  final Gradient gradient = LinearGradient(
    colors: [
      Color(0xFF94783E),
      Color(0xFFF3EDA6),
      Color(0xFFF8FAE5),
      Color(0xFFFFE2BE),
      Color(0xFFD5BE88),
      Color(0xFFF8FAE5),
      Color(0xFFD5BE88),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: child,
    );
  }
}

class blueGradientWidget extends StatelessWidget {
  blueGradientWidget(this.child);

  final Widget child;
  final Gradient gradient = LinearGradient(
    colors: [
      Color(0xFFABFFFD),
      Color(0xFF4599DB),
      Color(0xFFAADAFF),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: child,
    );
  }
}

Widget goldenText(String text, TextStyle style) {
  return goldenGradientWidget(
    Text(
      text,
      style: style,
    ),
  );
}

Widget editField(
    {
    required String text,
    required String hintText,
    required Color hintColor,
    required TextEditingController controller,
    required Color color,
    required bool isEditable,
    void Function()? onEditingComplete,
    TextInputType? keyboardType}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(text,
          style: TextStyle(
              color: Colors.white.withOpacity(0.33),
              fontSize: 13,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter')),
      Spacer(),
      SizedBox(
        width: 202.0,
        height: 36.0,
        child: TextField(
          maxLines: 1,
          controller: controller,
          style: TextStyle(
              color: color,
              fontSize: 13,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter'),
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.right,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(right: 10),
            enabled: isEditable,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.22)),
            ),
            filled: true,
            fillColor: Color(0xFFD9D9D9).withOpacity(0.06),
            hintText: hintText,
            hintStyle: TextStyle(
                color: hintColor,
                fontSize: 13,
                fontWeight: FontWeight.w500,
                fontFamily: 'Inter'),
          ),
         onEditingComplete: () {
           if(onEditingComplete != null)
            onEditingComplete!();
          },
        ),
      )
    ],
  );
}

Widget selectGender(
    {required String? genderValue, required void Function(String) onChanged}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text('Gender:',
          style: TextStyle(
              color: Colors.white.withOpacity(0.33),
              fontSize: 13,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter')),
      Spacer(),
      Container(
          width: 202.0,
          height: 36.0,
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Color(0xFFD9D9D9).withOpacity(0.06),
            border: Border.all(color: Colors.white.withOpacity(0.22)),
          ),
          child: DropdownButton<String>(
            underline: SizedBox(),
            isDense: true,
            alignment: Alignment.centerRight,
            value: genderValue,
            icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
            dropdownColor: Color(0xFF162329),
            hint: Text('Select Gender',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.30),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter')),
            style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
                fontFamily: 'Inter'),
            items: const ['Male', 'Female']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              onChanged(value!);
            },
          ))
    ],
  );
}
