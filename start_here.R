

blogdown::new_site(theme = "olOwOlo/hugo-theme-even")
# blogdown::new_site(theme = "wowchemy/starter-academic")
blogdown::serve_site()

blogdown::new_post(title = "Hi Hugo", 
                   ext = '.Rmarkdown', 
                   subdir = "post")



blogdown::new_post(title = "second post test", 
                   ext = '.Rmarkdown', 
                   subdir = "post")


blogdown::new_post(title = "third post test", 
                   ext = '.Rmarkdown', 
                   subdir = "post")

blogdown::build_site()
blogdown::check_gitignore()
blogdown::check_content()
blogdown::config_Rprofile()

blogdown::stop_server()


unlink(setdiff(dir("."), c("start_here.R", "myominnoo.Rproj", ".gitignore")), 
       recursive = TRUE)
