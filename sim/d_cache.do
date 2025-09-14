add wave *

# Test Case 1 - Reset: Clear all registers
# Expected: All registers should be set to 0 due to reset being active.
force din x"ABCDABCD"
force reset 1
force clk 0
force write 1
force address "00000"
run 2

# Test Case 2 - Write to register 0
# Expected: reg(0) should store x"ABCDABCD" after clk rising edge
force clk 0
run 2
force din x"ABCDABCD"
force reset 0
force clk 1
force write 1
force address "00000"
run 2

# Test Case 3 - Read from an unwritten location
# Expected: d_out should be "00000000" since reg(1) was never written to.
force clk 0
run 2
force din x"ABCDABCD"
force reset 0
force clk 1
force write 0
force address "00001"
run 2

# Test Case 4 - Read from register 0 (which should contain ABCDABCD)
# Expected: d_out should return x"ABCDABCD" since reg(0) was written earlier.
force clk 0
run 2
force clk 1
force write 0
force address "00000"
run 2

# Finish simulation
quit
