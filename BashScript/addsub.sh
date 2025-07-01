add() {
    echo "Enter two numbers to add:"
    read a
    read b
    sum=$((a + b))
    echo "Sum: $sum"
}


Sub() {
    echo "Enter two numbers to subtract:"
    read a
    read b
    diff=$((a - b))
    echo "Difference: $diff"
}


