import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore_project/account/profile/profile/index.dart';
import 'package:mystore_project/config/config/config_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key key,
    @required ProfileBloc profileBloc,
  })  : _profileBloc = profileBloc,
        super(key: key);

  final ProfileBloc _profileBloc;

  @override
  ProfileScreenState createState() {
    return ProfileScreenState();
  }
}

class ProfileScreenState extends State<ProfileScreen> {
  ProfileScreenState();

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
        bloc: widget._profileBloc,
        builder: (
          BuildContext context,
          ProfileState currentState,
        ) {
          if (currentState is UnProfileState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorProfileState) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(currentState.errorMessage ?? 'Error'),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text('reload'),
                    onPressed: _load,
                  ),
                ),
              ],
            ));
          }
          if (currentState is InProfileState) {
            return SingleChildScrollView(
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  Center(
                    child: Container(
                      width: 100,
                      height: 100,
                      child: Hero(
                        tag:
                            "https://lh3.googleusercontent.com/-hdBoSkVmD_Y/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuclOcK2iS_dwGuwHbbjE1ahTi49uKQ/photo.jpg?sz=46",
                        child: CircleAvatar(
                          radius: 16,
                          backgroundImage: NetworkImage(
                              "https://lh3.googleusercontent.com/-hdBoSkVmD_Y/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuclOcK2iS_dwGuwHbbjE1ahTi49uKQ/photo.jpg?sz=46"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    BlocProvider.of<ConfigBloc>(context).username,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. In massa tempor nec feugiat nisl pretium fusce. Interdum varius sit amet mattis vulputate enim. Pulvinar neque laoreet suspendisse interdum consectetur. Sed id semper risus in hendrerit. Morbi tincidunt ornare massa eget egestas. Adipiscing commodo elit at imperdiet. A diam maecenas sed enim ut sem viverra aliquet eget. Malesuada proin libero nunc consequat interdum varius sit. Dictumst vestibulum rhoncus est pellentesque elit ullamcorper dignissim cras tincidunt. Mauris augue neque gravida in fermentum et sollicitudin ac.
Nascetur ridiculus mus mauris vitae ultricies leo integer malesuada nunc. In aliquam sem fringilla ut morbi tincidunt augue interdum velit. Facilisi morbi tempus iaculis urna id volutpat lacus laoreet. Eleifend quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus. Amet venenatis urna cursus eget nunc scelerisque. Vulputate odio ut enim blandit volutpat maecenas volutpat. Mauris cursus mattis molestie a iaculis at erat. Turpis egestas sed tempus urna. Volutpat commodo sed egestas egestas. Massa tincidunt dui ut ornare lectus sit. Posuere ac ut consequat semper viverra.'''),
                  )
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  void _load([bool isError = false]) {
    widget._profileBloc.add(LoadProfileEvent(isError));
  }
}
