# Introduction:

This repository contains code for compressing the genome of the newly discovered virus Bayes inferens. This virus has a remarkably short genome of just 10 kilobase pairs (kbps), and its infected individuals develop a strong intuition for Bayesian inference. To study this virus further, we need to store its genome efficiently on a flash drive with limited memory (2.2 kilobytes).

# Compression Challenge:

The challenge lies in converting the DNA sequence (using four letters: A, C, G, T) into binary (using only 0s and 1s) while achieving sufficient compression to fit within the flash drive's memory constraint.

***Naive Approach:***

The initial approach uses a simple mapping: A -> 00, C -> 01, G -> 10, T -> 11. This results in a binary sequence longer than the original DNA sequence, failing to achieve compression.

# Optimal Code Design:

The key to compression lies in designing a better code that assigns shorter binary strings to more frequent DNA letters. This leverages the non-uniform probability distribution of letters in the DNA sequence.

**Key Points in the Code:**

The freq dictionary stores the frequency of each base in the DNA sequence.
code_opt dictionary is used to define the optimized mapping from DNA letters to binary.
Two functions are implemented:
join_binary_sequence: Converts the DNA sequence to binary using the chosen code.
decode_binary_sequence: Decodes the binary sequence back to the original DNA sequence based on the chosen code.
Compression efficiency is measured in bits per base pair saved compared to the naive approach.

# Output:

The script outputs the following information:

Original DNA sequence and its length in kbps.
Binary sequence generated using the naive and optimized codes.
Compression achieved (bits per base pair saved) for each code.
Whether the compressed sequence fits within the flash drive's memory constraint.
**Further Analysis:**

The code also calculates the potential additional bits saved per base pair if the optimized code had been used instead of the naive approach.

# Conclusion:

This task demonstrates the use of information theory and variable-length codewords for data compression, highlighting the trade-off between code complexity and compression efficiency. By designing an optimal code based on the frequency distribution of DNA letters, we can significantly reduce the storage requirements for the Bayes inferens genome.
