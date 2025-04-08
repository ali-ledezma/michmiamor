import 'package:flutter/material.dart';

void main() {
  runApp(WineApp());
}

class WineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Información del Vino',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Colors.pink[50],
      ),
      home: WineInfoPage(),
    );
  }
}

class WineInfoPage extends StatefulWidget {
  @override
  _WineInfoPageState createState() => _WineInfoPageState();
}

class _WineInfoPageState extends State<WineInfoPage> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(20)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            elevation: MaterialStateProperty.all<double>(5),
          ),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/vino5.png'), // Cambiado a vino3.png
                fit: BoxFit.cover,
              ),
            ),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOutQuad,
              width: _isExpanded ? 400 : 350,
              child: _isExpanded
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Vino Tinto Malbec',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink[800],
                          ),
                        ),
                        SizedBox(height: 20),
                        _buildAnimatedInfoRow(
                            'Variedad:', 'Malbec', Colors.pink[400]!),
                        _buildAnimatedInfoRow(
                            'Origen:', 'Mendoza, Argentina', Colors.pink[500]!),
                        _buildAnimatedInfoRow(
                            'Añada:', '2020', Colors.pink[600]!),
                        _buildAnimatedInfoRow(
                            'Alcohol:', '14% vol.', Colors.pink[700]!),
                        _buildAnimatedInfoRow(
                            'Azúcares:', '2 g/L', Colors.pink[800]!),
                        _buildAnimatedInfoRow(
                            'Calorías:', '70 kcal/100ml', Colors.pink[900]!),
                      ],
                    )
                  : Center(
                      child: Text(
                        'Presióname para descubrir',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          color: Colors.pink[800],
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.pink[100]!,
                              offset: Offset(5.0, 5.0),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedInfoRow(String label, String value, Color color) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: _isExpanded ? 1.0 : 0.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 16, color: Colors.pink[900]!),
            children: <TextSpan>[
              TextSpan(
                text: label,
                style: TextStyle(fontWeight: FontWeight.bold, color: color),
              ),
              TextSpan(text: ' $value'),
            ],
          ),
        ),
      ),
    );
  }
}
