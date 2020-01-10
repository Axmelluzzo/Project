library(data.table)
library(stringr)

# Steps for "Word Driven"
#
# ~  1 - Gather words
# ~  2 - Mesh words
# ~  3 - Add Optional
#           ~~ Capitals



# Steps for "Requirement Driven"
#
# ~  1 - Gather all character types
# ~  2 - Mesh
# ~  3 - Sort/Filter by pattern characteristics
#           ~~ Start with capital letter / lowercase letter
#           ~~ Ends in number
#           ~~ Special character followed by number


# Steps for "Mixed Driven"
#
# ~  1 - Gather words
# ~  2 - Mesh words
# ~  3 - Add tweakable requirements
#           ~~ Capitals
#           ~~ Numbers
#           ~~ Special Characters





# *``````*``````*``````*``````*``````*``````*``````*``````*``````*``````*``````*``````
#                               REQUIRMENT DRIVEN
#
# *``````*``````*``````*``````*``````*``````*``````*``````*``````*``````*``````*``````

# Define the elements to be put into the string. This also creates arrays for validataion checks later in the code.
lower <- letters
upper <- LETTERS
lower_upper<- c(lower,upper)
numbers <- c(0:9)
numbers_string <- as.character(numbers)
lower_upper_numbers<- c(lower_upper,numbers)
char <- c('!','@','#','$','%','^','&','*','(',')','?',"'",'"','+','=','<','>','[',']','`','_','-','|','/',"\\",'~',';',':')
lower_upper_numbers_char<- c(lower_upper_numbers,char)



# Add more to increase length of string
gen_pass<- matrix(paste(sample(lower_upper_numbers_char),
                 sample(lower_upper_numbers_char),
                 sample(lower_upper_numbers_char),
                 sample(lower_upper_numbers_char),
                 sample(lower_upper_numbers_char),
                 sample(lower_upper_numbers_char), 
                 sample(lower_upper_numbers_char),
                 sample(lower_upper_numbers_char), sep = ''))


# Create indexed patterns
lower_pattern = paste(lower, collapse="|")
upper_pattern = paste(upper, collapse="|")
num_pattern = paste(numbers, collapse="|")
char_pattern = paste(char, collapse="|")



# Create table checking for atleast one value 
DT_result <- data.table(gen_pass, 
                                  lower_result = grepl(lower_pattern, gen_pass), 
                                  upper_result = grepl(upper_pattern,gen_pass),
                                  num_result = grepl(num_pattern, gen_pass),
                                  char_result = grepl(char_pattern, gen_pass)
                           )
                        



# Number of matches with characters

sum(str_count(B[1], pattern = numbers_string))



p_char_list <- list()
p_char_list[[1]]<- numbers
p_char_list[[2]]<- lower
p_char_list[[3]]<- upper
p_char_list[[4]]<- char


gen_pass<- mapply(sample,p_char_list,c(4,2,4,2))
samp <- paste(sample(gen_pass),collapse="")
print(samp)
print(gen_pass)

sam<-list()
sam[[1]]<-1:9
sam[[2]]<-letters
sam[[3]]<-LETTERS
sam[[4]]<-c("!", "§", "$", "%", "&", "(", ")", "*")

tmp<-mapply(sample,sam,c(2,2,2,2))
paste(sample(tmp),collapse="")

#Where c(2,2,2,2) specifies the number of numbers, letters, capital letters and symbild (in this order). Result:
#  [1] "j$bP%5R3"
