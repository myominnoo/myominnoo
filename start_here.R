

## initiate creating contents
unlink(setdiff(dir("."), c("start_here.R", "myominnoo.Rproj", ".gitignore")), 
       recursive = TRUE)

# blogdown::new_site(theme = "olOwOlo/hugo-theme-even")
blogdown::new_site(theme = "wowchemy/starter-academic")
y 
y


## testing blogs
blogdown::new_post(title = "Hi Hugo", 
                   ext = '.Rmarkdown', 
                   subdir = "post")
blogdown::serve_site()

blogdown::build_site()
blogdown::check_gitignore()
file.edit(".gitignore")


blogdown::check_content()
## <<<<--- Sync with GitHub
## <<<<--- Now publish in netlify.com
# https://app.netlify.com/teams/myominnoo/overview



# if exists, opens; if not, creates new
blogdown::config_netlify()
blogdown::check_hugo()
blogdown::check_gitignore()
blogdown::check_content()
blogdown::build_site()

blogdown::config_Rprofile()


blogdown::stop_server()



