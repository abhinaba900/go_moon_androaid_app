import 'package:flutter/material.dart';
import 'package:go_moon/Widget/custom_dropdown_widget.dart';

class HomePage extends StatelessWidget {
  double? _devideWidth, _devideHeight;
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _devideWidth = MediaQuery.of(context).size.width;
    _devideHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: _devideWidth,
          height: _devideHeight,
          padding: EdgeInsets.symmetric(horizontal: _devideWidth! * 0.05),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [_pageTitle(), _bookRideWidget()],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: _astroImageWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pageTitle() {
    return const Text(
      "#GoMoon",

      style: TextStyle(
        fontSize: 70,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _astroImageWidget() {
    return Container(
      width: _devideWidth! * 0.65,
      height: _devideHeight! * 0.50,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/astro_moon.png"),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _destinationDropDownWidget() {
    List<String> _destinations = ["Nearby stations", "Moon", "Mars", "Jupiter"];
    String _selectedDestination = "Nearby stations";
    return CustomDropDownWidget(
      items: _destinations,
      width: _devideWidth,
      hight: _devideHeight,
      selectedItem: _selectedDestination,
    );
  }

  Widget _bookRideWidget() {
    return Container(
      height: _devideHeight! * 0.25,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _destinationDropDownWidget(),
          _travelerDetailsWidget(),
          _bookButtonWidget(),
        ],
      ),
    );
  }

  Widget _travelerDetailsWidget() {
    String _selectedTravelerCount = "1";
    String _selectedClass = "Economy";
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomDropDownWidget(
          items: ["1", "2", "3"],
          width: _devideWidth! * 0.45,
          hight: _devideHeight,
          selectedItem: _selectedTravelerCount,
        ),
        CustomDropDownWidget(
          items: ["Economy", "Business", "First", "Luxury"],
          width: _devideWidth! * 0.40,
          hight: _devideHeight,
          selectedItem: _selectedClass,
        ),
      ],
    );
  }

  Widget _bookButtonWidget() {
    return Container(
      width: _devideWidth! * 0.9,
      margin: EdgeInsets.only(bottom: _devideHeight! * 0.01),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: MaterialButton(
        onPressed: () {},
        child: const Text("Book Ride !", style: TextStyle(color: Colors.black)),
      ),
    );
  }
}
