class Person (private val givenName: String, private var surname: String,protected val id: String) {
	
	
	def name= {
	givenName + " " + surname
	}

}



class Int2DVec  (val x: Int, val y: Int) {

	
  def +(other: Int2DVec) = new Int2DVec(x + other.x, y + other.y)
  def unary_- = new Int2DVec(-x, -y)
	override def toString() = "(" + x.toString + "," + y.toString + ")"
	def -(other: Int2DVec) = new Int2DVec(x - other.x, y - other.y)
	def *(other: Int2DVec) = x * other.x + y * other.y
	def |-?(other:Int2DVec) = if( this * other ==0) true else false
}
 
object Appl {
  def main(agrs: Array[String]) {
     val v1 = Int2DVec(2, -1)
    val v2 = Int2DVec(10, 20)
    val v3 = v1 + v2
    val v4 = -v2
    println(v3)
    println(v4)
    println(Int2DVec())
    println(Int2DVec(v1 + v1 + v2))
		println( v1 |-? v2 )
  }
}
object Int2DVec {
  def apply(x: Int, y: Int) = new Int2DVec(x, y)
  def apply() = new Int2DVec(0, 0)
  def apply(prototype: Int2DVec) = new Int2DVec(prototype.x, prototype.y) 
	def unitVectorOf(prototype: Int2DVec) = new Int2DVec(-prototype.x,-prototype.y)
}