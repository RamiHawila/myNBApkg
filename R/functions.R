
#' This function cleans any dataset retrieved from [NBA website](https://www.basketball-reference.com/leagues/NBA_2023_per_game.html#per_game_stats).
#' by removing rows with NAs and recoding the Position variable
#' @param data Dataframe of NBA statistics With the default being DATASET the 2022-2023 season NBA dataset
#'
#' @return returns a cleaned up version of data
#' @export
#' @import dplyr
#'
#' @examples cleandata(data = DATASET )
cleandata = function(data=DATASET ){
  # data <- read.csv(paste0("../,",data,".csv"))
  mydata = tidyr::drop_na(data)
  return(data =  mydata  %>%
           dplyr::mutate(Position = dplyr::recode(mydata$Pos,
                                               C= "Center",
                                               PG = "Point Guard",
                                               SG = "Shooting Guard",
                                               SF = "Small Forward",
                                               PF = "Power Forward")))
}


#' This function produces a table for a given player's basic statistics (position, team, field goals, total rebounds,
#' assists, steals, blocks, turnovers, and personal fouls).
#'
#' @param player Name of NBA Player with the default being Stephen Curry
#' @param data Dataframe of NBA statistics With the default being DATASET the 2022-2023 season NBA dataset
#' @import dplyr
#' @return Table that summarizes basic statistics for chosen player.
#' @export
#'
#' @examples player_basic_stats(player = "Stephen Curry", data=DATASET)
player_basic_stats = function(player = "Stephen Curry", data=DATASET){
  mydata = cleandata(data)
  if(!(player %in% mydata$Player)){
    message(paste0("Error: ", player, " is not a player in the NBA season."))
  }
  else{


  summ_player = mydata %>%
    dplyr::select(Player,Position,Tm,FG,TRB,AST,STL,BLK,TOV,PF) %>%
    dplyr::filter(Player==player)

  summ2_player = summ_player %>%
      dplyr::mutate("Team" = Tm,
                  "Field Goals" = FG,
                  "Total Rebounds" = TRB,
                  Assists = AST,
                  Steals = STL,
                  Blocks = BLK,
                  Turnovers = TOV,
                  "Personal Fouls" = PF) %>%
    dplyr::select(-c(Tm,FG,TRB,AST,STL,BLK,TOV,PF))
  return(summ2_player)
  }
}


#' This function produces a table of the means of each basic statistic according to the position.
#'
#' @param position Name of position ("Center","Point Guard","Shooting Guard","Power Forward","Small Forward")
#' @param data Dataframe of NBA statistics With the default being DATASET the 2022-2023 season NBA dataset
#' @import dplyr
#' @return Table that produces the means of the basic statistics for chosen position.
#' @export
#'
#' @examples position_stats(position = "Point Guard",data=DATASET)
position_stats = function(position = "Point Guard",data=DATASET){
  mydata = cleandata(data)
  if(!(position %in% mydata$Position)){
    message(paste0("Error: ", position , " is not a valid position in the NBA."))
  }
  else{
  summ_position = mydata %>%
    dplyr::select(Position,FG,TRB,AST,STL,BLK,TOV,PF) %>%
    dplyr::filter(Position == position)

  summ2_position = summ_position %>%
    dplyr::summarize(Position = Position[1],"Field Goals" = mean(FG),
                  "Total Rebounds" = mean(TRB),
                  Assists = mean(AST),
                  Steals = mean(STL),
                  Blocks = mean(BLK),
                  Turnovers = mean(TOV),
                  "Personal Fouls" = mean(PF))
  return(summ2_position)
  }
}


#' This function produces the names of the top specified numbers of players in a certain position
#' based on a particular chosen characteristic
#'
#' @param position Name of position ("Center","Point Guard","Shooting Guard","Power Forward","Small Forward")
#' @param measure Characteristic to compare players based on dataset columns
#' @param topn Integer representing the desired number of top players
#' @param data Dataframe of NBA statistics With the default being DATASET the 2022-2023 season NBA dataset
#' @import dplyr
#' @return topn x 4 table representing the top n players, positions, teams, and desired measurement
#' @export
#'
#' @examples position_best(position = "Center",measure = "PTS",topn = 3,data=DATASET)
position_best = function(position = "Center",measure = "PTS",topn = 3,data=DATASET){
  mydata = cleandata(data)
  if(!(position %in% mydata$Position)){
    message(paste0("Error: ", position, " is not a valid position in the NBA."))
  }
  else{
    summ_position = mydata %>%
      dplyr::select(Player,Tm,Position,measure) %>%
      dplyr::filter(Position == position)
    summ2_position = summ_position[order(summ_position[,measure],decreasing = TRUE),][1:topn,]
    return(summ2_position)
  }
}



#' This function produces the true shooting percentage for a player.
#'
#' @param player Name of NBA Player with the default being LeBron James
#' @param data Dataframe of NBA statistics With the default being DATASET the 2022-2023 season NBA dataset
#'
#' @return Text giving the true shooting percentage for the chosen player
#' @export
#'
#' @examples true_shooting_percentage(player = "LeBron James",data=DATASET)
true_shooting_percentage = function(player = "LeBron James",data=DATASET){
  mydata = cleandata(data)
  if(!(player %in% mydata$Player)){
    message(paste0("Error: ", player, " is not a player in the NBA season."))
  }
  else{
    TSP = 0.5 * (mydata$PTS[mydata$Player==player]) / (mydata$FGA[mydata$Player==player] +
                                                         0.44 * (mydata$FTA[mydata$Player==player]))
    message(paste0("The true shooting percentage for ", player," is ",signif(TSP*100,3),"%"))
  }
}


