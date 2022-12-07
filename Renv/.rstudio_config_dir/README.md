# RStudio Customisations

If you want automatically have your custom RStudio preferences applied to your RStudio server session you can alter the contents of the the `rstudio-prefs.json` file in this directory.
You will also need to uncomment the line in the Dockerfile that sets the `RSTUDIO_CONFIG_HOME` environment variable to point to this directory instead of the default: `/home/rstudio/.config/rstudio/rstudio-prefs.json`. 

An example showing more of the available options can be found in `.rstudio_config_dir/custom-rstudio-prefs.json`.
The complete list of options available is avalable here in the [RStudio docs](https://docs.posit.co/ide/server-pro/session_user_settings/session_user_settings.html)

When you change your global preferences in RStudio your current `rstudio-prefs.json` file is altered.
If `RSTUDIO_CONFIG_HOME` is set to a now location is altered there instead of changeing the default preferences file.
To keep any changes to your config and have them applied by default in the future commit your changes to `.rstudio_config_dir/rstudio-prefs.json` in your Renku project.

If you have you customisations setup locally you can copy your preferences to the `.rstudio_config_dir` directory in your Renku project. 
On a Linux system they will be in `~/.config/rstudio/rstudio-prefs.json` 
for any Windows users you can find this config file in `%appdata%\RStudio` or `AppData/Roaming/RStudio`
Alternatively, the {[rstudio.prefs](https://www.danieldsjoberg.com/rstudio.prefs/index.html)} package has some tooling to make it easier to genrate custom RStudio preferences files programatically.


