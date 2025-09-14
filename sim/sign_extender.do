add wave *

#   Test Case 1 - (load upper immediate)
# sign_extender_out = "10000000000000010000000000000000"
# Pad LSBs with 16 zeros
force sign_extender_in "1000000000000001"
force sign_extender_func "00"
run 2


#   Test Case 2 - (set less immediate)
# sign_extender_out = "11111111111111111000000000000001"  
# Extend MSBs with sign bit (1)
force sign_extender_in "1000000000000001"
force sign_extender_func "01"
run 2


#   Test Case 3 - (arithmetic)
# sign_extender_out = "11111111111111111000000000000001"  
# Extend MSBs with sign bit (1)  
force sign_extender_in "1000000000000001"
force sign_extender_func "10"
run 2


#    Test Case 4 - (logical)
# sign_extender_out = "00000000000000001000000000000001"  
# Pad MSBs with 0s  
force sign_extender_in "1000000000000001"
force sign_extender_func "11"
run 2
