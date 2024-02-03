#import data by yourself

df = `Vragenlijst.AI.foto's.(Antwoorden)...Formulierreacties.1` 


df$Wat.is.uw.geslacht.= ifelse(df$Wat.is.uw.geslacht. == "Vrouw", 0,
                                                    ifelse(df$Wat.is.uw.geslacht. == "Man", 1,
                                                           ifelse(df$Wat.is.uw.geslacht. == "Non-binair", 2, NA)))

df$Wat.is.het.niveau.waaraan.u.momenteel.studeert.of.heeft.gestudeerd..indien.u.al.werkt. <- ifelse(df$Wat.is.het.niveau.waaraan.u.momenteel.studeert.of.heeft.gestudeerd..indien.u.al.werkt. == "Minder dan middelbare school", 0,
                               ifelse(df$Wat.is.het.niveau.waaraan.u.momenteel.studeert.of.heeft.gestudeerd..indien.u.al.werkt. == "Middelbare school", 1,
                                      ifelse(df$Wat.is.het.niveau.waaraan.u.momenteel.studeert.of.heeft.gestudeerd..indien.u.al.werkt. == "MBO", 2,
                                             ifelse(df$Wat.is.het.niveau.waaraan.u.momenteel.studeert.of.heeft.gestudeerd..indien.u.al.werkt. == "HBO", 3,
                                                    ifelse(df$Wat.is.het.niveau.waaraan.u.momenteel.studeert.of.heeft.gestudeerd..indien.u.al.werkt. == "Universitair (Bachelor/Master/PhD)", 4, NA)
                                             )
                                      )
                               )
)



df$Is.uw.vakgebied.of.studierichting.direct.gerelateerd.aan.technische.onderwerpen.zoals.ICT..kunstmatige.intelligentie.en.AI.generatoren. <- ifelse(df$Is.uw.vakgebied.of.studierichting.direct.gerelateerd.aan.technische.onderwerpen.zoals.ICT..kunstmatige.intelligentie.en.AI.generatoren. == "Nee", 0,
                                                                                             ifelse(df$Is.uw.vakgebied.of.studierichting.direct.gerelateerd.aan.technische.onderwerpen.zoals.ICT..kunstmatige.intelligentie.en.AI.generatoren. == "Ja", 1, 2))



summary(df$Waar.heeft.u.AI.generatoren.voorheen.voor.gebruikt..indien.van.toepassing.)


df$Waar.heeft.u.AI.generatoren.voorheen.voor.gebruikt..indien.van.toepassing. <- ifelse(
  df$Waar.heeft.u.AI.generatoren.voorheen.voor.gebruikt..indien.van.toepassing. == "Niet van toepassing", 0,
  ifelse(df$Waar.heeft.u.AI.generatoren.voorheen.voor.gebruikt..indien.van.toepassing. == "Teksten genereren (ChatGPT)", 1,
         ifelse(df$Waar.heeft.u.AI.generatoren.voorheen.voor.gebruikt..indien.van.toepassing. == "Afbeeldingen genereren (DALL-E, Midjourney)", 2, 3)
  )
)



for (i in 14:72) {
  if (i %% 2 == 0) {  # Check if i is even
    df[[i]] <- ifelse(df[[i]] == "Echt", 0,
                      ifelse(df[[i]] == "Nep", 1, NA))
  }
}


df[[75]] =  ifelse(df[[75]] == "Nee", 0,
                   ifelse(df[[75]] == "Ja", 1, NA))

summary(df[[75]])



subGroupCron = df[1:10,]

summary(subGroupCron)
colnames(subGroupCron)

demoGraf=subGroupCron[,c("Wat.is.uw.leeftijd.in.cijfers.","Wat.is.uw.geslacht.","Wat.is.het.niveau.waaraan.u.momenteel.studeert.of.heeft.gestudeerd..indien.u.al.werkt.",
                         "Is.uw.vakgebied.of.studierichting.direct.gerelateerd.aan.technische.onderwerpen.zoals.ICT..kunstmatige.intelligentie.en.AI.generatoren.")]

library(psych)


is.numeric(demoGraf[,1])
demoGraf[,1] = as.numeric(demoGraf[,1])
transposed_df <- t(demoGraf)
cor(transposed_df)
# Calculate Cronbach's alpha
alpha_result <- alpha(transposed_df)

# Print the results
print(alpha_result)


n_items <- ncol(demoGraf)  # number of columns/items
item_vars <- apply(demoGraf, 2, var)  # Calculate the variance for each column
total_var <- sum(item_vars)  # Sum of variances across all items

# Calculate the correlations 
item_corr <- cor(demoGraf)

# Calculate the sum of all correlations, subtracting the diagonal with number of itesm
sum_item_corr <- sum(item_corr) - n_items

# Compute Cronbach's alpha using the formula
cronbach_alpha <- (n_items / (n_items - 1)) * (1 - (total_var - sum_item_corr) / total_var)

print(cronbach_alpha)
