import 'package:daycare/core/app_theme.dart';
import 'package:daycare/side_nav.dart';
import 'package:daycare/widgets/app_badge.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'core/app_colors.dart';
import 'widgets/default_switch.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(),
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 1,
          child: SideNav(),
        ),
        Expanded(
          flex: 4,
          child: Column(
            children: [
              SafeArea(
                child: buildHeader(),
              ),
              const Expanded(
                child: EmployeeManagementScreen(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container buildHeader() {
    return Container(
      color: AppColors.backgroundLight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: InkWell(
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
                        child: const Icon(
                          Icons.image,
                          size: 20,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Nom de la garderie',
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 16),
                                const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.phone,
                                  size: 12,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  '(581) 999-7812',
                                  style: TextStyle(color: Colors.grey, fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: IconButton(
                          icon: const AppBadge(
                            badgeContent: Text('2'),
                            child: Icon(Icons.notifications_none, color: Colors.black),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: IconButton(
                          icon: const AppBadge(
                            badgeContent: Text('2'),
                            child: Icon(CupertinoIcons.chat_bubble_2, color: Colors.black),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 24),
                      Container(
                        width: 1,
                        color: Colors.grey[200],
                        margin: const EdgeInsets.symmetric(vertical: 4),
                      ),
                      const SizedBox(width: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  const CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        'https://annemariesegal.com/wp-content/uploads/2017/04/adobestock_86346713-cropped-young-woman-in-suit.jpg?w=1200'),
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
                              ),
                              const SizedBox(width: 16),
                              const Column(
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
                              const SizedBox(width: 16),
                              const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmployeeManagementScreen extends StatefulWidget {
  const EmployeeManagementScreen({super.key});

  @override
  _EmployeeManagementScreenState createState() => _EmployeeManagementScreenState();
}

class _EmployeeManagementScreenState extends State<EmployeeManagementScreen> {
  ValueNotifier<bool> isEmployeeActive = ValueNotifier(true);
  Map<String, ValueNotifier<bool>> dayActivity = {
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBreadcrumb(),
              const SizedBox(height: 16),
              // Column(
              //   children: <Widget>[
              //     Text('w100', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w100)),
              //     Text('w200', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w200)),
              //     Text('w300', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
              //     Text('w400', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400)),
              //     Text('w500', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
              //     Text('w600', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600)),
              //     Text('w700', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700)),
              //     Text('w800', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800)),
              //     Text('w900', style: GoogleFonts.montserrat(fontSize: 18.0, fontWeight: FontWeight.w900)),
              //   ],
              // ),
              _buildHeader(),
              const SizedBox(height: 16),

              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    _buildEmployeeCard(),
                    const SizedBox(height: 16),
                    _buildTabBar(),
                    const SizedBox(height: 16),
                    _buildScheduleSection(),
                    const SizedBox(height: 16),
                    _buildActionButtons(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBreadcrumb() {
    return const Row(
      children: [
        Text('Gestion garderie / Employés', style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Gestion des employés', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.05,
        ),
        Spacer(),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 250,
          ),
          child: TextField(
            decoration: InputDecoration(
              isDense: true,
              hintText: 'Rechercher par nom...',
              hintStyle: AppTheme.primaryTextStyle.copyWith(color: Colors.grey, fontSize: 12),
              suffixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ),
        SizedBox(width: 16),
        DropdownButtonHideUnderline(
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
                SizedBox(
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
              openMenuIcon: Container(
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
            items: [
              DropdownMenuItem(child: const Text('Tous les employés'), value: 'all'),
              DropdownMenuItem(child: const Text('Employés actifs'), value: 'active'),
              DropdownMenuItem(child: const Text('Employés inactifs'), value: 'inactive'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEmployeeCard() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    'https://annemariesegal.com/wp-content/uploads/2017/04/adobestock_86346713-cropped-young-woman-in-suit.jpg?w=1200'),
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
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

  Widget _buildTabBar() {
    return DefaultTabController(
      length: 7,
      child: TabBar(
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        indicatorColor: AppColors.blue,
        labelStyle: AppTheme.primaryTextStyle.copyWith(
          fontWeight: FontWeight.bold,
        ),
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

  Widget _buildScheduleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const Text('Définir la période pendant lesquelles l\'employé doit être présent.'),
        const SizedBox(height: 16),
        ...dayActivity.entries.map((entry) => _buildDayRow(entry.key, entry.value)),
      ],
    );
  }

  Widget _buildDayRow(String day, ValueNotifier<bool> isActive) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(child: Text(day, style: const TextStyle(fontSize: 16))),
                Row(
                  children: [
                    Text(
                      isActive.value ? 'Actif' : 'Inactif',
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(width: 16),
                    DefaultSwitch(
                      value: isActive,
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            dayActivity[day]?.value = value;
                          });
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
            child: LayoutBuilder(
              builder: (context, constraints) {
                return DropdownMenu<String>(
                  dropdownMenuEntries: ['Toute la journée', 'Matin', 'Midi', 'Après-midi', 'Soir']
                      .map(
                        (e) => DropdownMenuEntry(
                          value: e,
                          label: e,
                          leadingIcon: Checkbox(
                            value: e == 'Toute la journée',
                            onChanged: (value) {},
                            side: const BorderSide(
                              color: Colors.black,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            activeColor: Colors.black,
                          ),
                          labelWidget: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              e,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onSelected: (value) {},
                  inputDecorationTheme: InputDecorationTheme(
                    fillColor: isActive.value ? Colors.grey.shade300 : null,
                    filled: !isActive.value,
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
                  enabled: isActive.value,
                  hintText: isActive.value ? 'Toute la journée' : 'Inactif',
                  width: constraints.maxWidth,
                  trailingIcon: const Icon(Icons.keyboard_arrow_down),
                  selectedTrailingIcon: const Icon(Icons.keyboard_arrow_up),
                  enableSearch: false,
                  menuStyle: MenuStyle(
                    backgroundColor: const WidgetStatePropertyAll(Colors.white),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    fixedSize: WidgetStatePropertyAll(Size(constraints.maxWidth, double.infinity)),
                    visualDensity: VisualDensity.compact,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
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
