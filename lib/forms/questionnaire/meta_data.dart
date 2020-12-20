
import 'package:absapp/resources/previous_data.dart';
import 'package:absapp/screens/interview/interview_dao.dart';
import 'package:absapp/screens/interview/interview_screen.dart';
import 'package:absapp/screens/questionaire/questionnaire.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:search_widget/search_widget.dart';

class MetaDataForm extends StatefulWidget {
  final String interview_id;

  MetaDataForm({this.interview_id});

  @override
  _MetaDataFormState createState() => _MetaDataFormState(interview_id);
}

class _MetaDataFormState extends State<MetaDataForm> {
  
  _MetaDataFormState(this.interview_id);
  var year = DateTime.now().year;
  final String interview_id;
  FirebaseUser _user;
  String coop_union;
  String prime_coop ;
  dynamic prime_coop_list ;
  bool prime_coop_show = false;
  bool first_interview_show = false;
  String householdId;
  String firstInterview;
  String latitude;
  String longitude;
  String _user_email, _user_id;
  bool _test ;

  int _3_index;
  TextEditingController _householdIdController = TextEditingController();
  TextEditingController _latitudeController = TextEditingController();
  TextEditingController _longitudeController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  InterviewDao _metaDataDao = InterviewDao();
  PreviousData previousData = PreviousData();
  List previousDataList;
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  //Initial values

  List<LeaderBoard> list = <LeaderBoard>[
    
  ];

  LeaderBoard _selectedItem;

