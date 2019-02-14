## CONSTANTS
readonly BIN=./201yams

readonly BLUE="\033[0;34m"
readonly CYAN="\033[0;36m"
readonly GREEN="\033[0;32m"
readonly RED="\033[0;31m"


## VARIABLES
failed=0


## TESTS
echo -e "$BLUE""TEST YAMS:"

echo -en "$CYAN""Test basic: "
res="$($BIN 0 0 0 0 0 yams_1)"
expected="chances to get a 1 yams: 0.01%"

if [ "$res" = "$expected" ]; then
    echo -e "$GREEN""OK"
else
    echo -e "$RED""KO"
    failed=$(expr $failed + 1)
fi

echo -en "$CYAN""One already: "
res="$($BIN 1 1 2 1 1 yams_2)"
expected="chances to get a 2 yams: 0.08%"

if [ "$res" = "$expected" ]; then
    echo -e "$GREEN""OK"
else
    echo -e "$RED""KO"
    failed=$(expr $failed + 1)
fi

echo -en "$CYAN""Two already: "
res="$($BIN 1 1 2 1 2 yams_2)"
expected="chances to get a 2 yams: 0.46%"

if [ "$res" = "$expected" ]; then
    echo -e "$GREEN""OK"
else
    echo -e "$RED""KO"
    failed=$(expr $failed + 1)
fi

echo -en "$CYAN""Three already: "
res="$($BIN 1 2 2 1 2 yams_2)"
expected="chances to get a 2 yams: 2.78%"

if [ "$res" = "$expected" ]; then
    echo -e "$GREEN""OK"
else
    echo -e "$RED""KO"
    failed=$(expr $failed + 1)
fi

echo -en "$CYAN""Four already: "
res="$($BIN 2 2 1 2 2 yams_2)"
expected="chances to get a 2 yams: 16.67%"

if [ "$res" = "$expected" ]; then
    echo -e "$GREEN""OK"
else
    echo -e "$RED""KO"
    failed=$(expr $failed + 1)
fi

echo -en "$CYAN""Five already: "
res="$($BIN 2 2 2 2 2 yams_2)"
expected="chances to get a 2 yams: 100.00%"

if [ "$res" = "$expected" ]; then
    echo -e "$GREEN""OK"
else
    echo -e "$RED""KO"
    failed=$(expr $failed + 1)
fi

echo -en "$CYAN""Bad option 1: "
$BIN 2 2 2 1 2 yams &> /dev/null

if [ $? -eq 84 ]; then
    echo -e "$GREEN""OK"
else
    echo -e "$RED""KO"
    failed=$(expr $failed + 1)
fi

echo -en "$CYAN""Bad option 2: "
$BIN 2 2 2 1 2 yams_2_4 &> /dev/null

if [ $? -eq 84 ]; then
    echo -e "$GREEN""OK"
else
    echo -e "$RED""KO"
    failed=$(expr $failed + 1)
fi

echo -en "$CYAN""Bad option 3: "
$BIN 2 2 2 1 2 yams_0 &> /dev/null

if [ $? -eq 84 ]; then
    echo -e "$GREEN""OK"
else
    echo -e "$RED""KO"
    failed=$(expr $failed + 1)
fi


## RETURN HOW MANY TEST FAILED
exit $failed
