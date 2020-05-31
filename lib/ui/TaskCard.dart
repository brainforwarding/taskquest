import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  final String title;
  final String description;
  final String subject;
  

  TaskCard(this.title, this.description, this.subject);
  
  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool completeStatus = false;
  Color backgroundColor;
  Color fontColor;
  String iconAddress;
  String buttonText;
  
// setState DONE
// ajustar iconos DONE
// ajustar fonts 
// eliminar botón DONE
// mover ícono a izquierda DONE
// cajas flexibles
  /*String getSubjectImage() { // cambiar ícono por subject
    if (widget.subject == 'math')
      //backgroundColor = Color(0xFFEEF7FE);
      return 'assets/images/mathLogo.png';
    else
      //backgroundColor = Color(0xFFFEEEEE);
      return 'assets/images/artLogo.png';
  } */

  // colors and logo by subject
  void colorVivid() { // colors by subject
    setState(() {
      buttonText = "Done!";
      if (widget.subject == 'math') {
        backgroundColor = Color(0xFFEEF7FE);
        fontColor = Color(0xFF415EB6);
        iconAddress = 'assets/images/mathLogo.png';
      }
      else if (widget.subject == 'arts') {
        backgroundColor = Color(0xFFFEEEEE);
        fontColor = Color(0xFFAC4040);
        iconAddress = 'assets/images/artLogo.png';
      }
      else if (widget.subject == 'hist') {
        backgroundColor = Color(0xFFFDF7E0);
        fontColor = Color(0xFFA57105);
        iconAddress = 'assets/images/histLogo.png';
      }
      else {
      // else if (widget.subject == 'sports') {
        backgroundColor = Color(0xFFF0FFFF);
        fontColor = Color(0xFF158E8E);
        iconAddress = 'assets/images/sportsLogo.png';
      }
    }
    );
  }

// make colors gray after clicking
  void colorDull() { // click gray colors
    setState(() {
      //print("making colors dull");
      buttonText = "Undo";
      backgroundColor = Color(0xFFEEEEEE);
      if (widget.subject == 'math') {
        iconAddress = 'assets/images/mathLogoDull.png';
        fontColor = Color(0x40415EB6);
      }
      else if (widget.subject == 'arts') {
        iconAddress = 'assets/images/artLogoDull.png';
        fontColor = Color(0x40AC4040);
      }
      else if (widget.subject == 'hist') {
        iconAddress = 'assets/images/histLogoDull.png';
        fontColor = Color(0x40A57105);
      }
      else {
      // else if (widget.subject == 'sports') {
        iconAddress = 'assets/images/sportsLogoDull.png';
        fontColor = Color(0x40158E8E);
      }
    }
    );
  }

// set initial colors based on status
  void initialColors() {
    print("subject is ");
    print(widget.subject);
    if (completeStatus == false) {
      print("colors will be vivid");
      setState(() {
        colorVivid();
      });
    }
    if (completeStatus == true) {
      print("colors will be dull");
      setState(() {
        colorDull();
      });
    }
  }

  void clearTask() {
    if (completeStatus == true) {
      setState(() {
        colorDull();
        completeStatus = false;
      });
    } else if (completeStatus == false) {
      setState(() {
        colorVivid();
        completeStatus = true;
      });
    }
  }

  // main content on left part of card
  /* final Flexible cardContent (
    child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Image.asset(
              iconAddress,
              height: 25,
              width: 25),
          new Text(widget.title,
              style: TextStyle(
                  color: fontColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,)),
          new Text(widget.description,
              style: TextStyle(
                  color: fontColor,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                  fontSize: 10)),      
        ],
      ),
  );

  // checkmark on right side of card
  final checkMark = new Container (
    child:    
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget> [
          Visibility(
            child:
              new Image.asset(
                  'assets/images/check.png',
                  height: 40,
                  width: 40),
            visible: completeStatus,
          ),
        ]
      ),
  ); */

  @override
  Widget build(BuildContext context) {
    initialColors();
    return new GestureDetector(
      onTap: (){
          print("Container clicked");
          clearTask();
      },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: new BorderRadius.circular(30.0)),
          child: Row(
            children: <Widget>[ 

            // First column for main content
            Flexible(
              child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Image.asset(
                        iconAddress,
                        height: 25,
                        width: 25),
                    new Text(widget.title,
                        style: TextStyle(
                            color: fontColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,)),
                    new Text(widget.description,
                        style: TextStyle(
                            color: fontColor,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            fontSize: 10)),      
                  ],
                ),
              ),

            // Second column for checkmark
            Container(
              child:    
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget> [
                    Visibility(
                      child:
                        new Image.asset(
                            'assets/images/check.png',
                            height: 40,
                            width: 40),
                      visible: completeStatus,
                    ),
                  ]
                ),
              ),
            ],
          ), 
        ) 
    );
  }
}