  @override
  void initState() {
    householdId = '00';
    prime_coop_list = ['Select'];
    coop_union = 'Select';
    prime_coop = 'Select';
    _test = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    

  bool _show = true;
    this._user = ModalRoute.of(context).settings.arguments;
    
    _user_email = _user.email;
    _user_id = _user.uid;
    DateTime now = DateTime.now();
    _dateController.text = DateFormat('dd/MM/yyyy').format(now);
    _timeController.text = DateFormat('kk:mm').format(now);
    _longitudeController..text = '28.3401225';
    _latitudeController..text = '-15.4681359';
    Map questions = Questionaire.metaData[0];
    return SafeArea(
        child: SingleChildScrollView(
            child: Column(
      children: <Widget>[
        Text('START INTERVIEW',
            style:
                Theme.of(context).textTheme.subtitle2.copyWith(fontSize: 26)),
        Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 12),
                Text('${questions['_1'][0]}',
                    style: Theme.of(context).textTheme.headline5.copyWith()),
                SizedBox(height: 6),
                DropdownButton(
                  value: coop_union,
                  items: questions['_1'][1]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      coop_union = newValue;
                      prime_coop = 'Select';
                      if(coop_union == 'Balaka'){
                        prime_coop_list = questions['_2'][1][0]['Balaka'];
                      }if(coop_union == 'Fisenge'){
                        prime_coop_list = questions['_2'][1][2]['Fisenge'];
                      }if(coop_union == 'Chibombo'){
                        prime_coop_list = questions['_2'][1][1]['Chibombo'];
                      }if(coop_union == 'Kwanshama'){
                        prime_coop_list = questions['_2'][1][3]['Kwanshama'];
                      }if(coop_union == 'Liteta'){
                        prime_coop_list = questions['_2'][1][4]['Liteta'];
                      }if(coop_union == 'Mufulira'){
                        prime_coop_list = questions['_2'][1][5]['Mufulira'];
                      }
                      prime_coop_show = true;
                      _householdIdController.clear();
                      _3_index = -1;
                      first_interview_show = false;
                    });
                  },
                  underline: SizedBox(),
                  //isExpanded: true,
                ),
                Text('${questions['_2'][0]}',
                    style: Theme.of(context).textTheme.headline5.copyWith()),
                SizedBox(height: 6),
                Visibility(
                  visible: prime_coop_show,
                  child: DropdownButton(
                    value: prime_coop,
                    items: prime_coop_list
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String newValue) {
                      setState(() {
                        prime_coop = newValue;
                        first_interview_show = true;
                        print('${_user.email} === ${createHouseholdId(_user_email)}');

                      });
                    },
                    underline: SizedBox(),
                    //isExpanded: true,
                  )),
                Text('${questions['_3'][0]}',
                    style: Theme.of(context).textTheme.headline5.copyWith()),
                SizedBox(height: 6),
                Visibility(
                  visible: first_interview_show,
                  child: Wrap(
                    spacing: 8,
                    children: List<Widget>.generate(
                      questions['_3'][1].length,
                      (int index) {
                        return ChoiceChip(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          label: Text(questions['_3'][1][index]),
                          selected: _3_index == index,
                          onSelected: (bool selected) {
                            setState(() {
                              firstInterview = questions['_3'][1][index];
                              
                              _3_index = selected ? index : null;
                              if(firstInterview == 'No'){
                                _householdIdController.clear();
                                  previousDataList= previousData.getData(coop_union); 
                                  createSearchFormList(previousDataList);
                              }else{
                                householdId = createHouseholdId(_user_email);
                                _householdIdController..text = householdId;
                              }
                              
                            });
                          },
                        );
                      },
                    ).toList(),
                  )),
                  if (firstInterview == 'No')
                    SearchWidget<LeaderBoard>(
                      dataList: list,
                      hideSearchBoxWhenItemSelected: true,
                      listContainerHeight: MediaQuery.of(context).size.height / 4,
                      queryBuilder: (query, list) {
                        return list
                            .where((item) => item.username
                                .toLowerCase()
                                .contains(query.toLowerCase()))
                            .toList();
                      },
                      popupListItemBuilder: (item) {
                        return PopupListItemWidget(item);
                      },
                      selectedItemBuilder: (selectedItem, deleteSelectedItem) {
                        return SelectedItemWidget(selectedItem, deleteSelectedItem);
                      },
                      // widget customization
                      noItemsFoundWidget: NoItemsFound(),
                      textFieldBuilder: (controller, focusNode) {
                        return MyTextField(controller, focusNode);
                      },
                      onItemSelected: (item) {
                        setState(() {
                          _selectedItem = item;
                          _householdIdController..text = _selectedItem.household_id;
                        });
                      },
                    ),
                SizedBox(height: 12),
                Text('${questions['_4'][0]}',
                    style: Theme.of(context).textTheme.headline5.copyWith()),
                SizedBox(height: 6),
                TextFormField(
                  controller: _householdIdController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value.isEmpty) return 'Field cannot be blank';
                    return null;
                  },
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: TextFormField(
                        controller: _latitudeController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) return 'Field cannot be blank';
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Latitude",
                        ),
                      ),
                    ),
                    SizedBox(width: 6),
                    Flexible(
                      child: TextFormField(
                        controller: _longitudeController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) return 'Field cannot be blank';
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Longitude",
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: TextFormField(
                        controller: _dateController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) return 'Field cannot be blank';
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Date",
                        ),
                      ),
                    ),
                    SizedBox(width: 6),
                    Flexible(
                      child: TextFormField(
                        controller: _timeController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) return 'Field cannot be blank';
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Time",
                        ),
                      ),
                    ),
                  ],
                ),
                Row(children: <Widget> [
                  Text('Test',
                    style: Theme.of(context).textTheme.headline5.copyWith()),
                  Switch(value: _test, onChanged:(value){
                  setState(() {
                    _test = value;
                  });
                  })
                ])
                
              ],
            )),
            
        SizedBox(height: 20),
        SizedBox(
          
          width: 500,
          child: RaisedButton(
            child: Text("Submit"),
            onPressed: _submitForm,
          ),
        )
      ],
    )
    
    ),
    
    );
  }

  void createSearchFormList(List dataList) {
    List<LeaderBoard> list2 = [];
    for (var i = 0; i < dataList.length; i++) {
  // TO DO
      var currentElement = dataList[i];
      //print('QQQQQQQ${currentElement}QQQQ');
      list2.insert(i, LeaderBoard(currentElement['sections']['sec_1']['_1'], 
                                  currentElement['year_'].toString(), currentElement['meta_data']['prime_coop'], 
                                  currentElement['interview_id'], currentElement['household_id']));
    }
    setState(() {
      list = list2;
    });
    
  }

  void showTopShortToast() {
    Fluttertoast.showToast(
        msg: "Select First Interview",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1);
  }
  
  void _submitForm() async {
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a Snackbar.
      String year_ = DateTime.now().year.toString();
      if(firstInterview != null){
        Map metaData = {
          'interview_id': interview_id,
          'houshold_id': _householdIdController.text,
          'coop_union': coop_union,
          'prime_coop': prime_coop,
          'first_interview': firstInterview,
          'latitude': _latitudeController.text,
          'longitude': _longitudeController.text,
          'date_': _dateController.text,
          'time_': _timeController.text,
          'year': year_,
          'test': false
        };

        var interview = {
          'interview_id': interview_id,
          'household_id': _householdIdController.text,
          'user_email': _user_email,
          'user_id': _user_id,
          'question_number': '0',
          'year_': year_,
          'completed': false,
          'uploaded': '',
          'test': _test,
          'meta_data': metaData,
          'sections': {}
        };
        await _metaDataDao.writeToHive(interview, interview_id).then((value) =>
            {
             // Navigator.pushNamed(context, Interview.id, arguments: interview);
              Navigator.popAndPushNamed(context, Interview.id, arguments: interview)
              
              });
    }else{
      showTopShortToast();
      print('Hello word ${firstInterview}');
    }
    }
  }

  String createHouseholdId(String email){
      String userNo;
      String householdId;
      String coop;
      if(email == 'david@gmail.com'){
        userNo = '14';
      }
      coop = coop_union.substring(0, 3).toUpperCase();

      //householdId = coop+randomNumber()+'-'+userNo;
      householdId = coop+'-'+DateTime.now().millisecondsSinceEpoch.toString();
      return householdId;
  }


  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _metaDataDao.closeHive();
    _householdIdController.dispose();
    _latitudeController.dispose();
    _longitudeController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }
}

