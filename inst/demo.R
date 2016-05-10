# Read in the TextGrid file
tg <- readTextGrid("~/Google Drive/kaytetye_share_gd/katia_batch1/b001_file01_kr.TextGrid")

# Let's have a look at it
# It looks like a table where each row is a tier in the TextGrid
View(tg)

# Looks like 'ipa' is one of the tiers in the TextGrid file.
# Let's grab that tier, i.e. row in the table
tier.ipa <- getTierByName(tg, "ipa")

# Since we know that "ipa" is an interval tier, let's grab the intervals
tier.ipa.ints <- getTierIntervals(tier.ipa)

# We can see that there are two intervals, both whose text fields are IPA
# transcriptions of the word in the file, in the Kaytetye annotation schema

# Okay but we can also grab the ipa tiers from all TextGrid files in a given directory

setwd("~/Google Drive/kaytetye_share_gd")

readTextGridDirectory(c("nay_batch1", "katia_batch1")) %>%
  lapply(function(tg) {
    tg %>%
      getTierByName("ipa") %>%
      getTierIntervals()
  }) %>%
  rbind_all() -> batch1_words

