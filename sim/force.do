add wave *

force x "01111111111111111111111111111111"
force y "01111111111111111111111111111100"

# add, and, lui
force add_sub 0
force logic_func "00"
force func "00"
run 2

#or,setless
force logic_func "01"
force func "10"
run 2

#sub, xor, logic
force add_sub 1
force logic_func "10"
force func "11"
run 2

#nor
force logic_func "11"
run 2


force x "10000000010000000000000000000000"
force y "01110000000000000000000000000000"

#add,and,lui
force add_sub 0
force logic_func "00"
force func "00"
run 2

#or, setless
force logic_func "01"
force func "10"
run 2

#sub, xor, logic
force add_sub 1
force logic_func "10"
force func "11"
run 2

#nor
force logic_func "11"
run 2


force x "10000000000000000000000000000001"
force y "10000000000000000000000000000001"

#add,and,lui
force add_sub 0
force logic_func "00"
force func "00"
run 2

#or, setless
force logic_func "01"
force func "10"
run 2

#sub, xor, logic
force add_sub 1
force logic_func "10"
force func "11"
run 2

#nor
force logic_func "11"
run 2


force x "00000000000011111111000000000001"
force y "10000000000000000000000000000001"

#add,and,lui
force add_sub 0
force logic_func "00"
force func "00"
run 2

#or, setless
force logic_func "01"
force func "10"
run 2

#sub, xor, logic
force add_sub 1
force logic_func "10"
force func "11"
run 2

#nor
force logic_func "11"
run 2
