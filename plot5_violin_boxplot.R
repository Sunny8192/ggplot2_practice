library(ggplot2)
library(ggprism)


# 1. load the data
df_raw = read.csv("/media/windows11/PhD_PQS/ggplot_tutorial/mouse_drug.csv")
df_stat = read.csv("/media/windows11/PhD_PQS/ggplot_tutorial/mouse_drug_stat.csv")
save_path = "/media/windows11/PhD_PQS/ggplot_tutorial"

# 2. violin plot
df_raw_day1 = df_raw[which(df_raw$day == 1),]

violinplot_day1 = ggplot(df_raw_day1, aes(x=group, y=weight)) + 
    geom_violin(aes(fill=group)) + 
    geom_jitter(size=0.5) + 
    theme(
        panel.background=element_blank(),
        axis.line=element_line(color="black", linewidth=0.5),
        axis.text=element_text(color="black", size=10, family="Arial"),
        axis.title=element_text(color="black", size=15, face="bold", family="Arial"),
        axis.title.x=element_blank(),
        legend.position="bottom",
        legend.title=element_text(color="black", size=12, face="bold", family="Arial"),
        legend.text=element_text(color="black", size=12, family="Arial")
    ) + 
    scale_fill_manual("Group", values=c("lightgray", "#CF1212"), labels=c("Control", "Drug")) + 
    scale_color_manual("Group", values=c("lightgray", "#CF1212"), labels=c("Control", "Drug")) + 
    scale_x_discrete("Group", expand=c(0.65, 0), labels=c("Control", "Drug")) + 
    scale_y_continuous("Weight (g)", expand=c(0, 0.5), breaks=seq(0, 50, 5), 
                       limits=c(0, 47))

# add the p_value
# t_test_results = t.test(weight ~ group, data=df_raw_day1)
# p_value = t_test_results$p.value

# p_value = signif(p_value, digits=4)

# t_test_p_val = data.frame(group1="ctrl", group2="drug", label=p_value)

# violinplot_day1 = violinplot_day1 + add_pvalue(t_test_p_val, y.position=43.5, bracket.size=0.5, 
#                                          tip.length=0.02, label.size=4.5,
#                                          fontfamily="Arial")

ggsave("violinplot_day1_error.png", path=save_path, width=7.5, height=10, 
       units="cm", dpi=600, plot=violinplot_day1)


# 3. boxplot
df_raw_day1 = df_raw[which(df_raw$day == 1),]

boxplot_day1 = ggplot(df_raw_day1, aes(x=group, y=weight)) + 
    geom_boxplot(aes(fill=group)) + 
    theme(
        panel.background=element_blank(),
        axis.line=element_line(color="black", linewidth=0.5),
        axis.text=element_text(color="black", size=10, family="Arial"),
        axis.title=element_text(color="black", size=15, face="bold", family="Arial"),
        axis.title.x=element_blank(),
        legend.position="bottom",
        legend.title=element_text(color="black", size=12, face="bold", family="Arial"),
        legend.text=element_text(color="black", size=12, family="Arial")
    ) + 
    scale_fill_manual("Group", values=c("lightgray", "#CF1212"), labels=c("Control", "Drug")) + 
    scale_color_manual("Group", values=c("lightgray", "#CF1212"), labels=c("Control", "Drug")) + 
    scale_x_discrete("Group", expand=c(0.65, 0), labels=c("Control", "Drug")) + 
    scale_y_continuous("Weight (g)", expand=c(0, 0.5), breaks=seq(0, 50, 5), 
                       limits=c(0, 47))

ggsave("boxplot_day1_error.png", path=save_path, width=7.5, height=10, 
       units="cm", dpi=600, plot=boxplot_day1)


# Practice

# plot day 3, and adjust the figure, such as p_value_position

# add the p-value












