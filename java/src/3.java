class problem3 {
    public static void main(String[] args){
        long n = 600851475143L;
        int i = 775147;
        while (i > 0) {
            if (isPrime(i)) {
                if (n % i == 0) {
                    System.out.println(String.valueOf(i));
                    return;
                }
            }
            i -= 2;
        }
    }

    public static boolean isPrime(int n) {
        if (n == 2)
            return true;
        if (n % 2 == 0)
            return false;

        for (int i = 3; i < Math.sqrt(n); i += 2) {
            if (n % i == 0)
                return false;
        }
        return true;


    }
}
