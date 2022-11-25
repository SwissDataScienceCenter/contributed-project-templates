# RStudio Customisations

If you want automatically have your custom RStudio preferences applied to your RStudio server session you can alter the contents of the the `rstudio-prefs.json` file in this directory.
You will also need to uncomment the line in the Dockerfile that copies it to `/home/rstudio/.config/rstudio/rstudio-prefs.json`. 

An example showing more of the available options can be found in `.rstudio_config_dir/custom-rstudio-prefs.json`.
The complete list of options available is avalable here in the [RStudio docs](https://docs.posit.co/ide/server-pro/session_user_settings/session_user_settings.html)

When you change your global preferences in RStudio `~/.config/rstudio/rstudio-prefs.json` is altered on your system.
To keep any changes to your config and have the applied by default in the future copy it to `.rstudio_config_dir` in your Renku project and uncomment the line in the Dockerfile which copies this local copy of the RStudio preferences over the global one.

You can also start up a Renku session, customise you preferences in the RStudio GUI, and copy the altered `~/.config/rstudio/rstudio-prefs.json` to the `.rstudio_config_dir` directory in your renku project. 
Alternatively, the {[rstudio.prefs](https://www.danieldsjoberg.com/rstudio.prefs/index.html)} package has some tooling to make it easier to genrate custom RStudio preferences files programatically.

NB for any Windows users out there you can find this config file in `%appdata%\RStudio` or `AppData/Roaming/RStudio`

