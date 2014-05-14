class problem4 {
    public static void main(String[] args){
        int max_palindrome = 0;
        int test;
        for (int i = 1; i < 1000; i++) {
            for (int j = 0; j < 1000; j++) {
                test = i*j;
                if (isPalindrome(test)) {
                    if (test > max_palindrome) {
                        max_palindrome = test;
                    }
                }
            }
        }
        System.out.println(String.valueOf(max_palindrome));
    }

    public static boolean isPalindrome(int n) {
        String tmp = String.valueOf(n);
        String reverse = new StringBuilder(tmp).reverse().toString();
        return tmp.equals(reverse);
    }
}
