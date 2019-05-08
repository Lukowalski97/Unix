package p1.p2.p3 {
  class A3
}

import utils._
import java.io.File
import java.io.PrintWriter

object Appl {
  def readFile(fileFrom: String, fileTo: String) = try {
    println("Opening the file...")
    val inFile = scala.io.Source.fromFile(fileFrom)
    val toFile=  new PrintWriter(new File(fileTo))
    try {
      for (line <- inFile.getLines) {
        toFile.write(line + "===>" + PasswdGen.nextPasswd( 5 + util.Random.nextInt(4)) + "\n" )
      }
      
    } finally {
      println("Closing the file...")
      toFile.close()
      inFile.close
    }
  } catch {
    case ex: java.io.FileNotFoundException => println(ex.getMessage)
    case ex: Throwable => println("Default exception handler: "+ ex.getMessage)
  }
 
  def main(args: Array[String]) {
    readFile("logins.txt", "login-passwds.txt")
  }   
}