add wave *

# reset

force reset 1
force clk 0
force din X"FAFA3B3B"
force write 0
force write_address "00001"
force read_a "00000"
force read_b "00001"
run 2


# deassert reset and write into R1

force reset 0
run 2
force write 1
run 2
force clk 1
run 2
force clk 0
run 2


# write X"FAFA3B3B" into R31 and sent R31 to both out ports

force write_address "11110"
run 2
force read_a "11110"
force read_b "11110"
force clk 1
run 2
force clk 0
run 2

# deassert write, and try to write new data into R31, shouild be no change

force write 0
run 2
force clk 1
run 2
force clk 0
run 2

# write data into R1-R31 consecutively

force write 1

force write_address "00001"
force din X"00000001"
force clk 1
run 2
force clk 0
run 2

force write_address "00010"
force din X"00000002"
force clk 1
run 2
force clk 0
run 2 


force write_address "11110"
force din X"0000001E"
force clk 1
run 2
force clk 0
run 2

force write_address "11111"
force din X"6000001F"
force clk 1
run 2
force clk 0
run 2 


# now deassert the write and read out consecutively asynchronously

force write 0
force read_a "00000"
force read_b "00001"
run 2

force read_a "00110"
force read_b "00111"
run 2

force read_a "00111"
force read_b "01000"
run 2

force read_a "01001"
force read_b "01010"
run 2

force read_a "01011"
force read_b "01100"
run 2

force read_a "01101"
force read_b "01110"
run 2

force read_a "01111"
force read_b "10000"
run 2


force read_a "10001"
force read_b "10010"
run 2

force read_a "10011"
force read_b "10100"
run 2


force read_a "11101"
force read_b "11110"
run 2

force read_a "11111"
force read_b "11111"
run 2

