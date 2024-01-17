import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../config/router/router_info.dart';
import '../../../container/provider/main_provider.dart';
import '../../../generated/assets.dart';
import 'side_bar_item.dart';

class SideBar extends ConsumerStatefulWidget {
  const SideBar({super.key});

  @override
  ConsumerState<SideBar> createState() => _SideBarState();
}

class _SideBarState extends ConsumerState<SideBar> {
  double sideWidth = 60;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        width: sideWidth,
        color: Theme.of(context).colorScheme.surface,
        child: Column(children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: sideWidth == 60
                ? MainAxisAlignment.center
                : MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.menu,
                ),
                onPressed: () {
                  setState(() {
                    if (sideWidth == 200) {
                      sideWidth = 60;
                    } else {
                      sideWidth = 200;
                    }
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            height: 5,
            thickness: 2,
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            Assets.imagesLogo,
            width: sideWidth < 200 ? 100 : 150,
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            height: 5,
            thickness: 2,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SideBarItem(
                    title: 'Allocation Data',
                    route: RouterInfo.dataRoute,
                    icon: MdiIcons.databaseSearch,
                    width: sideWidth,
                    onTap: () {
                      _gotoPage(RouterInfo.dataRoute);
                    },
                    isSelected: ref.watch(navProvider) ==
                            RouterInfo.dataRoute.routeName,
                  ),
                                
                  SideBarItem(
                    title: 'Liberal Courses',
                    route: RouterInfo.liberialRoute,
                    icon: MdiIcons.bookshelf,
                    width: sideWidth,
                    onTap: () {
                      _gotoPage(RouterInfo.liberialRoute);
                    },
                    isSelected: ref.watch(navProvider) ==
                        RouterInfo.liberialRoute.routeName,
                  ),
                  SideBarItem(
                    title: 'Venues',
                    route: RouterInfo.venueRoute,
                    icon: MdiIcons.homeCity,
                    width: sideWidth,
                    onTap: () {
                      _gotoPage(RouterInfo.venueRoute);
                    },
                    isSelected: ref.watch(navProvider) ==
                        RouterInfo.venueRoute.routeName,
                  ),
                  
                  
                    SideBarItem(
                      title: 'Time Table',
                      route: RouterInfo.tableRoute,
                      icon: MdiIcons.tableLarge,
                      width: sideWidth,
                      onTap: () {
                        _gotoPage(RouterInfo.tableRoute);
                      },
                      isSelected: ref.watch(navProvider) ==
                          RouterInfo.tableRoute.routeName,
                    ),
                  //logout
                  SideBarItem(
                    title: 'Settings',
                    icon: Icons.settings,
                    width: sideWidth,
                    isSelected: ref.watch(navProvider) ==
                        RouterInfo.configRoute.routeName,
                    onTap: () {
                      _gotoPage(RouterInfo.configRoute);
                    
                    },
                  ),
                ]),
          )),
          const Text(
            '© 2023 Residency',
            style: TextStyle(color: Colors.white, fontSize: 10),
          )
        ]),
        //copy right text
      ),
    );
  }

  _gotoPage(RouterInfo routerInfo) {
    // var settings = ref.read(settingsProvider);
    // if (routerInfo.routeName == RouterInfo.settingsRoute.routeName ||
    //     (settings.id != null && settings.academicYear != null)) {
    //   ref.read(navProvider.notifier).state = routerInfo.routeName;
    //   context.go(routerInfo.path);
    // } else {
    //   CustomDialog.showInfo(
    //       message: 'Settings are not set yet, please set them first',
    //       buttonText: 'Settings',
    //       onPressed: () {
    //         ref.read(navProvider.notifier).state =
    //             RouterInfo.settingsRoute.routeName;
    //         context.go(RouterInfo.settingsRoute.path);
    //       });
    // }
    ref.read(navProvider.notifier).state = routerInfo.routeName;
    context.go(routerInfo.path);
  }
}
