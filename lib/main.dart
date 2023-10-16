import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskScreen(),
    );
  }
}

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final List<Map<String, String>> _items = [];

  void _addItem() {
    if (_titleController.text.isEmpty || _descriptionController.text.isEmpty) return;
    setState(() {
      _items.add({
        'title': _titleController.text,
        'description': _descriptionController.text,
      });
    });
    _titleController.clear();
    _descriptionController.clear();
  }

  void _deleteItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  void _showEditDialog(int index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the bottom sheet to expand with content
      builder: (ctx) {
        final _editTitleController = TextEditingController(text: _items[index]['title']);
        final _editDescriptionController = TextEditingController(text: _items[index]['description']);
        return Padding(
          padding: EdgeInsets.only(
            top: 12.0,
            left: 12.0,
            right: 12.0,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 10.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _editTitleController,
                decoration: InputDecoration(labelText: 'Edit Title'),
              ),
              TextField(
                controller: _editDescriptionController,
                decoration: InputDecoration(labelText: 'Edit Description'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _items[index]['title'] = _editTitleController.text;
                    _items[index]['description'] = _editDescriptionController.text;
                  });
                  Navigator.of(ctx).pop();
                },
                child: Text('Save Changes'),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 8,
        actions: [IconButton(icon: Icon(Icons.search, color: Colors.black), onPressed: () {})],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Add Title',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF45C6C6)),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Add Description',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF45C6C6)),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addItem,
              child: Text('Add'),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepOrange, // Set the background color to orange
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (ctx, index) => ListTile(
                  title: Text(_items[index]['title']!),
                  subtitle: Text(_items[index]['description']!),
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text('Alert'),
                        content: Text('Choose an option'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                              _showEditDialog(index);
                            },
                            child: Text('Edit', style: TextStyle(color: Color(0xFF45C6C6)),),
                          ),
                          TextButton(
                            onPressed: () {
                              _deleteItem(index);
                              Navigator.of(ctx).pop();
                            },
                            child: Text('Delete', style: TextStyle(color: Color(0xFF45C6C6)),),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