#' This function produces the rate at which a chosen player gets fouled to shoot a free throw per game
#'
#' @param player Name of NBA Player with the default being Kevin Durant
#' @param data Dataframe of NBA statistics With the default being DATASET the 2022-2023 season NBA dataset
#'
#' @return Text giving the free throw rate per game for the chosen player
#' @export
#'
#' @examples free_throw_rate(player = "Kevin Durant",data=DATASET)
free_throw_rate = function(player = "Kevin Durant",data=DATASET){
  mydata = cleandata(data)
  if(!(player %in% mydata$Player)){
    message(paste0("Error: ", player, " is not a player in the NBA season."))
  }
  else{
    FTR = (mydata$FTA[mydata$Player==player])/(mydata$FGA[mydata$Player ==player])
    message(paste0("The free throw rate for ", player, " is ",signif(FTR*100,3),"%"))
  }
}



#' This function produces the number of assists and turnover rates per game for a chosen player
#'
#' @param player Name of NBA Player with the default being Kyrie Irving
#' @param data Dataframe of NBA statistics With the default being DATASET the 2022-2023 season NBA dataset
#'
#' @return Text giving the number of assists and turnover rates for a chosen player
#' @export
#'
#' @examples basic_stats_rate(player = "Kyrie Irving",data=DATASET)
basic_stats_rate = function(player = "Kyrie Irving",data=DATASET){
  mydata = cleandata(data)
  if(!(player %in% mydata$Player)){
    message(paste0("Error: ", player, " is not a player in the NBA season."))
  }
  else{

    FGTM = sum(mydata$FG[mydata$Tm ==mydata$Tm[mydata$Player==player]])
    MPTM = sum(mydata$MP[mydata$Tm == mydata$Tm[mydata$Player==player]])
    Assists_rate = 100 * mydata$AST[mydata$Player==player]/(((mydata$MP[mydata$Player==player]/(MPTM/5))*FGTM)-
                                                              mydata$FG[mydata$Player==player])

    Turnover_rate = 100 * mydata$TOV[mydata$Player==player]/(mydata$FGA[mydata$Player==player] +
                                                               0.44 * mydata$FTA[mydata$Player==player] +
                                                               mydata$TOV[mydata$Player==player])
    message(paste0("The assists and turnover rates of ", player, " are ",signif(Assists_rate,3),"% ","and ",signif(Turnover_rate,3),"% respectively."))
  }

}

#Plots


#' This function produces a plot to compare the chosen statistical measure for different positions
#'
#' @param measure Characteristic to compare players based on dataset columns
#' @param data Dataframe of NBA statistics With the default being DATASET the 2022-2023 season NBA dataset
#' @import ggplot2
#' @return A barplot comparing the chosen statistical measure across the five positions
#' @export
#'
#' @examples plot_basic_stats(measure = "PTS",data=DATASET)
plot_basic_stats = function(measure = "PTS",data=DATASET){
  mydata = cleandata(data)
  ggplot(mydata,aes(x=Position,y=.data[[measure]])) +
    geom_bar(stat="identity",fill = "#3498DB" ) +
    ggtitle(paste0("Bar plot for number of ", measure, " per game vs. the positions" ))
}


#' This function fits a regression model to either the free throw percentage or the minutes played based on a particular
#' characteristic measure
#'
#' @param response A response variable chosen as either "FT." representing Free Throw Percentage or "MP"
#' representing Minuted Played
#' @param data Dataframe of NBA statistics With the default being DATASET the 2022-2023 season NBA dataset
#' @import gt
#' @import gtsummary
#' @return Regression summary modelling the chosen response
#' @export
#'
#' @examples modelling(response = "FT.",data=DATASET)
modelling = function(response = "FT.",data=DATASET){
  mydata = cleandata(data)
  if(response != "FT." & response != "MP"){
    message("Error: The function models only two responses. Input FT. for Free Throw Percentage or input MP for minutes played.")
  }
  else if(response=="FT."){
    fit_FT = lm(FT.~ Position + FG + eFG. + PTS,data=mydata)
    gtsummary::tbl_regression(fit_FT) %>%
      gtsummary::bold_p(t = 0.05) %>%
      gtsummary::bold_labels() %>%
      gtsummary::italicize_levels() %>%
      gt::tab_header(title = "Linear regression summary modelling Free Throw Percentage per game") %>%
      gtsummary::as_gt()

  }
  else if(response =="MP"){
    fit_MP = lm(MP~Position + Age + FG. + ORB + DRB + PF + PTS,data=mydata)
    gtsummary::tbl_regression(fit_MP) %>%
      gtsummary::bold_p(t = 0.05) %>%
      gtsummary::bold_labels() %>%
      gtsummary::italicize_levels() %>%
      gt::tab_header(title = "Linear regression summary modelling Minutes Played per game") %>%
      gtsummary::as_gt()
  }
}


#' This function produces a correlation panel plot for the NBA season data
#'
#' @param data Dataframe of NBA statistics With the default being DATASET the 2022-2023 season NBA dataset
#'
#' @return A correlation plot of the NBA season data
#' @export
#' @import dplyr
#' @import corrplot
#' @examples get_panels_plot(data=DATASET)
get_panels_plot = function(data=DATASET){
  mydata = cleandata(data) %>%
    dplyr::select(-c(Rk,Player,Pos,Tm,Player.additional,Position,Age,FG.,X3P.,X3PA,X2PA,X2P.,eFG.))
  corrplot(cor(mydata), order = 'AOE', addCoef.col = 'black', tl.pos = 'd',
           cl.pos = 'n', col = COL2('PiYG'))
}
