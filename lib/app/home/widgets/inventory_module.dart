import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class InventoryModule extends StatelessWidget {
  const InventoryModule({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          CustomAppBar(),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 400,
              child: TabBar(
                tabs: [
                  CustomTabBar(
                    label: 'listView'.tr,
                    icon: Icons.menu,
                  ),
                  CustomTabBar(
                    label: 'treeView'.tr,
                    icon: Icons.account_tree_sharp,
                  ),
                  CustomTabBar(
                    label: 'mapView'.tr,
                    icon: Icons.location_on,
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: Dimens.edgeInsets16_16_0_0,
                padding: Dimens.edgeInsets16_8_16_8,
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'columnVisibility'.tr,
                  style: Styles.white12.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                width: 200,
                height: 40,
                margin: Dimens.edgeInsets0_0_16_0,
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    contentPadding: Dimens.edgeInsets10_0_0_0,
                    hintText: 'search'.tr,
                    hintStyle: Styles.grey12,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.withOpacity(.2),
                ),
              ),
              margin: Dimens.edgeInsets16,
              child: ScrollableTableView(
                columns: [
                  'assetName'.tr,
                  'serialNo'.tr,
                  'parrentAsset'.tr,
                  'catergory'.tr,
                  'assetFacilityName'.tr,
                  'action'.tr,
                ].map((column) {
                  return TableViewColumn(
                    minWidth: 1100 / 6,
                    label: column,
                  );
                }).toList(),
                rows: [
                  [
                    AssetName(
                      'Demo_Inv_1_qwert',
                      2,
                    ),
                    1,
                    'qwerty',
                    'poiuyt',
                    '3456789',
                    'Actions',
                  ],
                  ...List.generate(
                      8,
                      (index) => [
                            AssetName(
                              'Demo_Inv_1_qwert',
                              1,
                            ),
                            1,
                            'qwerty',
                            'poiuyt',
                            '3456789',
                            'Actions'
                          ]),
                ].map(
                  (record) {
                    return TableViewRow(
                      height: 130,
                      cells: record.map(
                        (value) {
                          return TableViewCell(
                            child: GestureDetector(
                              onTap: () {
                                print('${value} $record');
                              },
                              child: value.runtimeType.toString() == 'AssetName'
                                  ? Builder(builder: (context) {
                                      final val = value as AssetName;
                                      return Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: Dimens.edgeInsets8,
                                              child: Text('${val.name}'),
                                            ),
                                          ),
                                          Spacer(),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Container(
                                              padding: Dimens.edgeInsets8_2_8_2,
                                              decoration: BoxDecoration(
                                                color:
                                                    val.requirementStatus == 1
                                                        ? Colors.red
                                                        : Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              child: Text(
                                                val.name == 1
                                                    ? 'requirementRejected'.tr
                                                    : 'requirementAccepted'.tr,
                                                style: Styles.white10.copyWith(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Dimens.boxHeight10,
                                        ],
                                      );
                                    })
                                  : value == 'Actions'
                                      ? Wrap(
                                          children: [
                                            TableActionButton(
                                              color: Colors.green,
                                              icon: Icons.visibility,
                                              label: 'View',
                                              onPress: () {},
                                            ),
                                            TableActionButton(
                                              color: Colors.blue,
                                              icon: Icons.edit,
                                              label: 'Edit',
                                              onPress: () {},
                                            ),
                                            TableActionButton(
                                              color: Colors.red,
                                              icon: Icons.delete,
                                              label: 'Delete',
                                              onPress: () {},
                                            ),
                                            TableActionButton(
                                              color: Colors.green,
                                              icon: Icons.visibility,
                                              label: 'Approve Request',
                                              onPress: () {},
                                            ),
                                            TableActionButton(
                                              color: Colors.red,
                                              icon: Icons.visibility,
                                              label: 'Reject Request',
                                              onPress: () {},
                                            ),
                                          ],
                                        )
                                      : Text(value.toString()),
                            ),
                          );
                        },
                      ).toList(),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}