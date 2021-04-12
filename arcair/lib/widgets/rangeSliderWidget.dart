import 'package:flutter/material.dart';

//Slider widgetın özelleştirilmesi, deviceDetailPage de kullanıldı
class RangeSliderWidget extends StatefulWidget {
  final int divisions;  //sliderin bölümleme sayısı
  final double min, max;  // sliderın alabileceği min, max değerler
  final String sliderName;  // sliderın yanında yazacak değeri
  final double end, start; //kaydırıldıkca değişecek değerleri
  final Color sliderColor; //slider çubuk rengi

  RangeSliderWidget(
      {this.min,
      this.max,
      this.sliderName,
      this.divisions,
      this.end,
      this.start,
      this.sliderColor});

  @override
  _RangeSliderWidgetState createState() => _RangeSliderWidgetState(start, end);
}

class _RangeSliderWidgetState extends State<RangeSliderWidget> {
  double start = 0, end = 0;
  _RangeSliderWidgetState(double start, double end) {  //değişen değerlerin yapıcısı
    this.start = start;
    this.end = end;
  }
  double sliderStart = 0.0;  //slider başlangıçları
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
          Text(
            widget.sliderName,
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: RangeSlider(
              min: widget.min,
              max: widget.max,
              values: selectRange,
              divisions: widget.divisions,
              inactiveColor: Colors.blueGrey,
              activeColor: widget.sliderColor,
              labels: RangeLabels(
                selectRange.start.round().toString(),
                selectRange.end.round().toString(),
              ),
              onChanged: (RangeValues newRange) {
                setState(() {
                  selectRange = newRange;
                });
              },
            ),
          ),
          Text(
            widget.max.toInt().toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
