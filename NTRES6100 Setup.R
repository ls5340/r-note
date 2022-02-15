install.packages("usethis")
library(usethis)
## use_git_config function with my username and email as arguments
use_git_config(user.name = "ls5340", user.email = "ls929@cornell.edu")
create_github_token()
#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
library(gitcreds) # install.packages("gitcreds")
gitcreds_set()