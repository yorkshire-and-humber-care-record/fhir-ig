# Implementation Guide for FHIR standards
### Quickstart 


 - Clone repo
 - Install Sushi https://fshschool.org/docs/sushi/installation/
 - Install the FHIR IG Publisher tool https://confluence.hl7.org/display/FHIR/IG+Publisher+Documentation#IGPublisherDocumentation-QuickStart
 - From the project directory run _updatePublisher (a one off to download the IG publisher tool and scripts)
 - From the project directory run _genonceYHCR (the main build script)
 - Go to the "output" folder and view "index.html"

To continue editing
 - Examine the source in folder "fsh-tank/input/fsh"
 - Edit using VS Code and the "FHIR Shorthand" extension from Mitre Health (mitre-health.vscode-language-fsh)
 - Run _genonceYHCR to rebuild
 
