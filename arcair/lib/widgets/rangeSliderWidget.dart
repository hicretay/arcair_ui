import 'package:flutter/material.dart';

//Slider widgetın özelleştirilmesi, deviceDetailPage de kullanıldı
class RangeSliderWidget extends StatefulWidget {
  final int divisions;  //sliderin bölümleme sayısı
  final double min, max;  // sliderın alabileceği min, max değerler
  final String sliderName;  // sliderın yanında yazacak değeri
  final double end, start; //kaydırıldıkca değişecek değerleri
  final Color sliderColor; //slider çubuk rengi

//----Değişken Constructoları-------
  RangeSliderWidget(
      {this.min,
      this.max,
      this.sliderName,
      this.divisions,
      this.end,
      this.start,
      this.sliderColor});
//-----------------------------------

  @override
  _RangeSliderWidgetState createState() => _RangeSliderWidgetState(start, end);
}

class _RangeSliderWidgetState extends State<RangeSliderWidget> {
  //-----------Başlangıçta işaretlenecek start-end değerleri------------
  double start = 0, end = 0;
  _RangeSliderWidgetState(double start, double end) {  
    this.start = start;
    this.end = end;
  }
  double sliderStart = 0.0;  //slider başlangıçları
  //--------------------------------------------------------------
  var selectRange;
  @override
  void initState() {
    selectRange = RangeValues(start, end);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Row(
        children: [
          //----------Slider Adı------------------
          Text(
            widget.sliderName,
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          //-----------------------------------------
          Expanded(
            //----------Slider Görünümü----------------
            child: RangeSlider(
              min: widget.min,
              max: widget.max,
              values: selectRange,
              divisions: widget.divisions,
              inactiveColor: Colors.blueGrey,
              activeColor: widget.sliderColor,
              labels: RangeLabels( //Slider başlıkları, strine çevirme
                selectRange.start.round().toString(),
                selectRange.end.round().toString(),
              ),
              //--------Kaydırıldığında olacak olaylar---------
              onChanged: (RangeValues newRange) {
                setState(() {
                  selectRange = newRange;
                });
              },
              //---------------------------------------------
            ),
            //------------------------------------------------
          ),
          //---Slider sonuna max değerinin yazılması------
          Text(
            widget.max.toInt().toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          //----------------------------------------------
        ],
      ),
    );
  }
}
