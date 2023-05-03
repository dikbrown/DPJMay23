library(readr)
library(ggplot2)

oilrig <- data.frame(read_csv('./data/HourlyData.csv'))
profile <- data.frame(read_tsv('./data/profile.txt', col_names = FALSE))
names(profile) <- c('cooler', 'valve', 'pump_leakage', 'hydraulic_accumulator', 'stable')


PS1 <- data.frame(read_tsv('./data/PS1.txt', col_names = FALSE))



######################
## cooler condition:   3 = close to total failure
##                    20 = reduced efficiency
##                   100 = full efficiency
## valve condition:  100 = optimal switching behavior
##                    90 = small lag
##                    80 = severe lag
##                    73

ggplot(data = oilrig, aes(x = Date, y = Cooling.efficiency)) +    # Very spiky in May, plus one in mid-Jun
  geom_line() +
  ggtitle('Cooling Efficiency')

ggplot(data = oilrig, aes(x = Date, y = Cooling.power)) +         # Spike-drop in Late April, spike-increase late May, spike-increase, late Jun
  geom_line() +
  ggtitle('Cooling Power')

ggplot(data = oilrig, aes(x = Date, y = Motor.power.W)) +         # Very spiky in May. drop in late April, increases in late May, late Jun
  geom_line() +                                                   #    periodic small spike-up/step-downs ~2wk after large spikes
  ggtitle('Motor Power/W')

ggplot(data = oilrig, aes(x = Date, y = Efficiency.factor)) +         # Very spiky in May. drop in late April, increases in late May, late Jun
  geom_line() +                                                   #    periodic small spike-up/step-downs ~2wk after large spikes
  ggtitle('Efficiency Factor')

ggplot(data = oilrig) +
#  geom_line(aes(x = Date, y = Pressure.bar.1), color = 'red') +   # this spikes up several times May
#  geom_line(aes(x = Date, y = Pressure.bar.2), color = 'blue') +  # this spikes up several times May
  geom_line(aes(x = Date, y = Pressure.bar.3), color = 'black') +  # this spikes down several times May
  geom_line(aes(x = Date, y = Pressure.bar.4), color = 'green') +  # this spikes up several times May, also late-Jun/early-Jul
  geom_line(aes(x = Date, y = Pressure.bar.5), color = 'yellow') +  # rapid drop in April, rapid rise in late May and in late Jun
  geom_line(aes(x = Date, y = Pressure.bar.6), color = 'cyan')      # rapid drop in April, rapid rise in late May and in late Jun


ggplot(data = oilrig) +
  geom_line(aes(x = Date, y = Temperature.1), color = 'red') +   # 
  geom_line(aes(x = Date, y = Temperature..2), color = 'blue') +  # 
  geom_line(aes(x = Date, y = Temperature..3), color = 'black') +  # 
  geom_line(aes(x = Date, y = Temperature..4), color = 'green')   # 
  
# all temperatures follow an inverse relationship to P5 and P6
#   they have almost identical trends, but at different temps
#   T2 > T3 > T1 > T4
   
# Compare red temp trend with yellow/cyan pressure trends
ggplot(data = oilrig) +
  geom_line(aes(x = Date, y = Temperature.1/7), color = 'red') +   # 
  geom_line(aes(x = Date, y = Pressure.bar.5), color = 'yellow') +  # rapid drop in April, rapid rise in late May and in late Jun
  geom_line(aes(x = Date, y = Pressure.bar.6), color = 'cyan')      # rapid drop in April, rapid rise in late May and in late Jun


ggplot(data = oilrig) +
  geom_line(aes(x = Date, y = Volume.flow.l.min.1), color = 'red') +   # extremely variable, with spikes in May-Jun
  geom_line(aes(x = Date, y = Volume.flow.l.min.2), color = 'yellow')  # 

ggplot(data = oilrig) +
  geom_line(aes(x = Date, y = Volume.flow.l.min.2), color = 'red') +   # Flow 1 follows P5/6 readings
  geom_line(aes(x = Date, y = Pressure.bar.5), color = 'yellow')       


