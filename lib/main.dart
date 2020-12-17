import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
	Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Himawari',
        theme: ThemeData(
            primarySwatch: Colors.orange,
        ),
        darkTheme: ThemeData.dark(),
        builder: (context, child) {
            return CupertinoTheme(
                data: CupertinoThemeData(),
                child: Material(child: child),
            );
        },
        home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    void initState() {
        super.initState();
    }

	Widget _buildRow(int i) {
		return ListTile(
			title: Text('Word'),
		);
	}
			

	Widget _buildList() {
		return ListView.builder(
			padding: EdgeInsets.all(16.0),
			itemBuilder: (context, i) {
				if (i.isOdd) return Divider();

				return _buildRow(i);
			});
	}

    Widget _buildIos(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Guess'),
			),
			body: _buildList(),
		);
	}
	
	@override
	Widget build(context) {
    	return PlatformWidget(
        	//androidBuilder: _buildAndroid,
        	iosBuilder: _buildIos,
    	);
  	}
}

class PlatformWidget extends StatelessWidget {
	const PlatformWidget({
	Key key,
    	@required this.iosBuilder,
  	})  : 
	assert(iosBuilder != null),
	super(key: key);
	final WidgetBuilder iosBuilder;

    @override
    Widget build(context) {
        return iosBuilder(context);
    }
}
