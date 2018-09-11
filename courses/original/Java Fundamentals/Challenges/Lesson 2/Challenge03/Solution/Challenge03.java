import java.util.Scanner;
public class Challenge03 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.println("Please input an int, String, and char in order");
        int i = input.nextInt();
        String s = input();
        char c = input.next();
        System.out.println("int: " + i);
        System.out.println("String: " + s);
        System.out.print("char: " + c);
    }
}