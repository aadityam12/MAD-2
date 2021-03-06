
import 'package:awesome_contact_app/contact_details_view.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import 'contact_model.dart';

class Homeview extends StatelessWidget {
  Homeview({ Key? key }) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  final List<Map<String,String>>data =
  [
	{
		"name": "Rakshita Danee",
		"phone": "1234569875",
		"email": "alex@gmail.com",
		"region": "Mulund",
		"country": "India"
	},
	{
		"name": "Yash Raje",
		"phone": "1235469876",
		"email": "lectus.pede@gmail.com",
		"region": "Thane",
		"country": "India"
	},
	{
		"name": "Thor Odin's sons",
		"phone": "(322) 372-8789",
		"email": "thor@gmail.com",
		"region": "Samsun",
		"country": "Galaxy"
	},
	{
		"name": "Ayub Choudhari",
		"phone": "8773991647",
		"email": "ayub@gmail.com",
		"region": "kurla",
		"country": "India"
	},
	{
		"name": "Venkatesh reddy",
		"phone": "7555545732",
		"email": "venky@gmail.com",
		"region": "Kalyan",
		"country": "India"
	},
	{
		"name": "Janhavi mhatre",
		"phone": "9442562684",
		"email": "janu@gmail.com",
		"region": "Nehru Nagar",
		"country": "India"
	},
	{
		"name": "Guddu",
		"phone": "1263355676",
		"email": "vitae@gmail.com",
		"region": "Thane",
		"country": "India"
	},
	{
		"name": "Aseem",
		"phone": "1445678974",
		"email": "aseem@gmail.com",
		"region": "Mulund",
		"country": "India"
	},
	{
		"name": "Ruchita",
		"phone": "4775607527",
		"email": "ruchi@gmail.com",
		"region": "Dadar",
		"country": "India"
	},
	{
		"name": "Tumil",
		"phone": "8814678342",
		"email": "sem@gmail.com",
		"region": "Mumbai",
		"country": "India"
	}
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: const Text('My Contacts' ,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,
        color: Colors.black),),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Center(
              child: CircleAvatar(radius: 25,
              backgroundImage: AssetImage('assets/avatar.jpg'),),
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15)),
                hintText: 'Search by name or number',
                prefixIcon: const Icon(Icons.search)
          ),
        
        ),
        ),
      ),
     ), 
     body: SafeArea(
       child: ListView(
       controller: _scrollController,
       children: [
       const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('Recent', 
           style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
           ),
        ),
       ListView.separated(
         controller: _scrollController,
         shrinkWrap: true,
         itemBuilder: (context,index){
            return  ListTile(
              onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (context){
  return ContactDetailsView(contact: Contact(country: 'India', email: 'alex@gmail.com',
  name: 'Rakshita',
  phone: '1234569875',
  region: 'Mulund'));
}));
              },
           leading: const CircleAvatar(
             radius: 25,
             backgroundImage: AssetImage('assets/person1.jpg'),
           ),
           title: const Text(
             'Rakshita',
             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
           ),
           subtitle: const Text('1234569875'),
           trailing: const IconButton(onPressed: null, icon: Icon(Icons.more_horiz)),
         );
           },
           separatorBuilder: (context,index){
             return  const Divider(
           indent: 25,
           thickness: 2,
             );
           },
           itemCount: 3),     
           const Padding(
             padding: EdgeInsets.symmetric(horizontal: 16),
             child: Text('Contacts',
             style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
           ),
           GroupedListView<Map<String,String>,String>(
             shrinkWrap: true,
             elements:data,
    groupBy: (element) => element['name'].toString().substring(0,1),
    groupSeparatorBuilder: (String groupByValue) => 
    SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding:const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          groupByValue.substring(0,1),
          textAlign: TextAlign.right,
          style: 
          const TextStyle(fontWeight: FontWeight.w600, fontSize: 18 ),
          ),
      ),
      ),
    itemBuilder: (context, Map<String,String> element) {
      Contact contact = Contact.fromJson(element);
      return Column(
      children: [
        ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
           return ContactDetailsView(contact: contact,);
           },));
          },
               leading: const CircleAvatar(
                 radius: 25,
                 backgroundImage: AssetImage('assets/person1.jpg'),
               ),
               title: Text(
                 '${element['name']}',
                 style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
               ),
              subtitle: Text('${element['phone']}'),
              trailing:
               const IconButton(onPressed: null, icon: Icon(Icons.more_horiz),),),
              const Divider(
           indent: 25,
           thickness: 2,
              )
      ],
    );
    },
    
    itemComparator: (item1, item2) => 
    item1['name']!.compareTo(item2['name']!), // optional
    useStickyGroupSeparators: true, // optional
    floatingHeader: true, // optional
    order: GroupedListOrder.ASC, // optional
  ),
       ],
     ),
     ),
     floatingActionButton: const FloatingActionButton(
       backgroundColor: Color(0xff1A4ADA),
       onPressed: null,
       child: Icon(Icons.video_call),),
        );
  }
}