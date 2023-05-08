import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proto_ikan/bloc/fish/fish_bloc.dart';
import 'package:proto_ikan/screen/main_screen/history_screen.dart';

import '../../screen/bottom_nav_bar_screen.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String textFieldValue = '';
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Daftar Lelang',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text('Harga Deposit'),
          const SizedBox(height: 10),
          TextField(
            onChanged: (value) {
              textFieldValue = value;
            },
            decoration: const InputDecoration(
              hintText: 'Harga Deposit',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
              'Salam, terima kasih telah berminat untuk bergabung dalam lelang kami. Untuk Harga depositnya sebesar 1 Juta Rupiah, Apakah anda ingin Melanjutkan Pendaftaran?'),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Show dialog loading after a slight delay
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return Dialog(
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Row(
                            children: const [
                              CircularProgressIndicator(),
                              SizedBox(width: 16),
                              Text('Loading...'),
                            ],
                          ),
                        ),
                      );
                    },
                  );

                  // Simulate a delay for the loading
                  Future.delayed(
                    const Duration(seconds: 2),
                    () {
                      // Close the dialog loading
                      Navigator.of(context).pop();

                      // Show the next dialog after the loading is finished
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            content: GestureDetector(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.close),
                                        ),
                                      ),
                                      Column(
                                        children: const [
                                          Icon(Icons.checklist_outlined),
                                          Text(
                                              'Di mohon kepada Peserta Lelang untuk melakukan pembayaran Deposit dengan batas waktu yang sudah ditentukan '),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const Text(
                                              'Untuk lebih lengkapnya silahkan pergi ke Riwayat'),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                MaterialPageRoute(
                                                  builder: (BuildContext
                                                          context) =>
                                                      const BottomNavBarScreen(
                                                    indexScreen: 2,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: const Text('RIWAYAT'),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
                child: const Text('Daftar Lelang'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
