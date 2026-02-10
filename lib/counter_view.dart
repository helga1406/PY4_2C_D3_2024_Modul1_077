import 'package:flutter/material.dart';
import 'counter_controller.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  final CounterController _controller = CounterController();
  
  double _sliderValue = 1.0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LogBook: Versi SRP"),
        backgroundColor: const Color.fromARGB(255, 233, 196, 221),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // --- TOTAL HITUNGAN ---
              const Text("Total Hitungan:", style: TextStyle(fontSize: 18)),
              Text(
                '${_controller.value}',
                style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
              ),
              
              const SizedBox(height: 30),

              // --- SLIDER ---
              Text(
                "Atur Nilai Step: ${_sliderValue.round()}", 
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              
              const SizedBox(height: 10),
              
              Slider(
                value: _sliderValue,
                min: 1,
                max: 20, 
                divisions: 19, 
                label: _sliderValue.round().toString(),
                activeColor: const Color.fromARGB(255, 167, 89, 142),
                onChanged: (double value) {
                  setState(() {
                    _sliderValue = value;
                    
                    _controller.setStep(value.toInt()); 
                  });
                },
              ),
              
              const SizedBox(height: 30),

              // --- TOMBOL AKSI ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () => setState(() => _controller.decrement()),
                    backgroundColor: const Color.fromARGB(255, 156, 71, 80),
                    child: const Icon(Icons.remove, color: Colors.black),
                  ),
                  FloatingActionButton(
                    onPressed: () => setState(() => _controller.reset()),
                    backgroundColor: const Color.fromARGB(255, 175, 172, 147),
                    child: const Icon(Icons.refresh, color: Colors.black),
                  ),
                  FloatingActionButton(
                    onPressed: () => setState(() => _controller.increment()),
                    backgroundColor: const Color.fromARGB(255, 83, 121, 84),
                    child: const Icon(Icons.add, color: Colors.black),
                  ),
                ],
              ),

              const SizedBox(height: 40),
              
              // --- RIWAYAT ---
              const Text("Riwayat Aktivitas (Maks 5):", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey), 
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[50],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _controller.history.isEmpty
                      ? [const Center(child: Text("Belum ada data", style: TextStyle(color: Colors.grey)))]
                      : _controller.history.map((data) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text("• $data", style: const TextStyle(fontSize: 16)),
                          );
                        }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}