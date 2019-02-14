## CONSTANTS
readonly BIN=./201yams

readonly BLUE="\033[0;34m"
readonly CYAN="\033[0;36m"
readonly GREEN="\033[0;32m"
readonly RED="\033[0;31m"


## VARIABLES
failed=0


## TESTS
echo -e "$BLUE""TEST FOUR:"

echo -en "$CYAN""Test basic: "
res="$($BIN 0 0 0 0 0 four_1)"
expected="chances to get a 1 four-of-a-kind: 0.33%"

if [ "$res" = "$expected" ]; then
    echo -e "$GREEN""OK"
else
    echo -e "$RED""KO"
    failed=$(expr $failed + 1)
fi

echo -en "$CYAN""One already: "
res="$($BIN 1 1 2 1 1 four_2)"
expected="chances to get a 2 four-of-a-kind: 1.62%"

if [ "$res" = "$expected" ]; then
    echo -e "$GREEN""OK"
else
    echo -e "$RED""KO"
    failed=$(expr $failed + 1)
fi

echo -en "$CYAN""Two already: "
res="$($BIN 1 1 2 1 2 four_2)"
expected="chances to get a 2 four-of-a-kind: 7.41%"

if [ "$res" = "$expected" ]; then
    echo -e "$GREEN""OK"
else
    echo -e "$RED""KO"
    failed=$(expr $failed + 1)
fi

echo -en "$CYAN""Three already: "
res="$($BIN 1 2 2 1 2 four_2)"
expected="chances to get a 2 four-of-a-kind: 30.56%"

if [ "$res" = "$expected" ]; then
    echo -e "$GREEN""OK"
else
    echo -e "$RED""KO"
    failed=$(expr $failed + 1)
fi

echo -en "$CYAN""Four already: "
res="$($BIN 2 2 1 2 2 four_2)"
expected="chances to get a 2 four-of-a-kind: 100.00%"

if [ "$res" = "$expected" ]; then
    echo -e "$GREEN""OK"
else
    echo -e "$RED""KO"
    failed=$(expr $failed + 1)
fi

echo -en "$CYAN""More: "
res="$($BIN 2 2 2 2 2 four_2)"
expected="chances to get a 2 four-of-a-kind: 100.00%"

if [ "$res" = "$expected" ]; then
    echo -e "$GREEN""OK"
else
    echo -e "$RED""KO"
    failed=$(expr $failed + 1)
fi

echo -en "$CYAN""Bad option 1: "
$BIN 2 2 2 1 2 four &> /dev/null

if [ $? -eq 84 ]; then
    echo -e "$GREEN""OK"
else
    echo -e "$RED""KO"
    failed=$(expr $failed + 1)
fi

echo -en "$CYAN""Bad option 2: "
$BIN 2 2 2 1 2 four_2_4 &> /dev/null

if [ $? -eq 84 ]; then
    echo -e "$GREEN""OK"
else
    echo -e "$RED""KO"
    failed=$(expr $failed + 1)
fi

echo -en "$CYAN""Bad option 3: "
$BIN 2 2 2 1 2 four_0 &> /dev/null

if [ $? -eq 84 ]; then
    echo -e "$GREEN""OK"
else
    echo -e "$RED""KO"
    failed=$(expr $failed + 1)
fi


## RETURN HOW MANY TEST FAILED
exit $failed
