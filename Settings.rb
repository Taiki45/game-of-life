#Set game Settings
module Settings
  #Set how large the game field is
  FIELD_SIZE = 30
  
  #Set how many generations game plays
  PLAY_TIMES = 100
  
  #Setting for dilay seconds between each generation game displays 
  DELAY_TIME = 0
  
  #set live cells when game starts
  #Each consists of row number and colum number
  #If RANDAM_SEED is true, this option will be disabled
  #
  #For sample
  #2,3, 3,2, 3,3, 4,3
  #2,3, 3,2, 3,3, 2,4
  #3,4, 3,5, 4,3, 4,4, 5,4
  FIRST_ALIVES = [3,4, 3,5, 4,3, 4,4, 5,4]
  
  #This option should be 'true' or 'false'
  #if true, disable above FIRST_ALIVES option,
  #and enable setting first alives randomly
  #Default is 'true'
  RANDOM_SEED = true
  #If RANDOM_SEED is true, you can choose this
  #This decieds amount of first alives
  #fewer << lots, 1 << heigher(10 or 20)
  # Hint:When you set FIELD_SIZE as big size, this option should be bigger number
  #Default is '4'
  AMOUNT = 4
  
  #This option give mutant ability to Lifes.
  #But, the game will NOT be "conway's game og life"
  #So this option is for pastime
  #Defualt is 'false'
  MUTANT = false
  #As bigger this is, Mutant option will be silent
  #This value should be 1 ~ 1000
  #Default is '100'
  MUTANT_LEVEL = 100
end