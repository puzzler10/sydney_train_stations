library(pacman)
p_load(dplyr)
p_load(tidyr)
p_load(ggmap)
p_load(animation)


dat = read.csv("sydney_train_stations.csv")

#railway line is dodgy, don't use it 
#first thing we need to do is get lat and long of each station 
stations = paste(dat$name, "Station, NSW, Australia")

#use geocode function from ggmap to get lat and lon for each station 
coords = geocode(stations)
#add it to our data frame
dat = as.data.frame(cbind(dat, coords) )

#save the results because that took effort 
write.csv(dat,"sydney_train_stations_coordinates.csv", row.names = FALSE)

##################
dat = read.csv("sydney_train_stations_coordinates.csv", stringsAsFactors = FALSE)
dat$date_opened =  as.Date(dat$date_opened, format = "%d/%m/%Y")

#get sydney map, but set the center a bit to the right to account for water 
sydney_coords = geocode("Sydney")

sydney = get_map(location = c(lon = (151.2093 - 0.2), lat = -33.86882 ),
                 maptype = "toner-background" ,
                 zoom = 10)

### Animation ### 
### For each 10 year block, plot the points 
date_cutoffs = seq.Date(from = as.Date("1860/1/1"), to = as.Date("2020/1/1"), by = "10 years")


saveHTML({
    for(i in 1:length(date_cutoffs)) {
        df = dat %>% filter(date_opened <= date_cutoffs[i])
        g = ggmap(sydney) + 
            geom_point(data = df, 
                       aes(x = lon, y = lat),
                       color = "red", 
                       size = 2) + 
            ggtitle(format(date_cutoffs[i],'%Y'))
        plot(g)
        ani.pause()
    }
}, img.name = "train_plot", navigator = FALSE, html_file = "train_plot.html")


#plot points on the map 
ggmap(sydney) + 
    geom_point(data = dat, 
               aes(x = lon, y = lat),
               color = "red", 
               size = 2)



