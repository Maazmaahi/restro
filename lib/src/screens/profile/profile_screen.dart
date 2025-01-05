import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../cores/cores.dart';
import '../../providers/providers.dart';
import '../../routes/routes.dart';
import '../../widgets/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AppLocalizations? translate;

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    translate = context.translate;

    return AppScaffold(
      leftButton: CustomAppBarLeftButtons.appLogo,
      title: translate?.profile ?? "Profile",
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: context.screenWidth,
              child: Image.asset(
                Assets.images.biryaniMahalBanner,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.person_outline),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("John Doe", style: TextStyle(fontSize: 18)),
                    Text("john.Doe@restro.com"),
                  ],
                ),
              ],
            ),
            _buildProfileTile(
              onTap: () {
                showModalBottomSheet(
                    elevation: 8,
                    context: context,
                    builder: (context) {
                      return _buildThemeSheet();
                    });
              },
              leadingIcon: FontAwesomeIcons.sun,
              text: translate?.theme ?? "Theme",
            ),
            _buildProfileTile(
              onTap: () {
                showModalBottomSheet(
                    elevation: 8,
                    context: context,
                    builder: (context) {
                      return _buildLanguageSheet();
                    });
              },
              leadingIcon: FontAwesomeIcons.language,
              text: translate?.language ?? "Language",
            ),
            _buildProfileTile(
              onTap: () {
                context.push(RoutesName.notifications);
              },
              leadingIcon: FontAwesomeIcons.bell,
              text: translate?.notification ?? "Notification",
            ),
            _buildProfileTile(
              onTap: () {
                context.push(RoutesName.order);
              },
              leadingIcon: FontAwesomeIcons.bellConcierge,
              text: translate?.myOrders ?? "My Orders",
            ),
            _buildProfileTile(
              onTap: () {
                context.push(RoutesName.address);
              },
              leadingIcon: FontAwesomeIcons.locationDot,
              text: translate?.savedAddress ?? "Saved Address",
            ),
            _buildProfileTile(
              onTap: () {
                LocalStorageManager.setBool("isLoggedIn", false);
                context.go(RoutesName.login);
              },
              leadingIcon: FontAwesomeIcons.rightFromBracket,
              text: translate?.logout ?? "Logout",
            ),
            const SizedBox(height: 30),
            Text(
              "${translate?.version ?? "Version"}: 1.0",
              style: TextStyle(color: AppColors.grey[500]),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildThemeSheet() {
    final authProvider = Provider.of<AuthProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(translate?.changeTheme ?? "Change Theme"),
              IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(
                    Icons.cancel_outlined,
                    size: 20,
                  )),
            ],
          ),
          Expanded(
            child: ListView.separated(
              itemCount: authProvider.themes.length,
              separatorBuilder: (context, index) => const Divider(
                color: AppColors.grey,
              ),
              itemBuilder: (context, index) {
                final item = authProvider.themes[index];
                return RadioListTile(
                  title: Text(item.name),
                  value: item.code,
                  groupValue: authProvider.themeGroupValue,
                  onChanged: (language) {
                    authProvider.themeGroupValue = item.code;
                    authProvider.setTheme(item);
                    context.pop();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageSheet() {
    final authProvider = Provider.of<AuthProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(translate?.changeLanguage ?? "Change Language"),
              IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(
                    Icons.cancel_outlined,
                    size: 20,
                  )),
            ],
          ),
          Expanded(
            child: ListView.separated(
              itemCount: authProvider.languages.length,
              separatorBuilder: (context, index) => const Divider(
                color: AppColors.grey,
              ),
              itemBuilder: (context, index) {
                final item = authProvider.languages[index];
                return RadioListTile(
                  title: Text(item.translation),
                  subtitle: Text(item.name),
                  value: item.code,
                  groupValue: authProvider.localeGroupValue,
                  onChanged: (language) {
                    authProvider.localeGroupValue = item.code;
                    authProvider.setLocale(Locale(item.code));
                    context.pop();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileTile({
    required IconData leadingIcon,
    required String text,
    required Function()? onTap,
  }) {
    return Column(
      children: [
        const AppDivider(),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      FaIcon(
                        leadingIcon,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(text, style: const TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
                const FaIcon(
                  FontAwesomeIcons.chevronRight,
                  size: 24,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
