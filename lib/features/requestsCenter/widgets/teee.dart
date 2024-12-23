import 'package:flutter/material.dart';


void main() {
  runApp(const RequestCenter());
}

class RequestCenter extends StatelessWidget {
  const RequestCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Request Center',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
                padding: const EdgeInsetsDirectional.only(end: 15),
                tooltip: 'Search',
              )
            ],
            centerTitle: true,
            backgroundColor: const Color(0xff715d44),
            iconTheme: const IconThemeData(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 55,
                child:  ChoiceChipExample(),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 30),
              _buildRequestCard(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRequestCard(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRequestHeader(),
            const SizedBox(height: 10),
            const Text(
              'Source For Real Estate / Committee Evaluation',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              'Date',
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
            const SizedBox(height: 15),
            _buildRequestDetails(),
          ],
        ),
      ),
    );
  }

  Widget _buildRequestHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Administrative Services',
          style: TextStyle(fontSize: 13, color: Colors.grey),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),
      ],
    );
  }

  Widget _buildRequestDetails() {
    return Row(
      children: [
        _buildRequestId(),
        const SizedBox(width: 35),
        _buildPendingOn(),
      ],
    );
  }

  Widget _buildRequestId() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Request ID',
          style: TextStyle(fontSize: 13, color: Colors.grey),
        ),
        Row(
          children: [
            const Text(
              'Req 1218421',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.copy, size: 18),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPendingOn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pending On',
          style: TextStyle(fontSize: 13, color: Colors.grey),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person, size: 18),
            ),
            const Text(
              'Ahmed Elhawari',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}



class ChoiceChipExample extends StatefulWidget {
  @override
  _ChoiceChipExampleState createState() => _ChoiceChipExampleState();
}

class _ChoiceChipExampleState extends State<ChoiceChipExample> {
  // Store the selected choice
  String selectedChoice = '';

  // List of options
  final List<String> options = [
    '',
    'All',
    'InProgress',
    'Approved',
    'Rejected',
    'Cancelled',
  ];

  // Icons corresponding to each option
  final List<IconData> optionIcons = [
    Icons.filter_alt_outlined,
    Icons.paste_rounded,
    Icons.access_time,
    Icons.check_circle_outline,
    Icons.cancel_outlined,
    Icons.block,
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: ChoiceChip(
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(optionIcons[index], size: 18),
                const SizedBox(width: 5),
                Text(options[index]),
              ],
            ),
            selected: selectedChoice == options[index],
            onSelected: (selected) {
              setState(
                    () {
                  selectedChoice = selected ? options[index] : '';
                },
              );
            },
            selectedColor: const Color(0xffF9F5ED),
            backgroundColor: Colors.grey[300],
            shape: index==0 ?const CircleBorder(): null,
            labelStyle:
            TextStyle(
              color: selectedChoice == options[index]
                  ? const Color(0xff715d44)
                  : Colors.black,
            ),
            showCheckmark: false,
          ),
        );
      },
    );
  }
}