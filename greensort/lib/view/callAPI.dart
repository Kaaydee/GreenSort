import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:greensort/view/scanResult.dart';
import 'package:greensort/widgets/BottomappBar.dart';
import 'package:greensort/widgets/scanpageAppbar.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  Uint8List? _selectedImage;
  int earnedPoints = 0;

  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null && result.files.single.bytes != null) {
      setState(() {
        _selectedImage = result.files.single.bytes;
      });
    }
  }

  Future<void> _uploadImageToApi(Uint8List imageBytes, String fileName) async {
    const String apiUrl = 'http://waste-sorting.tiendungcorp.com/predict/';
    try {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      request.files.add(http.MultipartFile.fromBytes(
        'file',
        imageBytes,
        filename: fileName,
      ));

      var response = await request.send();
      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);

        // Điều hướng đến trang ScanResultPage với dữ liệu API
        final int? resultPoints = await Navigator.push<int>(
          context,
          MaterialPageRoute(
            builder: (context) => ScanResultPage(
              image: _selectedImage!,
              result: jsonResponse['predicted_class'],
              accur:
                  "${(jsonResponse['confidence'] * 100).toStringAsFixed(2)}%",
            ),
          ),
        ).then((resultPoints) {
          if (resultPoints != null) {
            Navigator.pop(context, 5);
          }
          return null;
        });

        // Cộng điểm vào earnedPoints nếu có điểm trả về
        if (resultPoints != null) {
          setState(() {
            earnedPoints += resultPoints;
          });
        }
      } else {
        throw Exception('Lỗi API: ${response.statusCode}');
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lỗi: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ScanAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          // Container hiển thị ảnh
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2.0),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: _selectedImage != null
                ? Image.memory(
                    _selectedImage!,
                    fit: BoxFit.cover,
                  )
                : const Center(
                    child: Text(
                      'Chưa chọn ảnh',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
          ),
          const SizedBox(height: 20),

          // Nút bấm chọn ảnh
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: _pickImage,
                icon: const Icon(
                  Icons.photo_library,
                  color: Colors.white,
                ),
                label: const Text(
                  'Tải từ thư viện',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Chức năng chụp ảnh chưa được thêm!'),
                  ));
                },
                icon: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
                label: const Text(
                  'Chụp ảnh',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),

          // Nút bấm quét
          ElevatedButton(
            onPressed: _selectedImage != null
                ? () {
                    _uploadImageToApi(_selectedImage!, 'uploaded_image.jpg');
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Text(
              'Quét',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottonappBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Mở ScanPage và nhận lại điểm sau khi quét
          final int? result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ScanPage(),
            ),
          );

          // Nếu có điểm trả về, cập nhật state
          if (result != null) {
            setState(() {
              earnedPoints += result; // Cộng thêm điểm
            });
          }
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.center_focus_strong),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
