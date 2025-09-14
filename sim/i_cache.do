add wave *

# Run initial setup
run 1ns

# Test Case 1: Fetch instruction at address "00000"
# instruction_out = "00100000000000110000000000000000" ( addi r3, r0, 0 )
force address_in 00000
run 2ns

# Test Case 2: Fetch instruction at address "00001"
# Instruction_out = "00100000000000010000000000000000" ( addi r1, r0, 0 )
force address_in 00001
run 2ns

# Test Case 3: Fetch instruction at address "00110"
# Instruction_out = "00001000000000000000000000000011" ( jump 3 (LOOP) )
force address_in 00110
run 2ns
