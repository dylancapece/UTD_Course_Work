package ch13;

public class Rectangle extends GeometricObject {
 private double width;
 private double height;

 public Rectangle() {
	 this.width = 1;
	 this.height = 1;
 }

 public Rectangle(double width, double height) {
   this.width = width;
   this.height = height;
 }

 public Rectangle(double width, double height, String color) {
	   this.width = width;
	   this.height = height;
	   super.setColor(color);
	 }
 
 
 /** Return width */
 public double getWidth() {
   return width;
 }

 /** Set a new width */
 public void setWidth(double width) {
   this.width = width;
 }

 /** Return height */
 public double getHeight() {
   return height;
 }

 /** Set a new height */
 public void setHeight(double height) {
   this.height = height;
 }

 @Override /** Return area */
 public double getArea() {
   return width * height;
 }

 @Override /** Return perimeter */
 public double getPerimeter() {
   return 2 * (width + height);
 }
 
 /* Print the rectangle info */
 @Override
 public String toString() {
//   return "The rectangle " + // super.toString() +
//     " the width is " + this.width + 
//   	 " and the height is " + this.height;
	 
 return String.valueOf(this.getArea());
 }
}

