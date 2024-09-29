import 'package:daycare/core/app_theme.dart';
import 'package:daycare/core/responsive_extensions.dart';
import 'package:daycare/widgets/side_nav.dart';
import 'package:daycare/widgets/app_badge.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/app_constants.dart';
import '../widgets/default_switch.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: context.isWeb ? const SideNav() : null,
      body: Row(
        children: [
          if (context.isWeb) const Expanded(flex: 1, child: SideNav()),
          const Expanded(
            flex: 5,
            child: Column(
              children: [
                SafeArea(child: Header()),
                Expanded(child: EmployeeManagementScreen()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundLight,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DaycareInfo(),
          HeaderActions(),
        ],
      ),
    );
  }
}

class DaycareInfo extends StatelessWidget {
  const DaycareInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Icon(Icons.image, size: 20, color: Colors.grey),
          ),
          const SizedBox(width: 8),
          const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Nom de la garderie',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 16),
                  Icon(Icons.keyboard_arrow_down),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.phone, size: 12),
                  SizedBox(width: 4),
                  Text(
                    '(581) 999-7812',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HeaderActions extends StatelessWidget {
  const HeaderActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildIconButton(Icons.notifications_none, '2'),
        const SizedBox(width: 16),
        _buildIconButton(CupertinoIcons.chat_bubble_2, '2'),
        const SizedBox(width: 24),
        Container(
          width: 1,
          color: Colors.grey[200],
          margin: const EdgeInsets.symmetric(vertical: 4),
        ),
        const SizedBox(width: 16),
        const UserInfo(),
      ],
    );
  }

  Widget _buildIconButton(IconData icon, String badgeContent) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(4),
      ),
      child: IconButton(
        icon: AppBadge(
          badgeContent: Text(badgeContent),
          child: Icon(icon),
        ),
        onPressed: () {},
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: const Row(
        children: [
          _UserAvatar(),
          SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Marie-Christine',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'DIRECTRICE',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          SizedBox(width: 16),
          Icon(Icons.keyboard_arrow_down, color: Colors.black),
        ],
      ),
    );
  }
}

class _UserAvatar extends StatelessWidget {
  const _UserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage(kSampleAvatar),
        ),
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
          ),
        ),
      ],
    );
  }
}

class EmployeeManagementScreen extends StatefulWidget {
  const EmployeeManagementScreen({super.key});

  @override
  State<EmployeeManagementScreen> createState() => _EmployeeManagementScreenState();
}

class _EmployeeManagementScreenState extends State<EmployeeManagementScreen> {
  final Map<String, ValueNotifier<bool>> dayActivity = {
    'Lundi': ValueNotifier(true),
    'Mardi': ValueNotifier(false),
    'Mercredi': ValueNotifier(true),
    'Jeudi': ValueNotifier(true),
    'Vendredi': ValueNotifier(true),
    'Samedi': ValueNotifier(false),
    'Dimanche': ValueNotifier(false),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E1),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Breadcrumb(),
            const SizedBox(height: 16),
            const EmployeeManagementHeader(),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const EmployeeCard(),
                  const SizedBox(height: 16),
                  const EmployeeTabBar(),
                  const SizedBox(height: 16),
                  ScheduleSection(dayActivity: dayActivity),
                  const SizedBox(height: 16),
                  const ActionButtons(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Breadcrumb extends StatelessWidget {
  const Breadcrumb({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text('Gestion garderie / Employés', style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}

class EmployeeManagementHeader extends StatelessWidget {
  const EmployeeManagementHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Gestion des employés', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(width: MediaQuery.of(context).size.width * 0.05),
        const Spacer(),
        const SearchField(),
        const SizedBox(width: 16),
        const AddEmployeeDropdown(),
      ],
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 250),
      child: TextField(
        decoration: InputDecoration(
          isDense: true,
          hintText: 'Rechercher par nom...',
          hintStyle: AppTheme.primaryTextStyle.copyWith(color: Colors.grey, fontSize: 12),
          suffixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}

class AddEmployeeDropdown extends StatelessWidget {
  const AddEmployeeDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        // isDense: true,
        // isExpanded: true,
        // selectedItemBuilder: (context) {
        //   return [
        //     const Text('Tous les employés'),
        //   ];
        // },

        hint: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.person_add,
              size: 16,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              'Ajouter un employ',
              style: AppTheme.primaryTextStyle.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 12,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),

        menuItemStyleData: const MenuItemStyleData(
          overlayColor: WidgetStatePropertyAll(Colors.white),
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        iconStyleData: IconStyleData(
          icon: Container(
            height: 40,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: AppColors.background,
                  height: double.infinity,
                  width: 1,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8.0, left: 8),
                  child: Icon(Icons.keyboard_arrow_down),
                ),
              ],
            ),
          ),
          openMenuIcon: SizedBox(
            height: 40,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: AppColors.background,
                  height: double.infinity,
                  width: 1,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8.0, left: 8),
                  child: Icon(Icons.keyboard_arrow_up),
                ),
              ],
            ),
          ),
        ),
        buttonStyleData: ButtonStyleData(
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.circular(4),
          ),
        ),

        // customButton: ElevatedButton.icon(
        //   onPressed: () {},
        //   icon: const Icon(Icons.person_add),
        //   label: const Text('Ajouter un employ'),
        // ),
        // hint: ElevatedButton(onPressed: onPressed, child: child),
        onChanged: (value) {},
        items: const [
          DropdownMenuItem(value: 'all', child: Text('Tous les employés')),
          DropdownMenuItem(value: 'active', child: Text('Employés actifs')),
          DropdownMenuItem(value: 'inactive', child: Text('Employés inactifs')),
        ],
      ),
    );
  }
}

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(kSampleAvatar),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Laurence Dupont', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Text('Actif'),
                      SizedBox(width: 16),
                      DefaultSwitch(),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                ),
                onPressed: () {},
                child: const Row(
                  children: [
                    Icon(Icons.navigate_before),
                    Text('Précédent'),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                ),
                onPressed: () {},
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Suivant'),
                    Icon(Icons.navigate_next),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class EmployeeTabBar extends StatelessWidget {
  const EmployeeTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: TabBar(
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        indicatorColor: AppColors.blue,
        labelStyle: AppTheme.primaryTextStyle.copyWith(fontWeight: FontWeight.bold),
        tabs: [
          _buildTab('Informations du profil'),
          _buildTab('Horaire'),
          _buildTab('Embauche'),
          _buildTab('Groupe'),
          _buildTab('Transfert'),
          _buildTab('Réinitialiser le mot de passe'),
          _buildTab('Enfant(s)'),
        ],
      ),
    );
  }

  Widget _buildTab(String text, {bool isActive = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: isActive ? Colors.blue : Colors.transparent, width: 2)),
      ),
      child: Text(text, style: TextStyle(color: isActive ? Colors.blue : Colors.black)),
    );
  }
}

