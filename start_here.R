

## initiate creating contents
unlink(setdiff(dir("."), c("start_here.R", "myominnoo.Rproj", ".gitignore", 
                           "README.md")), 
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


# https://mmoo.netlify.app/

rstudioapi::navigateToFile("config.yaml", line = 3)
# title: Myo Minn Oo
# baseurl: 'https://mmoo.netlify.app/' 
# copyright: '© {2021} Myo Minn Oo'


rstudioapi::navigateToFile("./config/_default/params.yaml", line = 15)
# site_type: Person
# local_business_type: 'health'
# org_name: 'Myo Minn Oo'
# description: 'Epidemiologist'
# twitter: 'drmyominnoo'

# font: 'Native'




rstudioapi::navigateToFile("./config/_default/params.yaml", line = 23)
# email: dr.myominnoo@gmail.com
# phone: (66) 061 240 5207
# address:
#   street: 15 Kanchanajavich Road
#   city: Hat Yai
#   region: Songkla
#   postcode: '90110'
#   country: Thailand
#   country_code: TH
# # coordinates:
# #   latitude: '37.4275'
# #   longitude: '-122.1697'
# # directions: Enter Building 1 and take the stairs to Office 200 on Floor 2
# # office_hours:
# #   - 'Monday 10:00 to 13:00'
# #   - 'Wednesday 09:00 to 10:00'
# # appointment_url: 'https://calendly.com'
# contact_links:
#   - icon: twitter
#     icon_pack: fab
#     name: DM Me
#     link: 'https://twitter.com/drmyominnoo'
#   - icon: skype
#     icon_pack: fab
#     name: Skype Me
#     link: 'skype:myoetc'



rstudioapi::navigateToFile("./config/_default/params.yaml", line = 96)
# copyright_license:
#   enable: true


rstudioapi::navigateToFile("./config/_default/params.yaml", line = 130)
# search:
#   provider: wowchemy
#   algolia:
#     app_id: '29OD7VGBD9'
#     api_key: 'a51d80744b499379194ac5a404a81233'
#     index_name: 'myominnoo'
#     show_logo: true


rstudioapi::navigateToFile("./config/_default/params.yaml", line = 150)
# icon:
#   pack:
#     ai: true



rstudioapi::navigateToFile("./config/_default/menus.yaml", line = 6)

# main:
#   - name: Publications
#     url: 
#     weight: 10
#   - name: mStats
#     url: 
#     weight: 20
#   - name: epiData
#     url: 
#     weight: 30
#   - name: Posts
#     url: '#posts'
#     weight: 40
#   - name: Projects
#     url: '#projects'
#     weight: 50
#   - name: Courses
#     url: courses/
#     weight: 60
#   - name: Contact
#     url: '#contact'
#     weight: 70


### change the home section that you don't want to 
# # Activate this widget? true/false
# active: false

## change avatar.jpg
rstudioapi::navigateToFile("./content/authors/admin/_index.md", line = 6)
# ---
# bio: My research interests include infectious diseases in developing countries, epidemiological methods, health system research and global health.
# education:
#   courses:
#   - course: PhD in Epidemiology
#     institution: Prince of Songkla University
#     year: 2021
#   - course: MBBS
#     institution: University of Medicine, Mandalay
#     year: 2013
# email: "dr.myominnoo@gmail.com"
# highlight_name: true
# interests:
# - Infectious diseases in developing countries
# - Epidemiological methods 
# - Health system research 
# - Global health
# organizations:
# - name: Prince of Songkla University
#   url: 
# role: Doctoral Student
# social:
# - icon: envelope
#   icon_pack: fas
#   link: /#contact
# - display:
#     header: true
#   icon: twitter
#   icon_pack: fab
#   label: Follow me on Twitter
#   link: https://twitter.com/drmyominnoo
# - icon: graduation-cap
#   icon_pack: fas
#   link: https://scholar.google.com/citations?user=IWzz0rUAAAAJ&hl=en
# - icon: github
#   icon_pack: fab
#   link: https://github.com/myominnoo
# - icon: linkedin
#   icon_pack: fab
#   link: https://www.linkedin.com/myominnoo
# superuser: true
# title: Myo Minn Oo
# ---
# 
# # Hi there! 
# 
# I am Myo, an epidemiologist and data scientist. My research interests include infectious diseases in developing countries, epidemiological methods, health system research and global health. I also have a strong interest in generation and application of real world data to bring evidence-based interventions and changes that can improve people's health. 
# 
# In addition, I am the developer of R package **mStats** as well as the author of the guide book for EpiData software. I also love to explore and learn new techs like this website. I am currently staying and studying in Thailand.  
# 
# {{< icon name="download" pack="fas" >}} Download my {{< staticref "uploads/resume.pdf" "newtab" >}}resumé{{< /staticref >}}.




## move contact.md to content/ and change widget to blank


# if exists, opens; if not, creates new
blogdown::config_netlify()
blogdown::check_hugo()
blogdown::check_gitignore()
blogdown::check_content()
blogdown::clean_duplicates(preview = FALSE)
blogdown::build_site()

blogdown::config_Rprofile()


blogdown::serve_site()
blogdown::stop_server()


# [TODO] Found 2 files marked as drafts. To un-draft, run the command:
  
blogdown::edit_draft(c(
  "content/privacy.md",
  "content/terms.md"
))
