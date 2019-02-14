## CONSTANTS
readonly BIN=./201yams

readonly BLUE="\033[0;34m"
readonly CYAN="\033[0;36m"
readonly GREEN="\033[0;32m"
readonly RED="\033[0;31m"


## VARIABLES
failed=0


## TESTS
echo -e "$BLUE""TEST PARAMETERS:"

# NB PARAMETERS
echo -en "$CYAN""Test nb parameters 1: "

$BIN &> /dev/null

if [ $? -ne 84 ]; then
    echo -e "$RED""KO"
    failed=$(expr $failed + 1)
else
    echo -e "$GREEN""OK"
fi

echo -en "$CYAN""Test nb parameters 2: "

$BIN 0 0 0 0 0 pair_2 hello &> /dev/null

if [ $? -ne 84 ]; then
    echo -e "$RED""KO"
    failed=$(expr $failed + 1)
else
    echo -e "$GREEN""OK"
fi

# USAGE
echo -en "$CYAN""Test usage: "

$BIN -h &> /dev/null

if [ $? -eq 0 ]; then
    echo -e "$GREEN""OK"
else
    echo -e "$RED""KO"
    failed=$(expr $failed + 1)
fi

# TEST DICE
echo -en "$CYAN""Test bad dice 1: "

$BIN 1 1 1 1 abc pair_2 &> /dev/null

if [ $? -eq 84 ]; then
    echo -e "$GREEN""OK"
else
    echo -e "$RED""KO"
    failed=$(expr $failed + 1)
fi

echo -en "$CYAN""Test bad dice 2: "

$BIN 1 1 1 1 7 pair_2 &> /dev/null

if [ $? -eq 84 ]; then
    echo -e "$GREEN""OK"
else
    echo -e "$RED""KO"
    failed=$(expr $failed + 1)
fi

echo -en "$CYAN""Test bad dice 3: "

$BIN 1 1 1 1 67 pair_2 &> /dev/null

if [ $? -eq 84 ]; then
    echo -e "$GREEN""OK"
else
    echo -e "$RED""KO"
    failed=$(expr $failed + 1)
fi

echo -en "$CYAN""Test bad dice 4: "

$BIN 1 1 1 1 6a pair_2 &> /dev/null

if [ $? -eq 84 ]; then
    echo -e "$GREEN""OK"
else
    echo -e "$RED""KO"
    failed=$(expr $failed + 1)
fi

echo -en "$CYAN""Test not thrown and thrown: "

$BIN 1 1 1 1 0 pair_2 &> /dev/null

if [ $? -eq 84 ]; then
    echo -e "$GREEN""OK"
else
    echo -e "$RED""KO"
    failed=$(expr $failed + 1)
fi

# TEST COMBINAISONS
echo -en "$CYAN""Test unknown combinaison: "

$BIN 1 1 1 1 1 hey_2 &> /dev/null

if [ $? -eq 84 ]; then
    echo -e "$GREEN""OK"
else
    echo -e "$RED""KO"
    failed=$(expr $failed + 1)
fi

# TEST OPTIONS
echo -en "$CYAN""Test bad options: "

$BIN 1 1 1 1 1 pair_2_ &> /dev/null

if [ $? -eq 84 ]; then
    echo -e "$GREEN""OK"
else
    echo -e "$RED""KO"
    failed=$(expr $failed + 1)
fi


## RETURN HOW MANY TEST FAILED
exit $failed
