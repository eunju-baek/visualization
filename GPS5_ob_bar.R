#Create a GPS percentage barplot stratified by clinical obesity category


library(ggplot2)
library(data.table)
d1 <- fread("pheno.txt")

#example_inputdata
colnames(d1)
"ob3" "percent" "g3"
> ggplot(d1,aes(x=ob3,y=percent,fill=g3))+geom_bar(stat='identity',position='dodge')+geom_text(aes(label=percent),vjust=1.5,colour='white',position=position_dodge(.9),size=4,fontface="bold") + scale_x_discrete(limits=c("Normal","Overweight","Obese"))
