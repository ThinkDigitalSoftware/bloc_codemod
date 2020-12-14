import 'package:codemod/codemod.dart';
import 'package:analyzer/analyzer.dart';

class BlocSuggester extends GeneralizingAstVisitor
    with AstVisitingSuggestorMixin {
  @override
  // not used
  dynamic visitFunctionDeclarationStatement(FunctionDeclarationStatement node) {
    // TODO: implement visitFunctionDeclarationStatement
    return super.visitFunctionDeclarationStatement(node);
  }

  @override
  // * used
  dynamic visitFunctionDeclaration(FunctionDeclaration node) {
    // TODO: implement visitFunctionDeclaration
    return super.visitFunctionDeclaration(node);
  }

  @override
  // not used
  dynamic visitFunctionExpression(FunctionExpression node) {
    // TODO: implement visitFunctionExpression
    return super.visitFunctionExpression(node);
  }

  @override
  // not used
  dynamic visitBlockFunctionBody(BlockFunctionBody node) {
    return super.visitBlockFunctionBody(node);
  }

  @override
  // not used
  dynamic visitExpressionFunctionBody(ExpressionFunctionBody node) {
    return super.visitExpressionFunctionBody(node);
  }

  @override
  dynamic visitExpression(Expression node) {}

  @override
  void visitConstructorDeclaration(ConstructorDeclaration node) {
    if (node.factoryKeyword == null) {
      return;
    }

    final body = node.body.toSource();
    if (!body.startsWith(RegExp(r'\{if\s?\(json'))) {
      final updatedText = '{\nif (json == null) {\n'
          'return null;\n'
          '}'
          ' ${body.replaceFirst(RegExp(r'^=> '), '\nreturn ')}\n}';
      yieldPatch(node.body.offset, node.body.endToken.offset + 1, updatedText);
    }
  }

  @override
  void visitDeclaration(Declaration node) {}
}
