library(ggplot2)


# 1. load the data
# df_raw = read.csv("/media/windows11/PhD_PQS/ggplot_tutorial/mouse_drug.csv")
# df_stat = read.csv("/media/windows11/PhD_PQS/ggplot_tutorial/mouse_drug_stat.csv")
# save_path = "/media/windows11/PhD_PQS/ggplot_tutorial"

df_raw = read.csv("F:\\PhD_PQS\\ggplot_tutorial\\mouse_drug.csv")
df_stat = read.csv("F:\\PhD_PQS\\ggplot_tutorial\\mouse_drug_stat.csv")
save_path = "F:\\PhD_PQS\\ggplot_tutorial"

# 2. know about your data - can be done using MS Excel
# head(df_raw)
# summary(df_raw)
# View(df_raw)


# 3. bar plot

# 3.1 bar plot on df_stat - day1
df_stat_day1 = df_stat[which(df_stat$day == 1),]

# head(df_stat_day1)

barplot_day1 = ggplot(df_stat_day1, aes(x=group, y=weight_mean)) + 
    geom_col(aes(fill=group)) + 
    theme(

        panel.background=element_blank(),
        axis.line=element_line(color="black", linewidth=0.5),

        axis.text=element_text(color="black", size=10, face="italic", family="Times New Roman"),

        axis.title=element_text(color="black", size=15, face="bold"),
        axis.title.x=element_text(family="Arial"),
        axis.title.y=element_text(family="Comic Sans MS"),
        
        axis.ticks.length=unit(0.25, units="cm"),

        legend.position="bottom",
        legend.title=element_text(color="black", size=12, face="bold", family="mono"),
        legend.text=element_text(color="black", size=12, face="bold.italic", family="Times New Roman")
    ) + 
    scale_fill_manual("Test group", values=c("red", "blue")) + 
    scale_x_discrete("Test group", labels=c("Control", "Experiment")) + 
    scale_y_continuous("Weight (g)", expand=c(0, 0.5), breaks=seq(0, 45, 5), 
                       limits=c(NA, 40))

face_list = c("bold", "italic", "bold.italic")
family_list = c("Times New Roman", "Arial", "mono", "Comic Sans MS", "Calibri")

# theme_bw()
# theme_classic()
# theme_light()
# theme_dark()
# theme_get()
# theme_minimal()

# barplot_day1 

ggsave("barplot_day1.png", path=save_path, width=10, height=10, 
       units="cm", dpi=600, plot=barplot_day1)



# Practise

# 1. plot the day 3

# 2. change the legend position to the top

# 3. make the font family consistent to be "Arial"

# 4. change the color into "#12CF62" and "#CF5F12"















