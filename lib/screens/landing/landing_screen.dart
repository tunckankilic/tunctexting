import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tunctexting/common/widgets/custom_button.dart';
import 'package:tunctexting/screens/screens.dart';

import 'package:tunctexting/utils/utils.dart';

class LandingScreen extends StatelessWidget {
  static const routeName = "/landing";
  const LandingScreen({Key? key}) : super(key: key);

  void navigateToLoginScreen(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                  "If you clicked this button you accepted eula and privacy"),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop,
                  child: Text("No"),
                ),
                ElevatedButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, LoginScreen.routeName),
                  child: Text("Yes"),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(colors: [
              textColor,
              Colors.white,
            ], radius: 10, center: Alignment.center),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Text(
                'Welcome to Tunc Texting',
                style: TextStyle(
                  fontSize: 28,
                  color: backgroundColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: size.height / 28),
              Image.asset(
                'assets/bg.png',
                height: 340,
                width: 340,
                color: backgroundColor,
              ),
              SizedBox(height: size.height / 28),
              Padding(
                  padding: EdgeInsets.all(15.0),
                  child: PrivacyEulaWidget(backgroundColor: backgroundColor)),
              const SizedBox(height: 10),
              SizedBox(
                width: size.width * 0.75,
                child: CustomButton(
                  text: 'AGREE AND CONTINUE',
                  bgColor: backgroundColor,
                  textStyle: const TextStyle(
                      color: textColor, fontWeight: FontWeight.bold),
                  onPressed: () => navigateToLoginScreen(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PrivacyEulaWidget extends StatelessWidget {
  final Color backgroundColor;

  PrivacyEulaWidget({Key? key, required this.backgroundColor})
      : super(key: key);

  String privacy = """

TuncTexting Privacy Policy

Last updated: September 11, 2024

## 1. Introduction

Welcome to TuncTexting ("we," "our," or "us"). We are committed to protecting your personal information and your privacy rights. This privacy policy outlines how we collect, use, and share information when you use our mobile application, TuncTexting (the "App").

## 2. Information We Collect

We collect the following types of information:

### 2.1 Information You Provide to Us:
- **Contact Information**: When you create an account, we collect your contact information.
- **Content**: Any content you create, upload, or receive from others when using our services.

### 2.2 Information We Collect Automatically:
- **Usage Data**: Information about how you interact with the App.
- **Device Information**: Details about the device you use to access the App.

### 2.3 Information We Collect with Your Permission:
- **Camera Access**: We request access to your device's camera to enable features like photo sharing.
- **Photo Library Access**: We request access to your photo library to allow you to share existing photos.
- **Contacts**: We request access to your contacts to help you connect with friends using the App.
- **Bluetooth**: We may use Bluetooth to enhance your experience with nearby devices.
- **Speech Recognition**: We may use speech recognition to facilitate user inputs.
- **Microphone**: We request access to your microphone for voice messaging features.

## 3. How We Use Your Information

We use the information we collect to:
- Provide, maintain, and improve our services.
- Develop new features and services.
- Communicate with you about our services.
- Monitor and analyze usage trends and patterns.
- For security and verification purposes.
- To fulfill our legal obligations.

## 4. Sharing of Your Information

We may share your information under the following circumstances:
- **With Your Consent**: When you have given us explicit permission.
- **For Legal Reasons**: If required by law or to protect our legal rights.
- **To Protect Our Interests**: To safeguard our rights, privacy, safety, or property.
- **With Service Providers**: With third-party service providers who help us deliver our services.

## 5. Data Security

We implement appropriate technical and organizational measures to protect the information we collect and store about you. However, please note that no internet transmission or electronic storage method is 100% secure.

## 6. Your Rights

Depending on your location, you may have certain rights regarding your personal information, which may include:
- The right to access your data
- The right to rectify or update your data
- The right to request deletion of your data
- The right to restrict our processing
- The right to data portability
- The right to object to processing

If you wish to exercise any of these rights, please contact us.

## 7. Children's Privacy

Our services are not directed to children under 13. If you become aware that a child under 13 has provided us with personal information without consent, please contact us immediately.

## 8. Changes to This Privacy Policy

We may update this Privacy Policy from time to time. Any changes will be posted on this page, and we will notify you of significant changes.

## 9. Contact Us

If you have any questions about this Privacy Policy, please contact us at [ismail.tunc.kankilic@gmail.com].

## 10. Account Deletion

When you wish to delete your account, you can initiate this process from within the app. Account deletion is irreversible and results in permanent deletion of all your data. For more information about account deletion, please go to Settings > Account > Delete Account.

## 11. Data Retention

We retain your personal data for as long as necessary to fulfill our legal obligations, resolve disputes, and enforce our policies. Our data retention period for inactive accounts is 24 months.

## 12. Cross-Border Data Transfers

Your data may be transferred to and processed in countries where our servers and service providers are located. The data protection laws in these countries may differ from those in your country.

## 13. Do Not Track Signals

We currently do not respond to Do Not Track ("DNT") signals. However, you may disable or delete cookies using your browser settings.
""";

  String eula = """

# TuncTexting End-User License Agreement (EULA)

Last Updated: September 11, 2024

This End-User License Agreement ('Agreement') is a binding agreement between you ('End User' or 'you') and TuncTexting ('Company,' 'we,' 'us,' or 'our'). This Agreement governs your use of the TuncTexting mobile application (including all related documentation, the 'Application'). 

By installing, accessing, or using the Application, you:

(a) acknowledge that you have read and understand this Agreement; 
(b) represent that you are of legal age to enter into a binding agreement; and 
(c) accept this Agreement and agree to be legally bound by its terms.

If you do not agree to these terms, do not install, access, or use the Application.

## 1. License Grant

Subject to the terms of this Agreement, Company grants you a limited, non-exclusive, non-transferable, non-sublicensable, revocable license to download, install, and use the Application for your personal, non-commercial use on a single mobile device owned or otherwise controlled by you ('Mobile Device') strictly in accordance with the Application's documentation.

## 2. License Restrictions

You shall not:

(a) copy the Application, except as expressly permitted by this license;
(b) modify, translate, adapt, or otherwise create derivative works or improvements, whether or not patentable, of the Application;
(c) reverse engineer, disassemble, decompile, decode, or otherwise attempt to derive or gain access to the source code of the Application or any part thereof;
(d) remove, delete, alter, or obscure any trademarks or any copyright, trademark, patent, or other intellectual property or proprietary rights notices from the Application;
(e) rent, lease, lend, sell, sublicense, assign, distribute, publish, transfer, or otherwise make available the Application, or any features or functionality of the Application, to any third party for any reason;
(f) use the Application in any way that violates any applicable laws, regulations, or rights of others.

## 3. User-Generated Content

The Application may allow you to create, post, share, or interact with content ('User Content'). You retain any intellectual property rights that you hold in your User Content. By creating, posting, or sharing User Content, you grant us a non-exclusive, royalty-free, transferable, sub-licensable, worldwide license to use, display, reproduce, and distribute your User Content in connection with the Application.

You are solely responsible for your User Content and the consequences of posting or publishing it. You represent and warrant that:

(a) you own or have the necessary rights to use and authorize us to use all intellectual property rights in and to any User Content;
(b) your User Content does not violate any third party's intellectual property rights or other rights;
(c) your User Content complies with this Agreement and all applicable laws and regulations.

## 4. Prohibited Content

You agree not to create, post, share, or transmit any User Content that:

(a) is unlawful, harmful, threatening, abusive, harassing, tortious, defamatory, vulgar, obscene, libelous, invasive of another's privacy, hateful, or racially, ethnically, or otherwise objectionable;
(b) infringes any patent, trademark, trade secret, copyright, or other intellectual property rights of any party;
(c) contains software viruses or any other computer code, files, or programs designed to interrupt, destroy, or limit the functionality of any computer software or hardware or telecommunications equipment;
(d) impersonates any person or entity or falsely states or otherwise misrepresents your affiliation with a person or entity;
(e) constitutes unauthorized or unsolicited advertising, junk or bulk e-mail, chain letters, or any other form of unauthorized solicitation.

## 5. Monitoring and Enforcement

We have the right to:

(a) remove or refuse to post any User Content for any or no reason;
(b) take any action with respect to any User Content that we deem necessary or appropriate in our sole discretion;
(c) disclose your identity or other information about you to any third party who claims that material posted by you violates their rights;
(d) terminate or suspend your access to all or part of the Application for any or no reason.

Without limiting the foregoing, we have the right to fully cooperate with any law enforcement authorities or court order requesting or directing us to disclose the identity or other information of anyone posting any materials on or through the Application.

## 6. Privacy

We collect, use, and disclose information about you as provided in our Privacy Policy. By downloading, installing, using, and providing information to or through the Application, you consent to all actions taken by us with respect to your information in compliance with the Privacy Policy.

## 7. Updates

We may from time to time in our sole discretion develop and provide Application updates, which may include upgrades, bug fixes, patches, other error corrections, and/or new features (collectively, 'Updates'). Updates may also modify or delete in their entirety certain features and functionality. You agree that we have no obligation to provide any Updates or to continue to provide or enable any particular features or functionality.

## 8. Third-Party Materials

The Application may display, include, or make available third-party content or provide links to third-party websites or services. You acknowledge and agree that the Company is not responsible for any Third-Party Materials, including their accuracy, completeness, timeliness, validity, legality, or reliability. 

## 9. Term and Termination

The term of Agreement commences when you install the Application and will continue in effect until terminated by you or Company as set forth in this Section.

You may terminate this Agreement by deleting the Application and all copies thereof from your Mobile Device.

Company may terminate this Agreement at any time without notice. In addition, this Agreement will terminate immediately and automatically without any notice if you violate any of the terms and conditions of this Agreement.

Upon termination, all rights granted to you under this Agreement will also terminate, and you must cease all use of the Application and delete all copies of the Application from your Mobile Device.

## 10. Disclaimer of Warranties

THE APPLICATION IS PROVIDED TO YOU 'AS IS' AND 'AS AVAILABLE' WITH ALL FAULTS AND DEFECTS WITHOUT WARRANTY OF ANY KIND. TO THE MAXIMUM EXTENT PERMITTED UNDER APPLICABLE LAW, COMPANY DISCLAIMS ALL WARRANTIES, WHETHER EXPRESS, IMPLIED, STATUTORY, OR OTHERWISE.

## 11. Limitation of Liability

TO THE FULLEST EXTENT PERMITTED BY APPLICABLE LAW, IN NO EVENT WILL COMPANY BE LIABLE FOR ANY INDIRECT, SPECIAL, INCIDENTAL, CONSEQUENTIAL, EXEMPLARY, OR PUNITIVE DAMAGES OF ANY KIND ARISING FROM OR RELATING TO THIS AGREEMENT OR YOUR USE OF, OR INABILITY TO USE, THE APPLICATION.

## 12. Governing Law

This Agreement is governed by and construed in accordance with the internal laws of [Your Country/State] without giving effect to any choice or conflict of law provision or rule.

## 13. Changes to this Agreement

We may update this Agreement from time to time. If we make material changes to this Agreement, we will notify you by email or by posting a notice in the Application prior to the change becoming effective. Your continued use of the Application after any such change constitutes your acceptance of the new terms.

## 14. Contact Information

If you have any questions about this Agreement, please contact us at [ismail.tunc.kankilic@gmail.com].

By installing and using the Application, you acknowledge that you have read this Agreement, understand it, and agree to be bound by its terms and conditions.
""";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(color: backgroundColor),
          children: [
            const TextSpan(text: 'Read our '),
            TextSpan(
              text: 'Privacy Policy',
              style: const TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap =
                    () => _showModalBottomSheet(context, 'Privacy Policy'),
            ),
            const TextSpan(text: ' and '),
            TextSpan(
              text: 'EULA',
              style: const TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => _showModalBottomSheet(context, 'EULA'),
            ),
            const TextSpan(
              text:
                  '. Tap "Agree and continue" to accept the Terms of Service.',
            ),
          ],
        ),
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context, String title) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.9,
          minChildSize: 0.5,
          maxChildSize: 0.9,
          expand: false,
          builder: (_, controller) {
            return Container(
              color: Colors.white,
              child: Column(
                children: [
                  AppBar(
                    title: Text(title),
                    leading: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      controller: controller,
                      padding: const EdgeInsets.all(16.0),
                      children: [
                        Text(
                          title == 'Privacy Policy' ? privacy : eula,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
