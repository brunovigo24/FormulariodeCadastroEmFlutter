import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class MeuFormulario extends StatefulWidget {
  @override
  _MeuFormularioState createState() => _MeuFormularioState();
}

class _MeuFormularioState extends State<MeuFormulario> {
  final _formKey = GlobalKey<FormState>();
  String _nome = '';
  String _email = '';
  String _senha = ''; // Adicione o campo de senha

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Campo de nome
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira seu nome';
                  }
                  return null;
                },
                onSaved: (value) {
                  _nome = value!;
                },
              ),
              // Campo de email
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (!EmailValidator.validate(value!)) {
                    return 'Por favor, insira seu email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              // Campo de senha
              TextFormField(
                decoration: InputDecoration(labelText: 'Senha'),
                obscureText: true, // Para ocultar a senha
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira sua senha';
                  }
                  // Você pode adicionar critérios adicionais de validação da senha aqui.
                  // Por exemplo, verificar se a senha tem um comprimento mínimo.
                  // if (value.length < 6) {
                  //   return 'A senha deve ter pelo menos 6 caracteres';
                  // }
                  return null;
                },
                onSaved: (value) {
                  _senha = value!;
                },
              ),
              SizedBox(height: 16.0), // Espaçamento entre os campos e o botão
              // Botão Enviar
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    // Aqui você pode fazer algo com os dados do formulário, por exemplo, enviá-los para um servidor.
                    // Neste exemplo, exibiremos um diálogo de confirmação.

                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Dados do formulário'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Nome: $_nome'),
                              Text('Email: $_email'),
                              Text('Senha: $_senha'), // Exibir senha no diálogo
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Fechar'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
