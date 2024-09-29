import 'package:daycare/widgets/drawer_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/app_colors.dart';

class SideNav extends StatelessWidget {
  const SideNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 100,
            child: FlutterLogo(),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DrawerListTile(
                    title: const Text(
                      'Tableu de bord',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    leading: const Icon(Icons.home),
                    onTap: () {},
                  ),
                  DrawerListTile(
                    title: const Text('Messages'),
                    leading: const Icon(CupertinoIcons.chat_bubble_fill),
                    onTap: () {},
                  ),
                  DrawerListTile(
                    title: const Text('Agenda'),
                    leading: const Icon(Icons.contact_page_outlined),
                    onTap: () {},
                  ),
                  DrawerExpansionListTile(
                    title: const Text('Enfants'),
                    leading: const Icon(CupertinoIcons.person_2_fill),
                    children: [
                      DrawerListTile(
                        title: const Text('Liste'),
                        leading: SizedBox(width: 24),
                        onTap: () {},
                      ),
                      DrawerListTile(
                        title: const Text('Inscriptions'),
                        leading: SizedBox(width: 24),
                        onTap: () {},
                      ),
                      DrawerListTile(
                        title: const Text('Groupes'),
                        leading: SizedBox(width: 24),
                        onTap: () {},
                      ),
                    ],
                  ),
                  DrawerExpansionListTile(
                    title: const Text('Calendrier'),
                    leading: const Icon(CupertinoIcons.calendar_today),
                    onTap: () {},
                    children: const [
                      DrawerListTile(
                        title: Text('Jours fériés'),
                        leading: SizedBox(width: 24),
                      ),
                      DrawerListTile(
                        title: Text('Vacances'),
                        leading: SizedBox(width: 24),
                      ),
                      DrawerListTile(
                        title: Text('Absences'),
                        leading: SizedBox(width: 24),
                      ),
                    ],
                  ),
                  DrawerListTile(
                    title: const Text('Menu'),
                    leading: const Icon(CupertinoIcons.square_grid_2x2_fill),
                    onTap: () {},
                  ),
                  DrawerListTile(
                    title: const Text('Facturation'),
                    leading: const Icon(CupertinoIcons.money_dollar_circle_fill),
                    onTap: () {},
                  ),
                  Divider(),
                  DrawerExpansionListTile(
                    title: const Text('Gestion Garderie'),
                    leading: const Icon(CupertinoIcons.house_fill),
                    children: [
                      DrawerListTile(
                        title: const Text('Employees'),
                        leading: SizedBox(width: 24),
                        onTap: () {},
                      ),
                      DrawerListTile(
                        title: const Text('Parents'),
                        leading: SizedBox(width: 24),
                        onTap: () {},
                      ),
                      DrawerListTile(
                        title: const Text('Documents'),
                        leading: SizedBox(width: 24),
                        onTap: () {},
                      ),
                    ],
                  ),
                  DrawerExpansionListTile(
                    title: const Text('Outils'),
                    leading: const Icon(CupertinoIcons.wrench_fill),
                    children: [
                      DrawerListTile(
                        title: const Text('Employees'),
                        leading: SizedBox(width: 24),
                        onTap: () {},
                      ),
                      DrawerListTile(
                        title: const Text('Parents'),
                        leading: SizedBox(width: 24),
                        onTap: () {},
                      ),
                      DrawerListTile(
                        title: const Text('Documents'),
                        leading: SizedBox(width: 24),
                        onTap: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Divider(),
          DrawerListTile(
            title: const Text('Garderie'),
            leading: const Icon(CupertinoIcons.house_fill),
            onTap: () {},
          ),
          DrawerListTile(
            title: const Text('Aide'),
            leading: const Icon(CupertinoIcons.question_circle_fill),
            onTap: () {},
          ),
          DrawerListTile(
            title: const Text('Paramètres'),
            leading: const Icon(CupertinoIcons.settings),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
