import 'package:flutter/material.dart';
import 'package:untitled3/features/services/data/models/evc_service.dart';
import 'package:untitled3/features/services/presentation/controller/services_controller.dart';

class ServiceFormScreen extends StatelessWidget {
  final EVCService service;
  final ServicesController servicesController;

  const ServiceFormScreen({Key? key, required this.service ,
  required this.servicesController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    servicesController.initializeControllers(
      service.fields.where((field) => field.type == 'text').map((field) => field.name).toList(),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(service.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: service.fields.length,
          itemBuilder: (context, index) {
            final field = service.fields[index];
            switch (field.type) {
              case 'text':
                return TextField(
                  decoration: InputDecoration(
                    labelText: field.name,
                    border: OutlineInputBorder(),
                  ),
                  controller: servicesController.textControllers[field.name],
                );
              case 'radio':
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(field.name, style: TextStyle(fontWeight: FontWeight.bold)),
                    Row(
                      children: field.options!
                          .map((option) => Expanded(
                        child: RadioListTile(
                          title: Text(option),
                          value: option,
                          groupValue: null, // Bind this to a state variable if needed
                          onChanged: (value) {
                            // Handle value change
                          },
                        ),
                      ))
                          .toList(),
                    ),
                  ],
                );
              case 'file':
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(field.name, style: TextStyle(fontWeight: FontWeight.bold)),
                    ElevatedButton(
                      onPressed: () {
                        // Handle file picker logic
                      },
                      child: Text('Attach File'),
                    ),
                  ],
                );
              default:
                return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}