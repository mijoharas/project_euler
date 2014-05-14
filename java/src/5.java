class problem5 {
    public static void main(String[] args){
        long number = 1L;
        while (!isDivisible(number)) {
            number += 1;
        }
        System.out.println(String.valueOf(number));
    }

    public static boolean isDivisible(long num) {
        for (int i = 1; i <= 20; i++) {
            if (num % i != 0)
                return false;
        }
        return true;
    }
}
