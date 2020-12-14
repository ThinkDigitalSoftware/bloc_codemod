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
  void visitConstructorDeclaration(ConstructorDeclaration node) {}

  @override
  void visitDeclaration(Declaration node) {}
}
