## CONSTANTS
readonly BIN=./201yams

readonly BLUE="\033[0;34m"
readonly CYAN="\033[0;36m"
readonly GREEN="\033[0;32m"
readonly RED="\033[0;31m"


## VARIABLES
failed=0


## TESTS
echo -e "$BLUE""TEST PAIR:"

echo -en "$CYAN""Test basic: "
res="$($BIN 0 0 0 0 0 pair_1)"
expected="chances to get a 1 pair: 19.62%"

if [ "$res" = "$expected" ]; then
    echo -e "$GREEN""OK"
else
    echo -e "$RED""KO"
    failed=$(expr $failed + 1)
fi

echo -en "$CYAN""One already: "
res="$($BIN 2 1 1 1 1 pair_2)"
expected="chances to get a 2 pair: 51.77%"

if [ "$res" = "$expected" ]; then
    echo -e "$GREEN""OK"
else
    echo -e "$RED""KO"
    failed=$(expr $failed + 1)
fi

echo -en "$CYAN""Two already: "
res="$($BIN 2 2 1 1 1 pair_2)"
expected="chances to get a 2 pair: 100.00%"

if [ "$res" = "$expected" ]; then
    echo -e "$GREEN""OK"
else
    echo -e "$RED""KO"
    failed=$(expr $failed + 1)
fi

echo -en "$CYAN""More: "
res="$($BIN 2 2 2 1 2 pair_2)"
expected="chances to get a 2 pair: 100.00%"

if [ "$res" = "$expected" ]; then
    echo -e "$GREEN""OK"
else
    echo -e "$RED""KO"
    failed=$(expr $failed + 1)
fi

echo -en "$CYAN""Bad option 1: "
$BIN 2 2 2 1 2 pair &> /dev/null

if [ $? -eq 84 ]; then
    echo -e "$GREEN""OK"
else
    echo -e "$RED""KO"
    failed=$(expr $failed + 1)
fi

echo -en "$CYAN""Bad option 2: "
$BIN 2 2 2 1 2 pair_2_4 &> /dev/null

if [ $? -eq 84 ]; then
    echo -e "$GREEN""OK"
else
    echo -e "$RED""KO"
    failed=$(expr $failed + 1)
fi

echo -en "$CYAN""Bad option 2: "
$BIN 2 2 2 1 2 pair_0 &> /dev/null

if [ $? -eq 84 ]; then
    echo -e "$GREEN""OK"
else
    echo -e "$RED""KO"
    failed=$(expr $failed + 1)
fi


## RETURN HOW MANY TEST FAILED
exit $failed
