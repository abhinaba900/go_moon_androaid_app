import 'package:flutter/material.dart';

class CustomDropDownWidget extends StatefulWidget {
  final List<String> items;
  final String selectedItem;
  final Function(String?)? onChanged;
  final double? width, hight;

  const CustomDropDownWidget({
    Key? key,
    required this.items,
    required this.selectedItem,
    this.onChanged,
    required this.width,
    required this.hight,
  }) : super(key: key);

  @override
  _CustomDropDownWidgetState createState() => _CustomDropDownWidgetState();
}

class _CustomDropDownWidgetState extends State<CustomDropDownWidget> {
  late String currentValue;

  @override
  void initState() {
    super.initState();
    currentValue = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      padding: EdgeInsets.symmetric(horizontal: widget.width! * 0.05),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(53, 53, 53, 1.0),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromRGBO(255, 255, 255, 0.2),
          width: 1,
        ),
      ),
      child: DropdownButton<String>(
        value: currentValue,
        isExpanded: true,
        underline: Container(),
        dropdownColor: const Color.fromRGBO(53, 53, 53, 1.0),
        style: const TextStyle(color: Colors.white, fontSize: 20),
        items:
            widget.items
                .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
                .toList(),
        onChanged: (value) {
          setState(() {
            currentValue = value!;
          });
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        },
      ),
    );
  }
}
