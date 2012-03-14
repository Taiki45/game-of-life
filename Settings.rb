#Set game Settings
module Settings
  #Set how large the game field is
  FIELD_SIZE = 10
  
  #Set how many generations game plays
  PLAY_TIMES = 30
  
  #Setting for dilay seconds between each generation game displays 
  DELAY_TIME = 0
  
  #set live cells when game starts
  #Each consists of row number and colum number
  #
  #For sample
  #2,3, 3,2, 3,3, 4,3
  #2,3, 3,2, 3,3, 2,4
  #3,4, 3,5, 4,3, 4,4, 5,4
  FIRST_ALIVES = [2,3, 3,2, 3,3, 4,3]
end