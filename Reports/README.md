#Reports

Cascade Server provides reports out of the box to help with your content management and freshness.

The Broken Link Report dashboard tab contains a report of all broken links in a particular Site. On this tab, users can see each broken link and the assets in which the broken link is contained. Broken links can be marked as fixed and then filtered out so that only links that still need to be addressed are displayed.

The Stale Content Report dashboard includes a graphical summary of content needing review and a table view of each stale item. The Stale Content tab contains several actions to help manage stale content, including sending notifications and scheduling future review dates.

Cascade Server also connects with Google Analytics via a Connector to import analytics data into your instance for graphical and tabular views that can be filtered based on differen time intervals.

Other content and asset reports can be created using data that Cascade Server generates. These reports are created using either XSLT or Velocity by indexing assets within the application and displaying those that meet the criteria. Additional reports can be created and these reports are open to repurposing as needed.

##Documentation

Reports are built using Index Blocks and Formats. Formats are available in both XSLT and Velocity versions.

Current list of reports:
* Pages with unpublished changes
* Folders with no ‘index’ page
* Pages with no Review Date 
* Pages without a Title or Display Name
* Pages that are not available for publish
* Recently created Pages
* Recently edited Pages
* Recently published Pages
* Access/Permissions Tree

###Reports Site

The Site aggregates data from the individual Sites that have reports created. It’s a summary of all reports combined in one table. Each report type has a corresponding summary page here in this Site.

The table is powered with a Content Type Index Block. Each individual report has a separate Content Type so it’s very easy to aggregate the data from across the system. The table provides Site names as well as asset totals for easy viewing. Sites with no results will not be listed. (This can be changed in the Formats.)

###Individual Reports

Each report has it’s own Content Type that lives in the Reports Site. This is so that the reports can be created across the entire application and managed from one location. Changes to the way reports function are managed in one place.

Reports are powered through Block Choosers in the Data Definition. The Block can be swapped out easily in each individual Site to give you the option to change what dataset is reported on.

Some reports, like those with the word “recently” in the name, offer filtering options. Filter are based on specific date comparisons or date ranges. (The ranges can be changed in the Data Definition to fit your needs.)

You can place individual reports within each Site wherever you want. This is because they are aggregated by Content Type and the data being used to generate each report is assigned manually via a Block Chooser. We suggest created a non-publishing, non-indexable folder called “reports” in each individual Site for clean and simple organizing.

###Loading a Report

To load a Report into an individual Site, create a New Page that uses one of the Report Content Types from the Report Site. Since Content Types can be shared across all Sites, we manage how the similar reports function from a single location.

You will also need to create an Index Block, which is assigned manually on each report via the Data Definition, that contains the dataset you want reported against. In most cases you probably want to index the entire Site from the Base Folder and exclude Page XML. Depending on what Metadata fields are needed for the purpose of the Report, the “Indexed Asset Content” and “Other Indexed Info” options will be adjusted accordingly.

###Creating a new Report

To create a new Report, you will need to create 2 Content Types, 1 Content Type Index Block, and 2 Formats (either XSLT or Velocity -- you can choose as either will work).

The first Content Type is for the Report itself. The second is for the Report aggregation Page. The Content Type Index Block aggregates the Reports from across the system. The first Format powers the aggregation table. The second Format displays the results on the individual Report. The existing Content Types, Index Blocks, and Formats can easily be used as an example for how to proceed.

If you’re having trouble gathering data or displaying it, feel free to email support@hannonhill.com with example code and where you’re stuck. We’re more than happy to help work it through with you.
