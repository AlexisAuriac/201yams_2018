#!/bin/bash

## CONSTANTS
readonly TEST_DIR="tests"

readonly GREEN="\033[0;32m"
readonly RED="\033[0;31m"


## TEST FILES
TESTS=(
    $TEST_DIR/tests_parameters.sh
    $TEST_DIR/tests_pair.sh
    $TEST_DIR/tests_three.sh
)


## FAILED TEST COUNTER
failed=0


## EXECUTE TESTS
for i in ${TESTS[@]}; do
    bash $i
    failed=$(expr $failed + $?)
    echo
done

if [ $failed -eq 0 ]; then
    echo -e "$GREEN""All tests completed"
else
    echo -e "$RED""Failed $failed"
fi


## RETURN HOW MANY FAILED
exit $failed
