import 'package:flutter/material.dart';
import 'package:food_date/db_food/food_entity.dart';
import 'package:food_date/main.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:get/get.dart';

class FoodItem extends StatefulWidget {
  const FoodItem(this.list, {Key? key}) : super(key: key);
  final List<FoodEntity> list;

  @override
  State<FoodItem> createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return widget.list.isEmpty
        ? const Center(
            child: Text('No data'),
          )
        : ListView.builder(
            itemCount: widget.list.length,
            itemBuilder: (_, index) {
              final entity = widget.list[index];
              return <Widget>[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  child: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: SizedBox(
                        width: 124,
                        height: 124,
                        child: Image.memory(entity.image, fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: <Widget>[
                      const Text(
                        'Out time',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        entity.outTimeString,
                        style: TextStyle(
                            color: entity.isExpired ? Colors.red : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Storage conditions',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        entity.storageType == 0 ? 'Refrigeration' : 'Normal',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      <Widget>[
                        const Text(
                          'Margin',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '(${entity.margin}%)',
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        )
                      ].toRow(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween),
                      const SizedBox(
                        height: 5,
                      ),
                      <Widget>[
                        Container(
                          width: double.infinity,
                          height: 8,
                        ).decorated(
                            color: const Color(0xffe5e5e5),
                            borderRadius: BorderRadius.circular(4)),
                        LayoutBuilder(builder: (_, max) {
                          return Container(
                            width: max.maxWidth * (entity.margin / 100),
                            height: 8,
                          ).decorated(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(4));
                        })
                      ].toStack()
                    ].toColumn(crossAxisAlignment: CrossAxisAlignment.start))
                  ].toRow(),
                ).decorated(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                Visibility(
                    visible: entity.foodType != 0,
                    child: Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          height: 24,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            entity.used == 0 ? 'Opened' : 'Unopened',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ).decorated(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                            color: entity.used == 0
                                ? primaryColor
                                : const Color(0xffd6d6d6))))
              ].toStack().marginOnly(bottom: 10);
            });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
