import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../commons/k_header.dart';
import '../../theme/style.dart';
import '../composants/project_data.dart';

class Tachespage extends StatefulWidget {
  @override
  _TachespageState createState() => _TachespageState();
}

class _TachespageState extends State<Tachespage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("listes des taches"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [

            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: projects.length,
              separatorBuilder: (context, index) => SizedBox(height: 15), // Add space between containers
              itemBuilder: (context, index) {
                var project = projects[index];
                return Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: KColors.secondary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ExpansionTile(
                    title: Text(project.title, style: KTypography.h5(context, color: KColors.tertiary)),
                    children: project.tasks.map<Widget>((task) {
                      return ListTile(
                        title: Text(task.description),
                        trailing: Checkbox(
                          value: task.isCompleted,
                          onChanged: (value) {
                            setState(() {
                              task.isCompleted = value!;
                            });
                          },
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}