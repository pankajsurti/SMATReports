# SMAT Reports

The SMAT Reports is a small project to make use of the reports generated from the SMAT Tool. 
Please read [here](https://docs.microsoft.com/en-us/sharepointmigration/overview-of-the-sharepoint-migration-assessment-tool) to see more details about SMAT Tool. 
This small project goes over some templates to create List to store SMAT data. It also goes over to create the Power BI reports.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need 

```
You will need SharePoint On Premises farm with SMAT tool installed it.
OR
SMAT reports files generated from your customer's On Premises SharePoint farm.
```

### Installing

Create a Site on a SharePoint site say http://[YOURTENANT].sharepoint.com/sites/spomigrations

```
Run the Create-MigrationTrackerList.ps1 script
NOTE: Modify the TODO lines in the script
```

And Makes sure your SiteAssessment.CSV file is renamed to whatever farm you want to call. e.g. CONSTOSO.csv

```
Run the second PowerShell file ImportMasterSiteInventoryList.ps1
NOTE: Modify the TODO lines in the script.

```

End with an example of getting some data out of the system or using it for a little demo

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Pankaj Surti** - *Initial work* - [PankajSurti](https://github.com/pankajsurti)
* **Diana Bearson** - *Initial work* - [DianaBerson](https://github.com/DianaBerson)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

None

## Acknowledgments

* PnP PowerShell team
* SMAT Tool from Microsoft
* 
