# Personal Compiz Settings for Ubuntu

## Usage

Currently, the `unity.profile` file defines a list of customized settings for compiz.
To import these settings into the current compiz profile, invoke:

```
$ python import-profile.py unity.profile
```

## Prerequisites

Required packages to be installed:

- compizconfig-settings-manager
- python-compizsettings


## Updating the profile

There is no way to automatically manage the *annotated* profile, AFAIK.
So my workflow for updating the configuration is:

- Using CCSM, change the value of some options.
- Export the current profile excluding the default settings,
  and manually update `unity.profile` by comparing with the exported profile.
- Re-import the profile using the script, and validate it.

### Known issues

- Maintaining the list of active plugins is a little tricky.
