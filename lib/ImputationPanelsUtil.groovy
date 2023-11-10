class ImputationPanelsUtil {

    public static int getSeed() {
        // get seed between 1K and 50K
        return Math.abs( new Random().nextInt() % (50000 - 1000) ) + 1000
    }

}