class ScheduleSection extends StatelessWidget {
  final Map<String, ValueNotifier<bool>> dayActivity;

  const ScheduleSection({super.key, required this.dayActivity});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const Text('Définir la période pendant lesquelles l\'employé doit être présent.'),
        const SizedBox(height: 16),
        ...dayActivity.entries.map((entry) => DayRow(day: entry.key, isActive: entry.value)),
      ],
    );
  }
}

class DayRow extends StatelessWidget {
  final String day;
  final ValueNotifier<bool> isActive;

  const DayRow({super.key, required this.day, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(child: Text(day, style: const TextStyle(fontSize: 16))),
                Row(
                  children: [
                    ValueListenableBuilder<bool>(
                      valueListenable: isActive,
                      builder: (context, value, child) {
                        return Text(
                          value ? 'Actif' : 'Inactif',
                          style: const TextStyle(color: Colors.grey),
                        );
                      },
                    ),
                    const SizedBox(width: 16),
                    DefaultSwitch(
                      value: isActive,
                      onChanged: (value) {
                        if (value != null) {
                          isActive.value = value;
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.15),
          Expanded(
            child: DayScheduleDropdown(isActive: isActive),
          ),
        ],
      ),
    );
  }
}

class DayScheduleDropdown extends StatelessWidget {
  final ValueNotifier<bool> isActive;

  const DayScheduleDropdown({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ValueListenableBuilder<bool>(
          valueListenable: isActive,
          builder: (context, isActiveValue, child) {
            return DropdownMenu<String>(
              dropdownMenuEntries: ['Toute la journée', 'Matin', 'Midi', 'Après-midi', 'Soir']
                  .map(
                    (e) => DropdownMenuEntry(
                      value: e,
                      label: e,
                      leadingIcon: Checkbox(
                        value: e == 'Toute la journée',
                        onChanged: (value) {},
                        side: const BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        activeColor: Colors.black,
                      ),
                      labelWidget: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(e, style: const TextStyle(fontSize: 16)),
                      ),
                    ),
                  )
                  .toList(),
              onSelected: (value) {},
              inputDecorationTheme: InputDecorationTheme(
                fillColor: isActiveValue ? Colors.grey.shade300 : null,
                filled: !isActiveValue,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Colors.black12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Colors.black12),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                isDense: true,
                constraints: const BoxConstraints(),
              ),
              expandedInsets: const EdgeInsets.only(top: 8),
              enabled: isActiveValue,
              hintText: isActiveValue ? 'Toute la journée' : 'Inactif',
              width: constraints.maxWidth,
              trailingIcon: const Icon(Icons.keyboard_arrow_down),
              selectedTrailingIcon: const Icon(Icons.keyboard_arrow_up),
              enableSearch: false,
              menuStyle: MenuStyle(
                backgroundColor: const WidgetStatePropertyAll(Colors.white),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                ),
                fixedSize: WidgetStatePropertyAll(Size(constraints.maxWidth, double.infinity)),
                visualDensity: VisualDensity.compact,
              ),
            );
          },
        );
      },
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        OutlinedButton(
          onPressed: () {},
          child: const Text('Annuler'),
        ),
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Unregarded les modifications'),
        ),
      ],
    );
  }
}
