import pandas as pd
import numpy as np
np.random.seed(100)

# simulate two groups of mouse on their weights: ctrl vs drug
"""mouse_per_group = 100

ctrl_weight_mean = 18
ctrl_weight_std = 2.5

drug_weight_mean = 36
drug_weight_std = 2.5

days = [i for i in range(1, 8)]
ctrl_weight = {}
drug_weight = {}

for day in days:
    ctrl_weight["day{}".format(day)] = np.random.normal(loc=ctrl_weight_mean, scale=ctrl_weight_std, size=mouse_per_group)
    drug_weight["day{}".format(day)] = np.random.normal(loc=drug_weight_mean - (day - 1) * 3, scale=drug_weight_std, size=mouse_per_group)


ctrl_mouse_id = ["c{}".format(i) for i in range(mouse_per_group)]
drug_mouse_id = ["d{}".format(i) for i in range(mouse_per_group)]

df_out = pd.DataFrame()

for day in days:
    df_ctrl = pd.DataFrame()
    df_ctrl["mouse_id"] = ctrl_mouse_id
    df_ctrl["day"] = day
    df_ctrl["group"] = "ctrl"
    df_ctrl["weight"] = ctrl_weight["day{}".format(day)]

    df_drug = pd.DataFrame()
    df_drug["mouse_id"] = drug_mouse_id
    df_drug["day"] = day
    df_drug["group"] = "drug"
    df_drug["weight"] = drug_weight["day{}".format(day)]

    df_out = pd.concat([df_out, df_ctrl, df_drug], axis=0)

df_out.to_csv("/media/windows11/PhD_PQS/ggplot_tutorial/mouse_drug.csv", index=False)

df_stat = pd.DataFrame()
idx = 0

for day in days:
    df_day_ctrl = df_out.loc[(df_out["day"] == day) & (df_out["group"] == "ctrl")]
    weight_mean = df_day_ctrl["weight"].mean()
    weight_std = df_day_ctrl["weight"].std()
    df_stat.loc[idx, ["group", "day", "weight_mean", "weight_std"]] = ["ctrl", day, weight_mean, weight_std]
    idx += 1

    df_day_drug = df_out.loc[(df_out["day"] == day) & (df_out["group"] == "drug")]
    weight_mean = df_day_drug["weight"].mean()
    weight_std = df_day_drug["weight"].std()
    df_stat.loc[idx, ["group", "day", "weight_mean", "weight_std"]] = ["drug", day, weight_mean, weight_std]
    idx += 1

df_stat["day"] = df_stat["day"].apply(int)

df_stat.to_csv("/media/windows11/PhD_PQS/ggplot_tutorial/mouse_drug_stat.csv", index=False)
"""

# simulate the interaction on genes/proteins
genes = ["gene{}".format(i) for i in range(1, 10)]

# gene 1, 2, and 3 have strong interactions with each other
# gene 6, 7, and 8 have strong interactions with each other

df_out = pd.DataFrame()
idx = 0

for gene_A in genes:
    for gene_B in genes:
        df_out.loc[idx, "gene_A"] = gene_A
        df_out.loc[idx, "gene_B"] = gene_B

        if gene_A in ["gene1", "gene2", "gene3"] and gene_B in ["gene1", "gene2", "gene3"]:
            score = np.random.normal(loc=0.5, scale=0.3)
            if score > 1:
                score = 1
            df_out.loc[idx, "score"] = score
        elif gene_A in ["gene6", "gene7", "gene8"] and gene_B in ["gene6", "gene7", "gene8"]:
            score = np.random.normal(loc=0.85, scale=0.2)
            if score > 1:
                score = 1
            df_out.loc[idx, "score"] = score
        else:
            score = np.random.normal(loc=-0.5, scale=0.4)
            if score < -1:
                score = -1
            df_out.loc[idx, "score"] = score
        idx += 1

df_out.to_csv("/media/windows11/PhD_PQS/ggplot_tutorial/gene_interaction.csv", index=False)



