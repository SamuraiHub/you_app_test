import 'package:flutter/material.dart';

import '../repeated_widgets.dart';

class interests extends StatefulWidget {
  final List<String> interests_list;

  interests({required this.interests_list});

  @override
  _interestsState createState() => _interestsState();
}

class _interestsState extends State<interests> {
  TextEditingController _textEditingController = new TextEditingController();
  final List<String> interests = [];

  @override
  void initState() {
    super.initState();
    interests.addAll(widget.interests_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color(0xFF1F4247),
              Color(0xFF0D1D23),
              Color(0xFF09141A),
            ],
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top,
                    left: 18,
                    right: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context, null);
                      },
                      child: Row(
                        children: [
                          Image.asset('assets/images/back.png',
                              width: 7, height: 14),
                          const SizedBox(width: 10),
                          Text(
                            'Back',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Inter'),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        if (interests.isNotEmpty)
                          Navigator.pop(context, interests);
                        else
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              'Please add at least one interest',
                              style: const TextStyle(color: Colors.red),
                            ),
                            duration: const Duration(seconds: 3),
                          ));
                      },
                      child: blueGradientWidget(
                        Text(
                          'save',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: goldenGradientWidget(
                  Text(
                    'Tell everyone about yourself',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter'),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Text(
                  'What interest you?',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Inter'),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: TextField(
                  controller: _textEditingController,
                  autofocus: true,
                  textInputAction: TextInputAction.done,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter'),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: Color(0xFFD9D9D9).withOpacity(0.06),
                  ),
                  onEditingComplete: () {
                    setState(() {
                      if (_textEditingController.text.isNotEmpty &&
                          !interests.contains(_textEditingController.text))
                        interests.add(_textEditingController.text);
                      _textEditingController.clear();
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Container(
                      width: 359,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xFFD9D9D9).withOpacity(0.06),
                      ),
                      child: Wrap(
                        spacing: 5.0,
                        runSpacing: 8.0,
                        children: interests
                            .map(
                              (interest) => Container(
                                height: 31,
                                width: (TextPainter(
                                            text: TextSpan(
                                              text: interest,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Inter'),
                                            ),
                                            maxLines: 1,
                                            textScaleFactor:
                                                MediaQuery.of(context)
                                                    .textScaleFactor,
                                            textDirection: TextDirection.ltr)
                                          ..layout())
                                        .size
                                        .width +
                                    32,
                                padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: Colors.white.withOpacity(0.10),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      interest,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Inter'),
                                    ),
                                    SizedBox(width: 5),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          interests.remove(interest);
                                        });
                                      },
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 10.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ))),
            ]),
      ),
    );
  }
}
