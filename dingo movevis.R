

library(move)
library(moveVis)
library(lubridate)
library(dplyr)


yd8$Latitude[d8$Latitude==0] <- NA

d8$Longitude[d8$Longitude==0] <- NA

d8 <- d8[complete.cases(d8), ]


D8 <- move(x = d8$Longitude, y = d8$Latitude, time = d8$date, proj=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84"), animal = d8$ID)

# align move_data to a uniform time scale
m2 <- align_move(D8, res = 60, unit = "mins")

# create spatial frames with a OpenStreetMap watercolour map
frames <- frames_spatial(m2, path_colours = "blue",
                         map_service = "mapbox", map_type = "satellite", map_token = "pk.eyJ1IjoiYnBpdGNoZXIiLCJhIjoiY2tvdzhlNHdnMDM0azJ2bWd2dHl0b2F4diJ9.PIVluh42PYZ-T51_HC9Gxw") %>%
  add_labels(x = "Longitude", y = "Latitude") %>% # add some customizations, such as axis labels
  add_northarrow() %>%
  add_scalebar() %>%
  add_timestamps(m2, type = "label") %>%
  add_progress()

frames[[10]] # preview one of the frames, e.g. the 100th frame

# animate frames
animate_frames(frames, out_file = "Michelle.gif")



### Trying all dingoes and a movestack

d5 <- read.csv("D5Sep.csv", header = TRUE)
d6 <- read.csv("D6Sep.csv", header = TRUE)
d7 <- read.csv("D7Sep.csv", header = TRUE)
d8 <- read.csv("D8Sep.csv", header = TRUE)

d5$ID <- "SLF2003"
d6$ID <- "Red Dog"
d7$ID <- "Bombah Boy"
d8$ID <- "Michelle"

d5$date <- make_datetime(year = 2000 + d5$Year, day = d5$Day, hour = d5$Hour )
d6$date <- make_datetime(year = 2000 + d6$Year, day = d6$Day, hour = d6$Hour )
d7$date <- make_datetime(year = 2000 + d7$Year, day = d7$Day, hour = d7$Hour )
d8$date <- make_datetime(year = 2000 + d8$Year, day = d8$Day, hour = d8$Hour )


data <- rbind(d5, d6)
data <- rbind(data, d7)
data <- rbind(data, d8)

data$Latitude[data$Latitude==0] <- NA

data$Longitude[data$Longitude==0] <- NA

data <- data[complete.cases(data), ]

data <- data[!duplicated(data), ]






alldogs <- move(x = data$Longitude, y = data$Latitude, time = data$date, proj=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84"), animal = data$ID)

# align move_data to a uniform time scale
m <- align_move(alldogs, res = 60, unit = "mins")

# create spatial frames with a OpenStreetMap watercolour map
frames <- frames_spatial(m, path_colours = c("blue", "Red", "Green", "Yellow"),
                         map_service = "mapbox", map_type = "satellite", map_token = "pk.eyJ1IjoiYnBpdGNoZXIiLCJhIjoiY2tvdzhlNHdnMDM0azJ2bWd2dHl0b2F4diJ9.PIVluh42PYZ-T51_HC9Gxw") %>%
  add_labels(x = "Longitude", y = "Latitude") %>% # add some customizations, such as axis labels
  add_northarrow() %>%
  add_scalebar() %>%
  add_timestamps(m, type = "label") %>%
  add_progress()

frames[[10]] # preview one of the frames, e.g. the 100th frame

# animate frames
animate_frames(frames, out_file = "alldogsSep.avi")


# Red Dog 9-9-21

red <- read.csv("red.csv", header = TRUE)

red$ID <- "Red Dog"

red$date <- make_datetime(year = 2000 + red$Year, day = red$Day, hour = red$Hour )

red$Latitude[red$Latitude==0] <- NA

red$Longitude[red$Longitude==0] <- NA

red <- red[complete.cases(red), ]

reddog <- move(x = red$Longitude, y = red$Latitude, time = red$date, proj=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84"), animal = red$ID)

# align move_data to a uniform time scale
red2 <- align_move(reddog, res = 60, unit = "mins")

# create spatial frames with a OpenStreetMap watercolour map
frames <- frames_spatial(red2, path_colours = "blue",
                         map_service = "mapbox", map_type = "satellite", map_token = "pk.eyJ1IjoiYnBpdGNoZXIiLCJhIjoiY2tvdzhlNHdnMDM0azJ2bWd2dHl0b2F4diJ9.PIVluh42PYZ-T51_HC9Gxw") %>%
  add_labels(x = "Longitude", y = "Latitude") %>% # add some customizations, such as axis labels
  add_northarrow() %>%
  add_scalebar() %>%
  add_timestamps(red2, type = "label") %>%
  add_progress()

frames[[10]] # preview one of the frames, e.g. the 100th frame

# animate frames
animate_frames(frames, out_file = "red1.gif")




#Michelle 13-9-21

d8 <- read.csv("D8Sep.csv", header = TRUE)

d8$ID <- "Michelle"

d8$date <- make_datetime(year = 2000 + d8$Year, day = d8$Day, hour = d8$Hour )

d8$Latitude[d8$Latitude==0] <- NA

d8$Longitude[d8$Longitude==0] <- NA

d8 <- d8[complete.cases(d8), ]

d8 <- d8[!duplicated(d8), ]


michellemove <- move(x = d8$Longitude, y = d8$Latitude, time = d8$date, proj=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84"), animal = d8$ID)

# align move_data to a uniform time scale
m2 <- align_move(michellemove, res = 60, unit = "mins")

# create spatial frames with a OpenStreetMap satellite map
frames <- frames_spatial(m2, path_colours = "blue",
                         map_service = "mapbox", map_type = "satellite", map_token = "pk.eyJ1IjoiYnBpdGNoZXIiLCJhIjoiY2tvdzhlNHdnMDM0azJ2bWd2dHl0b2F4diJ9.PIVluh42PYZ-T51_HC9Gxw") %>%
  add_labels(x = "Longitude", y = "Latitude") %>% # add some customizations, such as axis labels
  add_northarrow() %>%
  add_scalebar() %>%
  add_timestamps(m2, type = "label") %>%
  add_progress()

frames[[10]] # preview one of the frames, e.g. the 100th frame

# animate frames
animate_frames(frames, out_file = "michelleSep.gif")


#SLF2003 13-9-21

d5 <- read.csv("D5Sep.csv", header = TRUE)

d5$ID <- "SLF2003"

d5$date <- make_datetime(year = 2000 + d5$Year, day = d5$Day, hour = d5$Hour )

d5$Latitude[d5$Latitude==0] <- NA

d5$Longitude[d5$Longitude==0] <- NA

d5 <- d5[complete.cases(d5), ]

d5 <- d5[!duplicated(d5), ]


SLFmove <- move(x = d5$Longitude, y = d5$Latitude, time = d5$date, proj=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84"), animal = d5$ID)

# align move_data to a uniform time scale
SLF2 <- align_move(SLFmove, res = 60, unit = "mins")

# create spatial frames with a OpenStreetMap satellite map
frames <- frames_spatial(SLF2, path_colours = "blue",
                         map_service = "mapbox", map_type = "satellite", map_token = "pk.eyJ1IjoiYnBpdGNoZXIiLCJhIjoiY2tvdzhlNHdnMDM0azJ2bWd2dHl0b2F4diJ9.PIVluh42PYZ-T51_HC9Gxw") %>%
  add_labels(x = "Longitude", y = "Latitude") %>% # add some customizations, such as axis labels
  add_northarrow() %>%
  add_scalebar() %>%
  add_timestamps(SLF2, type = "label") %>%
  add_progress()

frames[[10]] # preview one of the frames, e.g. the 100th frame

# animate frames
animate_frames(frames, out_file = "SLF2003Sep.gif")


#Red Dog 14-9-21

d6 <- read.csv("D6Sep.csv", header = TRUE)

d6$ID <- "Red Dog"

d6$date <- make_datetime(year = 2000 + d6$Year, day = d6$Day, hour = d6$Hour )

d6$Latitude[d6$Latitude==0] <- NA

d6$Longitude[d6$Longitude==0] <- NA

d6 <- d6[complete.cases(d6), ]

d6 <- d6[!duplicated(d6), ]


Redmove <- move(x = d6$Longitude, y = d6$Latitude, time = d6$date, proj=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84"), animal = d6$ID)

# align move_data to a uniform time scale
Red2 <- align_move(Redmove, res = 60, unit = "mins")

# create spatial frames with a OpenStreetMap satellite map
frames <- frames_spatial(Red2, path_colours = "blue",
                         map_service = "mapbox", map_type = "satellite", map_token = "pk.eyJ1IjoiYnBpdGNoZXIiLCJhIjoiY2tvdzhlNHdnMDM0azJ2bWd2dHl0b2F4diJ9.PIVluh42PYZ-T51_HC9Gxw") %>%
  add_labels(x = "Longitude", y = "Latitude") %>% # add some customizations, such as axis labels
  add_northarrow() %>%
  add_scalebar() %>%
  add_timestamps(Red2, type = "label") %>%
  add_progress()

frames[[10]] # preview one of the frames, e.g. the 100th frame

# animate frames
animate_frames(frames, out_file = "RedDogSep.gif")


#Bombah Boy 14-9-21

d7 <- read.csv("D7Sep.csv", header = TRUE)

d7$ID <- "Bombah Boy"

d7$date <- make_datetime(year = 2000 + d7$Year, day = d7$Day, hour = d7$Hour )

d7$Latitude[d7$Latitude==0] <- NA

d7$Longitude[d7$Longitude==0] <- NA

d7 <- d7[complete.cases(d7), ]

d7 <- d7[!duplicated(d7), ]


BBmove <- move(x = d7$Longitude, y = d7$Latitude, time = d7$date, proj=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84"), animal = d7$ID)

# align move_data to a uniform time scale
BB2 <- align_move(BBmove, res = 60, unit = "mins")

# create spatial frames with a OpenStreetMap satellite map
frames <- frames_spatial(BB2, path_colours = "blue",
                         map_service = "mapbox", map_type = "satellite", map_token = "pk.eyJ1IjoiYnBpdGNoZXIiLCJhIjoiY2tvdzhlNHdnMDM0azJ2bWd2dHl0b2F4diJ9.PIVluh42PYZ-T51_HC9Gxw") %>%
  add_labels(x = "Longitude", y = "Latitude") %>% # add some customizations, such as axis labels
  add_northarrow() %>%
  add_scalebar() %>%
  add_timestamps(BB2, type = "label") %>%
  add_progress()

frames[[10]] # preview one of the frames, e.g. the 100th frame

# animate frames
animate_frames(frames, out_file = "BombahBoySep.gif")


#Tekka 

tekka <- read.csv("rangedate_D051895_20220825235425.txt", header = TRUE)

tekka$ID <- "Tekka"

tekka$date <- NA

tekka$date <- make_datetime(year = 2000 + tekka$Year, day = tekka$Julianday, hour = tekka$Hour )

tekka$Latitude[tekka$Latitude==0] <- NA

tekka$Longitude[tekka$Longitude==0] <- NA

tekka <- tekka[complete.cases(tekka), ]

tekka <- tekka[!duplicated(tekka), ]


BBmove <- move(x = tekka$Longitude, y = tekka$Latitude, time = tekka$date, proj=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84"), animal = tekka$ID)

# align move_data to a uniform time scale
BB2 <- align_move(BBmove, res = 60, unit = "mins")

# create spatial frames with a OpenStreetMap satellite map
frames <- frames_spatial(BB2, path_colours = "blue",
                         map_service = "mapbox", map_type = "satellite", map_token = "pk.eyJ1IjoiYnBpdGNoZXIiLCJhIjoiY2tvdzhlNHdnMDM0azJ2bWd2dHl0b2F4diJ9.PIVluh42PYZ-T51_HC9Gxw") %>%
  add_labels(x = "Longitude", y = "Latitude") %>% # add some customizations, such as axis labels
  add_northarrow() %>%
  add_scalebar() %>%
  add_timestamps(BB2, type = "label") %>%
  add_progress()

frames[[10]] # preview one of the frames, e.g. the 100th frame

# animate frames
animate_frames(frames, out_file = "TekkaApr-Aug2022.gif")


### Trying tekka and SLF2003 for June to Aug 2022

tekka <- read.csv("rangedate_D051895_20220825235425.txt", header = TRUE)
slf <- read.csv("slf2003.txt", header = TRUE)

tekka$ID <- "Tekka"
slf$ID <- "SLF2003"


tekka$date <- make_datetime(year = 2000 + tekka$Year, day = tekka$Julianday, hour = tekka$Hour )
slf$date <- make_datetime(year = 2000 + slf$Year, day = slf$Day, hour = slf$Hour )

tekka <- select(tekka, c("Latitude", "Longitude", "ID", "date"))
slf <- select(slf, c("Latitude", "Longitude", "ID", "date"))


data <- rbind(tekka, slf)

data$Latitude[data$Latitude==0] <- NA

data$Longitude[data$Longitude==0] <- NA

data <- data[complete.cases(data), ]

data <- data[!duplicated(data), ]

data <- data[ which(data$date >= "2022-06-01"
                      & data$date <= "2022-08-22"), ]


alldogs <- move(x = data$Longitude, y = data$Latitude, time = data$date, proj=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84"), animal = data$ID)

# align move_data to a uniform time scale
m <- align_move(alldogs, res = 60, unit = "mins")

# create spatial frames with a OpenStreetMap watercolour map
frames <- frames_spatial(m, path_colours = c("blue", "Red"),
                         map_service = "mapbox", map_type = "satellite", map_token = "pk.eyJ1IjoiYnBpdGNoZXIiLCJhIjoiY2tvdzhlNHdnMDM0azJ2bWd2dHl0b2F4diJ9.PIVluh42PYZ-T51_HC9Gxw") %>%
  add_labels(x = "Longitude", y = "Latitude") %>% # add some customizations, such as axis labels
  add_northarrow() %>%
  add_scalebar() %>%
  add_timestamps(m, type = "label") %>%
  add_progress()

frames[[10]] # preview one of the frames, e.g. the 100th frame

# animate frames
animate_frames(frames, out_file = "tekka_and_slf2003.gif")




# Andy 1-9-22

andy <- read.csv("andy.txt", header = TRUE)

andy$ID <- "Andy"

andy$date <- make_datetime(year = 2000 + andy$Year, day = andy$Day, hour = andy$Hour )

andy$Latitude[andy$Latitude==0] <- NA

andy$Longitude[andy$Longitude==0] <- NA

andy <- andy[complete.cases(andy), ]

andy <- andy[!duplicated(andy), ]


BBmove <- move(x = andy$Longitude, y = andy$Latitude, time = andy$date, proj=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84"), animal = andy$ID)

# align move_data to a uniform time scale
BB2 <- align_move(BBmove, res = 60, unit = "mins")

# create spatial frames with a OpenStreetMap satellite map
frames <- frames_spatial(BB2, path_colours = "blue",
                         map_service = "mapbox", map_type = "satellite", map_token = "pk.eyJ1IjoiYnBpdGNoZXIiLCJhIjoiY2tvdzhlNHdnMDM0azJ2bWd2dHl0b2F4diJ9.PIVluh42PYZ-T51_HC9Gxw") %>%
  add_labels(x = "Longitude", y = "Latitude") %>% # add some customizations, such as axis labels
  add_northarrow() %>%
  add_scalebar() %>%
  add_timestamps(BB2, type = "label") %>%
  add_progress()

frames[[10]] # preview one of the frames, e.g. the 100th frame

# animate frames
animate_frames(frames, out_file = "Andy.gif")


