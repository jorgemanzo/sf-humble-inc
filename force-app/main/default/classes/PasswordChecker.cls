public with sharing class PasswordChecker {

    public PasswordChecker() {
        String testString = 'abcdefg';

        Pattern passPattern = Pattern.compile('.*[0-9]+');
        Matcher passMatch = passPattern.matcher(testString);

        System.debug(passMatch.matches());
    }
}

/*
    new PasswordChecker();
*/