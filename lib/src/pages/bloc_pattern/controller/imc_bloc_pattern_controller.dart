import 'dart:async';
import 'dart:math';

import '../class/imc_state.dart';

class ImcBlocPatternController {
  final _imcStreamController = StreamController<ImcState>.broadcast()..add(ImcState(imc: 0));

  Stream<ImcState> get imcOut => _imcStreamController.stream;

  Future<void> calcularImc({required double peso, required double altura}) async {
    try {
      _imcStreamController.add(ImcStateLoading());

      await Future.delayed(const Duration(seconds: 1));

      final imc = peso / pow(altura, 2);

      throw Exception('Erro ao calcular IMC');

      // ignore: dead_code
      _imcStreamController.add(ImcState(imc: imc));
    } on Exception catch (e) {
      _imcStreamController.add(ImcStateError(message: e.toString()));
    }
  }

  void dispose() {
    _imcStreamController.close();
  }
}
