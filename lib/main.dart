import 'package:flutter/material.dart';

void main() {
  runApp(const RegistroPedidosApp());
}

class RegistroPedidosApp extends StatelessWidget {
  const RegistroPedidosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registro de Pedidos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const ListaPedidosPage(),
    );
  }
}

class ListaPedidosPage extends StatefulWidget {
  const ListaPedidosPage({super.key});

  @override
  State<ListaPedidosPage> createState() => _ListaPedidosPageState();
}

class _ListaPedidosPageState extends State<ListaPedidosPage> {
  final List<String> pedidos = [];

  void _agregarPedido(String pedido) {
    setState(() {
      pedidos.add(pedido);
    });
  }

  void _mostrarFormulario() {
    String nuevoPedido = '';
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Nuevo Pedido'),
        content: TextField(
          onChanged: (value) => nuevoPedido = value,
          decoration: const InputDecoration(hintText: 'Nombre del pedido'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              if (nuevoPedido.isNotEmpty) {
                _agregarPedido(nuevoPedido);
                Navigator.pop(context);
              }
            },
            child: const Text('Agregar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos Registrados'),
      ),
      body: pedidos.isEmpty
          ? const Center(child: Text('No hay pedidos aún.'))
          : ListView.builder(
              itemCount: pedidos.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(pedidos[index]),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _mostrarFormulario,
        child: const Icon(Icons.add),
      ),
    );
  }
}
