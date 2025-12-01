import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas8praktikum/themeprovider.dart';
import 'package:tugas8praktikum/username_provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<Themeprovider>(context);
    final usernameProvider = Provider.of<UsernameProvider>(context);

    TextEditingController controller =
        TextEditingController(text: usernameProvider.username);

    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.blue.shade600,
        centerTitle: true,
        title: const Text(
          'Pengaturan',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ------------------ CARD TEMA ------------------
            Card(
              color: colors.surface,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.dark_mode,
                            size: 26, color: colors.onSurface),
                        const SizedBox(width: 10),
                        Text(
                          "Mode Gelap",
                          style: TextStyle(
                            fontSize: 16,
                            color: colors.onSurface,
                          ),
                        ),
                      ],
                    ),
                    Switch(
                      activeColor: Colors.blue,
                      thumbColor: WidgetStateProperty.all(Colors.blue),
                      value: themeprovider.isDarkMode,
                      onChanged: (value) {
                        themeprovider.toggleTheme(value);
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            // ------------------ CARD USERNAME ------------------
            Card(
              color: colors.surface,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nama Pengguna",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: colors.onSurface,
                      ),
                    ),
                    const SizedBox(height: 10),

                    TextField(
                      controller: controller,
                      style: TextStyle(color: colors.onSurface),
                      decoration: InputDecoration(
                        hintText: "Masukkan nama...",
                        hintStyle: TextStyle(color: colors.onSurfaceVariant),
                        prefixIcon:
                            Icon(Icons.person, color: colors.onSurfaceVariant),
                        filled: true,
                        fillColor: colors.surfaceVariant,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade600,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          usernameProvider.saveUsername(controller.text);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Nama pengguna disimpan"),
                            ),
                          );
                        },
                        child: const Text(
                          "Simpan",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            // ------------------ TAMPILAN NAMA ------------------
            Card(
              color: colors.surface,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  children: [
                    Icon(Icons.account_circle,
                        size: 28, color: colors.onSurface),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Nama kamu: ${usernameProvider.username}",
                        style: TextStyle(fontSize: 16, color: colors.onSurface),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