class LeaderBoard {
  LeaderBoard(this.username, this.year_, this.prime_coop, this.interview_id, this.household_id);

  final String username;
  final String year_;
  final String prime_coop;
  final String interview_id;
  final String household_id;
  
}

class SelectedItemWidget extends StatelessWidget {
  const SelectedItemWidget(this.selectedItem, this.deleteSelectedItem);

  final LeaderBoard selectedItem;
  final VoidCallback deleteSelectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 14,
      ),
      child: Row(
        
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
               // left: 16,
                //right: 16,
                top: 8,
                bottom: 8,
              ),
              child: Text(
                selectedItem.username,
                style: const TextStyle(fontSize: 14.0),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete_outline, size: 22),
            color: Colors.grey[700],
            onPressed: deleteSelectedItem,
          ),
        ],
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField(this.controller, this.focusNode);

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x4437474F),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          suffixIcon: Icon(Icons.search),
          border: InputBorder.none,
          hintText: "Enter respondant name",
          contentPadding: const EdgeInsets.only(
            left: 16,
            //right: 20,
            top: 14,
            //bottom: 14,
          ),
        ),
      ),
    );
  }
}

class NoItemsFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          Icons.folder_open,
          size: 24,
          color: Colors.grey[900].withOpacity(0.7),
        ),
        const SizedBox(width: 10),
        Text(
          "Respondant name not found, choose household unlisted",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[900].withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}

class PopupListItemWidget extends StatelessWidget {
  const PopupListItemWidget(this.item);

  final LeaderBoard item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget> [
          Text(
            item.username,
            style: const TextStyle(fontSize: 16),
            ),
          Text(
            item.prime_coop,
            style: const TextStyle(fontSize: 16),
            ),  
          Text(
            item.year_,
            style: const TextStyle(fontSize: 16),
            ),  
        ]
      ) 
      
      
    );
  }
}