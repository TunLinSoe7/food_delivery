import 'package:flutter/material.dart';
import 'package:food_order_demo/utils/screen_width_height_utils.dart';
import 'package:food_order_demo/widgets/bottom_navigation_bar_widget.dart';
import 'package:food_order_demo/widgets/button_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/enums.dart';
class SelectPaymentPage extends StatefulWidget {
  const SelectPaymentPage({super.key});

  @override
  State<SelectPaymentPage> createState() => _SelectPaymentPageState();
}

class _SelectPaymentPageState extends State<SelectPaymentPage> {
  Fruit? _fruit = Fruit.WavePay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:BottomNavigationBarWidget(
          navigationView: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonWidget(
                  onTap: (){
                    //Get.to(const SelectPaymentPage());
                  },
                  buttonWidth: ScreenWidthUtil.screenWidth(context)*0.9, text: "Pay Now")
            ],
          )
      ),
      backgroundColor:const Color(0xFFF3F7F9),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: (){
            Navigator.of(context).pop();
          },
            child: const Icon(Icons.close_rounded,color: Colors.black,)),
        title: Text("Select Payment",style: GoogleFonts.abyssinicaSil(color: Colors.black),),
        centerTitle: true,
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Summary",style: GoogleFonts.abyssinicaSil(fontSize: 18),),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
                ),
                height: 80,
                width: MediaQuery.of(context).size.width,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total Payment",style: GoogleFonts.abyssinicaSil(fontSize: 18),),
                    const Spacer(),
                    Text("1000 MMK",style: GoogleFonts.abyssinicaSil(color: Colors.cyan),),
                  ],
                ),
              ),
              const SizedBox(height: 15,),
             Text("Select Payment Method",style: GoogleFonts.abyssinicaSil(fontSize: 18),),
              Container(
                margin: const EdgeInsets.only(top:15,bottom: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text('WavePay'),
                      leading: Radio<Fruit>(
                        value: Fruit.WavePay,
                        groupValue: _fruit,
                        onChanged: (Fruit? value) {
                          setState(() {
                            _fruit = value;
                          });
                        },
                      ),
                    ),
                    Container(
                      color: Colors.grey,
                      height: 50,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: ListTile(
                  title: const Text('Kpay'),
                  leading: Radio<Fruit>(
                    value: Fruit.Kpay,
                    groupValue: _fruit,
                    onChanged: (Fruit? value) {
                      setState(() {
                        _fruit = value;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              const Text("Write Message"),
              const SizedBox(height: 15,),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.cyan.withOpacity(0.3),
                ),
                height: 150,
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Write Your Message",
                    border: InputBorder.none,
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
List<String> options = [
  "WavePay",
  "Kpay",
];