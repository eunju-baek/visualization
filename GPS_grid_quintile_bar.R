#Create a barplot stratified by quintile grid

#root data frame >> bbb 

#x-axis>> ENV | y-axis >> MSE | grid by GPS quintile

ggplot(bbb,aes(x=ENV,y=Chage of MSE,fill=ENV))+geom_bar(stat='identity',position='dodge')+facet_grid(~ Quintile)+theme(axis.text.x=element_text(angle=45,hjust=1,face = 'bold'))+xlab("Environmental factor")+ylab("Change in ")+scale_x_discrete(breaks=NULL)+scale_fill_discrete(name = "Environmental factor")


