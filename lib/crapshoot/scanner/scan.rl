%%{
  machine scanner;

  Number = digit+;

  Constant = Number;

  Drop = '^' | 'v';
  Series = Number 'd' Number Drop?;

  Arithmetic = '+' | '-' | '*' | '/';

  UnaryExpression = Series | Constant;
  BinaryExpression = UnaryExpression (space* Arithmetic space* UnaryExpression)+;
  Expression = UnaryExpression | BinaryExpression;

  main := Expression;
}%%