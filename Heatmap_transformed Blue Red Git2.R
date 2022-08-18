# Created on April 30, 2016
# Manuscript for Frontiers in Pediatrics

install.packages("gplots")
library("gplots")


data_genus= read.csv("/Users/... ... /tt_all_genus_double_sorted_n.csv",
                     sep=",", header=T)

# each row is the SAM scores for OTUs of each children with Genus lavel
# Columns are the eight different groups of children based on their mode of delivery, breastfeeding status and antibiotic use

#This data is double sorted in Excel by Phylum and genus

genus_sorted=as.matrix(data_genus[, c(-1,-9, -10)])

 #creating rownames for heatmap y-axis#

genuscolumn= as.character(data_genus[, 10])
names_g= unique(genuscolumn)
index_g= match(names_g, genuscolumn) #Save the first unique genus index in index_g
rnames_g= rep("", length(genuscolumn)) #Creating a vector named "rnames_g" with "" values and length of genuscolumn
rnames_g[index_g]= genuscolumn[index_g] #insert the unique genus name in the blank variable rnames_g
#rownames(genus_sorted)=rnames_g

#Keep the genus names: "g__Actinomyces",  "g__Bifidobacterium",
#  "g__Bacteroides",  "g__Dysgonomonas",  "g__Parabacteroides",
# "g__[Ruminococcus]", "g__Clostridium" , "g__Coprococcus",
#  "g__Lactococcus", "g__Ruminococcus" , "g__Streptococcus",
#  "g__Veillonella" , "g__Fusobacterium",  "g__Escherichia" ,
#  "g__Proteus",  "g__Akkermansia"
#TO FIND THE LOCATION:  which(rnames_g=="g__Actinomyces")


rnames_g11= rep("",853)

#rnames_g11[1]="g_Actinomyces"
rnames_g11[6]="g_Bifidobacterium"
rnames_g11[26]="g__Rothia"
rnames_g11[38]="g_Bacteroides"
#rnames_g11[187]="g_Dysgonomonas"
rnames_g11[189]="g_Parabacteroides"
rnames_g11[204]="g_Prevotella"
#rnames_g11[285]="g__[Eubacterium]"
rnames_g11[287]="g_Ruminococcus"
rnames_g11[323]="g__Anaerococcus" 
rnames_g11[329]="g_Blautia" #Actual 327
rnames_g11[359]="g_Clostridium" 
rnames_g11[381]="g__Collinsella"
rnames_g11[388]="g__Coprococcus"
rnames_g11[409]="Faecalibacterium"
rnames_g11[456]="g__Lachnospira"
rnames_g11[464]="g__Lactobacillus"
rnames_g11[477]="g_Oscillospira"
rnames_g11[497]="g_Roseburia"
rnames_g11[528]="g__Ruminococcus"
rnames_g11[540]="g_Streptococcus"
rnames_g11[583]="g_Veillonella"
rnames_g11[692]="g__Fusobacterium"
rnames_g11[714]="g__Escherichia"
rnames_g11[746]="g__Haemophilus"
rnames_g11[754]="g__Sutterella"
rnames_g11[847]="g__Akkermansia"



rownames(genus_sorted)=rnames_g11



rowlabels= c("Vaginal-Breastfed & \nno Antibiotic use",
             "Vaginal-Breastfed & \nAntibiotic use",
             "Vaginal-not Breastfed & \nAntibiotic use",
              "Vaginal-not Breastfed & \nno Antibiotic use",
              "Elective CS-Breastfed & \nAntibiotic use",
              "Elective CS-notBreastfed & \nAntibiotic use",
              "Emergency CS-Breastfed & \nAntibiotic use")

Antibiotic=3 #Creating shades in the heatmap
#colors = c(seq(-1,-.1,length=Antibiotic),seq(-.1,0.1,length=Antibiotic),seq(0.1,1,length=Antibiotic))
colors = c(-1, -0.1, 0.1, 1)


my_palette <- colorRampPalette(c("blue", "black", "red"))(n = Antibiotic)

genus_sorted2= genus_sorted[, c(5,4,6,7,1,2,3)]

# To verify that the changed row is correct
# name= c("u1", "u2", "u3", "u5", "u6", "u7", "u8")
# nameindex=c(5, 4, 6, 7, 1, 2, 3)
# name[nameindex]


heatmap.2(t(as.matrix(genus_sorted2)), Rowv=FALSE, Colv=FALSE, scale="none", col=my_palette, 
breaks=colors, trace="none",  xlab="", ylab="", margins=c(8,9), density.info="density", 
cexRow=.7,cexCol=.7,  labRow=rowlabels, key=FALSE)

## in order to rotate the picture, cancel t() and change scale from row to column
