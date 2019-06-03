object Appl42 {
  import scala.annotation.tailrec
   def sumArrayRec1(i: Int, elems: Array[Int]): Int = {
  if (i < elems.size) elems(i) + sumArrayRec1(i + 1, elems)
  else 0
}
 
def sumArrayRec2(elems: Array[Int]) = {
  val size = elems.size
  def goFrom(i: Int): Int = {
    if (i < size) elems(i) + goFrom(i+1)
    else 0
  }
  goFrom(0)
}

 def sumSqrArrayRec1(i: Int, elems: Array[Int]): Int = {
  if (i < elems.size) 
    elems(i)*elems(i) + sumSqrArrayRec1(i + 1, elems)
  else 0
}
 
def sumSqrArrayRec2(elems: Array[Int]) = {
  val size = elems.size
  def goFrom(i: Int): Int = {
    
    if (i < size) elems(i)*elems(i) + goFrom(i+1)
    else 0
  }
  goFrom(0)
}

def sumSqrArrayRec3(elems: Array[Int]) = {
    @tailrec def goFrom(i: Int, size: Int, elms: Array[Int], acc: Int): Int = {
      if (i < size) goFrom(i + 1, size, elms, acc + elms(i)*elms(i) )
      else acc
    }
    goFrom(0, elems.size, elems, 0)
  }
 

 def sumSqrArrayIter(elems: Array[Int]) = {
    var sum = 0
    for (i <- elems) sum += i*i
    sum
  }

  def checkPredicate(pred: Boolean, predAsString: String, prefix: String = "Checking if ") {
    if (pred) println(prefix + predAsString + ": OK")
    else println(prefix + predAsString + ": Fail")
  }
  def sumArrayIter(elems: Array[Int]) = {
    var sum = 0
    for (i <- elems) sum += i
    sum
  }
  def main(args: Array[String]) {
    val a1To5 = (1 to 5).toArray
    println("Testing with a1To5 = " + a1To5.mkString("Array(", ", ", ") ..."))
    val expectResult = 15
    val expectSquareResult=55
    checkPredicate(sumArrayIter(a1To5) == expectResult, 
                   "sumArrayIter(0, a1To5) == " + expectResult)
    checkPredicate(sumArrayRec1(0, a1To5) == expectResult, 
                   "sumArrayRec1(0, a1To5) == " + expectResult)
    checkPredicate(sumArrayRec2(a1To5) == expectResult, 
                   "sumArrayRec2(a1To5) == " + expectResult)

    checkPredicate(sumSqrArrayIter(a1To5) == expectSquareResult, 
                   "sumSqrArrayIter(0, a1To5) == " + expectSquareResult)
    checkPredicate(sumSqrArrayRec1(0, a1To5) == expectSquareResult, 
                   "sumSqrArrayRec1(0, a1To5) == " + expectSquareResult)
    checkPredicate(sumSqrArrayRec2(a1To5) == expectSquareResult, 
                   "sumSqrArrayRec2(a1To5) == " + expectSquareResult)
    checkPredicate(sumSqrArrayRec3(a1To5) == expectSquareResult, 
                   "sumSqrArrayRec3(a1To5) == " + expectSquareResult)
  }
}