//A Very Simple Example
class problem2 {
    public static void main(String[] args){
        int sum = 0;
        int fib_old = 1;
        int fib_new = 1;
        int tmp;
        while (fib_new < 4000000) {
            tmp = fib_new;
            fib_new = fib_old + fib_new;
            fib_old = tmp;
            if (fib_new % 2 == 0 ) {
                sum += fib_new;
            }

        }
        System.out.println(String.valueOf(sum));
    }
}
