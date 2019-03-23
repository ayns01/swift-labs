/**
 *
 * Write a recursive function evaluate that accepts a string
 * representing a math expression and computes its value.
 * - The expression will be "fully parenthesized" and will
 *   consist of + and * on single-digit integers only.
 * - You can use a helper function. (Do not change the original function header)
 * - Recursion
 *
 * evaluate("7")                 -> 7
 * evaluate("(2+2)")             -> 4
 * evaluate("(1+(2*4))")         -> 9
 * evaluate("((1+3)+((1+2)*5))") -> 19
 *
 */
func evaluate(expr: String) -> Int {
    var plus:Int = -1;
    var times:Int = -1;
    var level:Int = 0;
    
    for i in 0..<expr.count
    {
        let index = expr.index(expr.startIndex, offsetBy: i)
        
        if (expr[index] == "+" && level==0) { plus = i }
        if (expr[index] == "*" && level==0) { times = i }
        
        if (expr[index] == "(") { level += 1 }
        if (expr[index] == ")") { level -= 1 }
    }
    
    if (plus != -1) {
        let exprLeft:String = String(expr[expr.startIndex..<expr.index(expr.startIndex, offsetBy: plus)])
        let exprRight:String = String(expr[expr.index(expr.startIndex, offsetBy: plus+1)..<expr.endIndex])
        let valueLeft:Int = evaluate(expr: exprLeft);
        let valueRight:Int = evaluate(expr: exprRight);
        
        return valueLeft + valueRight;
    }
    else if (times != -1) {
        let exprLeft:String = String(expr[expr.startIndex..<expr.index(expr.startIndex, offsetBy: times)])
        let exprRight:String = String(expr[expr.index(expr.startIndex, offsetBy: times+1)..<expr.endIndex])
        let valueLeft:Int = evaluate(expr: exprLeft);
        let valueRight:Int = evaluate(expr: exprRight);
        
        return valueLeft * valueRight;
    }
    else if (expr.first == "(") {
        let substring:String = String(expr[expr.index(expr.startIndex, offsetBy: 1)..<expr.index(expr.startIndex, offsetBy: expr.count-1)])
        
        return evaluate(expr: substring)
    }else {
        let num = Int(expr)
        return num!
    }
}

var res = evaluate(expr: "(1+(2*4))")
print(res)
