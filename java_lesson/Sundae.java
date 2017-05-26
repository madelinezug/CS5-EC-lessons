/*
* Extra Credit Java Assignment Example
* Maddie Zug
* Harvey Mudd College
* May 2017
*/

//This import is required to use ArrayList
import java.util.*;

public class Sundae extends Dessert{
  //These are instance variables of the Sundae class
  int scoops;
  String  flavor;
  ArrayList<String> toppings;

  //This is the constructor for the Sundae class
  public Sundae(int scoops, String flavor, ArrayList<String> toppings){
    this.scoops = scoops;
    this.flavor = flavor;
    this.toppings = toppings;
  }

  //This method lets me add scoops to my Sundae. It doesn't return anything.
  public void addScoops(int numScoops){
    scoops += numScoops;
  }

  //This method lets me add toppings to my Sundae. It doesn't return anything.
  public void addTopping(String topping){
    toppings.add(topping);
  }

  //This method returns the String that represents the flavor of my Sundae.
  public String getFlavor(){
    return flavor;
  }

  public static void main(String[] args){
    //Build my list of toppings
    ArrayList<String> chocolateToppings = new ArrayList<String>();
    chocolateToppings.add("oreos");
    chocolateToppings.add("chocolate chips");
    chocolateToppings.add("chocolate sauce");
    chocolateToppings.add("whipped cream");

    //Instantiate a Sundae called chocolateExplosion
    Sundae chocolateExplosion = new Sundae(45, "mocha chip", chocolateToppings);

    //Add 2 scoops to my sundae and print the number of scoops
    chocolateExplosion.addScoops(2);
    System.out.println("My Sundae has " + chocolateExplosion.scoops + " scoops!");

    //Serve my Sundae!
    chocolateExplosion.serveDessert();
  }
}
