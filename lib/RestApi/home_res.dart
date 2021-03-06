import 'package:chat/RestApi/models/data.dart';
import 'package:chat/RestApi/models/user.dart';
import 'package:chat/RestApi/utils/dio_client.dart';
import 'package:chat/RestApi/widgets/create_user.dart';
import 'package:chat/RestApi/widgets/fetch_user.dart';
import 'package:chat/RestApi/widgets/update_user.dart';
import 'package:chat/theme/colorplt.dart';
import 'package:flutter/material.dart';

class HomeRes extends StatefulWidget {
  const HomeRes({Key? key}) : super(key: key);

  @override
  _HomeResState createState() => _HomeResState();
}

class _HomeResState extends State<HomeRes> {
  final DioClient _client = DioClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
        backgroundColor: primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'POST',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CreateUser(),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                child: Text(
                  'GET & DELETE',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FetchUser(),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  'UPDATE',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              UpdateUser(),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                child: Text(
                  'GET (auto fetch)',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: FutureBuilder<User?>(
                  future: _client.getUser(id: '2'),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      User? userInfo = snapshot.data;

                      if (userInfo != null) {
                        Data userData = userInfo.data;

                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.network(userData.avatar),
                            SizedBox(height: 8.0),
                            Text(
                              '${userInfo.data.firstName} ${userInfo.data.lastName}',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Text(
                              userData.email,
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        );
                      }
                    }
                    return CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(primary!),
                    );
                    
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
