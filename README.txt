Zotero to Excel SQLite Export
=======================================
Author: Royce Kimmons
=======================================
License: GNU-GPL
=======================================
Overview
Zotero's a great tool for managing your citation library, but sometimes you need that data elsewhere, and though Zotero has some good export features, you may sometimes want something like a simple spreadsheet of citations to work with. Zotero runs on a SQLite database, which makes report generation and, thereby, conversion to a different format difficult for the lay user.  To export Zotero, we will open the SQLite database, submit a query, and then copy the results to Excel, Calc, or another spreadsheet program.Let's get started!
=======================================
Usage Instructions
1. First, you will need to download and install the Firefox SQLite Manager.  Do a quick internet search to find it or go to "Tools > Add-ons" and search there.
2. Restart Firefox when prompted.
3. Now, click on the "Tools" menu and select "SQLite Manager."
4. In the manager, you will need to open your Zotero database, which is located in your Firefox profile folder.  Rather than querying the database directly, find the zotero.sqlite file on your machine (do a web search if you're unsure where your Firefox profile folder is stored on your particular operating system), and make a copy of it to another location (like your desktop).  Though we will not be making any changes to the database, it's better to be safe than to mess up your database.  In SQLite Manger, click the folder icon, find your copied database file, and click "Open."
5. This may take a moment.  If a popup comes up saying that it's taking a while, just say continue (your database may be large).
6. Now that your database is open, click on the "Execute SQL" tab in the right pane.
7. Open the "export.sql" script file and copy and paste the script to the "Enter SQL" box, replacing the default "SELECT * FROM tablename".
8. Click "Run SQL." (Note: We are not making any changes to the database, just running a Select query. If you would like to make any conditional queries on the database, you can use the notes in the query to help you edit it directly, or you can just wait until you get the data to a spreadsheet program. Feel free to hit "Run SQL" as you make edits to see how the output changes.)
9. In the bottom pane, you will see your output.  Left-click on the first entry, scroll all the way down, and then shift+left-click on the last entry to select them all.
10. Right-click on the selected entries and select "Copy Row(s) as CSV" (or use the MS Excel compatible option if appropriate).
11. Finally, open your favorite spreadsheet program, paste your results, and you're done.  (Note: If your spreadsheet does not break up the values properly, you will need to paste the text into Notepad or a similar text editor and save it as a file with the .csv extension.  Then, go back to the spreadsheet and import the .csv file.)