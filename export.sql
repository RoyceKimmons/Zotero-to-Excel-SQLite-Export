/* Begin query. */
/* Basic SELECT statement. */
SELECT
/*Identify which fields to SELECT for your output. The left identifier represents the database abbreviated name (set below in the FROM and JOIN statements) and the database field name we want, while the right identifier (after the AS statement) represents the column header as it will appear in your output. */
i.itemID AS ITEMID,
title.value AS TITLE,
t.typeName AS TYPE,
d.value AS DATE,
issn.value AS ISSN,
isbn.value AS ISBN,
doi.value AS DOI,
url.value AS URL,
pub.value AS PUBLICATION_TITLE,
journalAbbreviation.value AS JOURNAL_ABBREVIATION,
issue.value AS ISSUE,
volume.value AS VOLUME,
series.value AS SERIES,
pages.value AS PAGES,
publisher.value AS PUBLISHER,
place.value AS PLACE,
proceedingsTitle.value AS PROCEEDINGS,
bookTitle.value AS BOOK,
university.value AS UNIVERSITY,
archiveName.value AS ARCHIVE_NAME,
archiveLocation.value AS ARCHIVE_LOCATION,
abstract.value AS ABSTRACT,
c1.firstName AS AUTHOR_1_FIRST,
c1.lastName AS AUTHOR_1_LAST,
ct1.creatorType AS AUTHOR_1_TYPE,
c2.firstName AS AUTHOR_2_FIRST,
c2.lastName AS AUTHOR_2_LAST,
ct2.creatorType AS AUTHOR_2_TYPE,
c3.firstName AS AUTHOR_3_FIRST,
c3.lastName AS AUTHOR_3_LAST,
ct3.creatorType AS AUTHOR_3_TYPE,
c4.firstName AS AUTHOR_4_FIRST,
c4.lastName AS AUTHOR_4_LAST,
ct4.creatorType AS AUTHOR_4_TYPE,
c5.firstName AS AUTHOR_5_FIRST,
c5.lastName AS AUTHOR_5_LAST,
ct5.creatorType AS AUTHOR_5_TYPE,
t1.name AS TAG_1,
t2.name AS TAG_2,
t3.name AS TAG_3,
t4.name AS TAG_4,
i.dateAdded AS DATE_ADDED,
i.dateModified AS DATE_MODIFIED,
g.name AS LIBRARY_NAME,
i.libraryID AS LIBRARY_ID,
i.key AS ZOTERO_KEY,
extra.value AS EXTRA
/* The general FROM statement merely queries the `items` table. This table does not have much information in it, so all the information we want will be added with JOIN commands below. */
FROM
items i
/* Begin JOIN commands. First JOIN command.
Join command. Depending upon the information (whether there is one value or many and whether the value is essential to returning a row), we may use either INNER JOIN or LEFT JOIN. */
INNER JOIN
/* The database table name (on the left) and the abbreviated table name (on the right), which we reference in our SELECT query above. */
itemDataValues title
/* Identifies the conditions that direct what data is attached to the `items` table based upon the JOIN command. */
ON
title.valueID = (SELECT itemData.valueID FROM itemData WHERE itemData.fieldID = (SELECT fieldID FROM fields WHERE fields.fieldName = 'title' LIMIT 1) AND itemData.itemID=i.itemID LIMIT 1)
/* Additional JOIN statements. Each of these statements is necessary to attach a new table of information to our initial `items` table. */
LEFT JOIN
itemTypes t
ON
t.itemTypeID = i.itemTypeID
LEFT JOIN
itemDataValues issn
ON
issn.valueID = (SELECT itemData.valueID FROM itemData WHERE itemData.fieldID = (SELECT fieldID FROM fields WHERE fields.fieldName = 'ISSN' LIMIT 1) AND itemData.itemID=i.itemID LIMIT 1)
LEFT JOIN
itemDataValues doi
ON
doi.valueID = (SELECT itemData.valueID FROM itemData WHERE itemData.fieldID = (SELECT fieldID FROM fields WHERE fields.fieldName = 'DOI' LIMIT 1) AND itemData.itemID=i.itemID LIMIT 1)
LEFT JOIN
itemDataValues isbn
ON
isbn.valueID = (SELECT itemData.valueID FROM itemData WHERE itemData.fieldID = (SELECT fieldID FROM fields WHERE fields.fieldName = 'ISBN' LIMIT 1) AND itemData.itemID=i.itemID LIMIT 1)
LEFT JOIN
itemDataValues url
ON
url.valueID = (SELECT itemData.valueID FROM itemData WHERE itemData.fieldID = (SELECT fieldID FROM fields WHERE fields.fieldName = 'url' LIMIT 1) AND itemData.itemID=i.itemID LIMIT 1)
LEFT JOIN
itemDataValues pub
ON
pub.valueID = (SELECT itemData.valueID FROM itemData WHERE itemData.fieldID = (SELECT fieldID FROM fields WHERE fields.fieldName = 'publicationTitle' LIMIT 1) AND itemData.itemID=i.itemID LIMIT 1)
LEFT JOIN
itemDataValues journalAbbreviation
ON
journalAbbreviation.valueID = (SELECT itemData.valueID FROM itemData WHERE itemData.fieldID = (SELECT fieldID FROM fields WHERE fields.fieldName = 'journalAbbreviation' LIMIT 1) AND itemData.itemID=i.itemID LIMIT 1)
LEFT JOIN
itemDataValues publisher
ON
publisher.valueID = (SELECT itemData.valueID FROM itemData WHERE itemData.fieldID = (SELECT fieldID FROM fields WHERE fields.fieldName = 'publisher' LIMIT 1) AND itemData.itemID=i.itemID LIMIT 1)
LEFT JOIN
itemDataValues place
ON
place.valueID = (SELECT itemData.valueID FROM itemData WHERE itemData.fieldID = (SELECT fieldID FROM fields WHERE fields.fieldName = 'place' LIMIT 1) AND itemData.itemID=i.itemID LIMIT 1)
LEFT JOIN
itemDataValues d
ON
d.valueID = (SELECT itemData.valueID FROM itemData WHERE itemData.fieldID = (SELECT fieldID FROM fields WHERE fields.fieldName = 'date' LIMIT 1) AND itemData.itemID=i.itemID LIMIT 1)
LEFT JOIN
itemDataValues abstract
ON
abstract.valueID = (SELECT itemData.valueID FROM itemData WHERE itemData.fieldID = (SELECT fieldID FROM fields WHERE fields.fieldName = 'abstractNote' LIMIT 1) AND itemData.itemID=i.itemID LIMIT 1)
LEFT JOIN
itemDataValues pages
ON
pages.valueID = (SELECT itemData.valueID FROM itemData WHERE itemData.fieldID = (SELECT fieldID FROM fields WHERE fields.fieldName = 'pages' LIMIT 1) AND itemData.itemID=i.itemID LIMIT 1)
LEFT JOIN
itemDataValues issue
ON
issue.valueID = (SELECT itemData.valueID FROM itemData WHERE itemData.fieldID = (SELECT fieldID FROM fields WHERE fields.fieldName = 'issue' LIMIT 1) AND itemData.itemID=i.itemID LIMIT 1)
LEFT JOIN
itemDataValues series
ON
series.valueID = (SELECT itemData.valueID FROM itemData WHERE itemData.fieldID = (SELECT fieldID FROM fields WHERE fields.fieldName = 'series' LIMIT 1) AND itemData.itemID=i.itemID LIMIT 1)
LEFT JOIN
itemDataValues volume
ON
volume.valueID = (SELECT itemData.valueID FROM itemData WHERE itemData.fieldID = (SELECT fieldID FROM fields WHERE fields.fieldName = 'volume' LIMIT 1) AND itemData.itemID=i.itemID LIMIT 1)
LEFT JOIN
itemDataValues proceedingsTitle
ON
proceedingsTitle.valueID = (SELECT itemData.valueID FROM itemData WHERE itemData.fieldID = (SELECT fieldID FROM fields WHERE fields.fieldName = 'proceedingsTitle' LIMIT 1) AND itemData.itemID=i.itemID LIMIT 1)
LEFT JOIN
itemDataValues bookTitle
ON
bookTitle.valueID = (SELECT itemData.valueID FROM itemData WHERE itemData.fieldID = (SELECT fieldID FROM fields WHERE fields.fieldName = 'bookTitle' LIMIT 1) AND itemData.itemID=i.itemID LIMIT 1)
LEFT JOIN
itemDataValues university
ON
university.valueID = (SELECT itemData.valueID FROM itemData WHERE itemData.fieldID = (SELECT fieldID FROM fields WHERE fields.fieldName = 'university' LIMIT 1) AND itemData.itemID=i.itemID LIMIT 1)
LEFT JOIN
itemDataValues archiveName
ON
archiveName.valueID = (SELECT itemData.valueID FROM itemData WHERE itemData.fieldID = (SELECT fieldID FROM fields WHERE fields.fieldName = 'archive' LIMIT 1) AND itemData.itemID=i.itemID LIMIT 1)
LEFT JOIN
itemDataValues archiveLocation
ON
archiveLocation.valueID = (SELECT itemData.valueID FROM itemData WHERE itemData.fieldID = (SELECT fieldID FROM fields WHERE fields.fieldName = 'archiveLocation' LIMIT 1) AND itemData.itemID=i.itemID LIMIT 1)
LEFT JOIN
creators c1
ON
c1.creatorID = (SELECT creatorID FROM creators WHERE creatorID = (SELECT creatorID FROM itemCreators WHERE itemID = i.itemID ORDER BY orderIndex LIMIT 0,1) LIMIT 1)
LEFT JOIN
creatorTypes ct1
ON
ct1.creatorTypeID = (SELECT creatorTypeID FROM itemCreators WHERE itemID = i.itemID ORDER BY orderIndex LIMIT 0,1)
LEFT JOIN
creatos c2
ON
c2.creatorID = (SELECT creatorID FROM creators WHERE creatorID = (SELECT creatorID FROM itemCreators WHERE itemID = i.itemID ORDER BY orderIndex LIMIT 1,1) LIMIT 1)
LEFT JOIN
creatorTypes ct2
ON
ct2.creatorTypeID = (SELECT creatorTypeID FROM itemCreators WHERE itemID = i.itemID ORDER BY orderIndex LIMIT 1,1)
LEFT JOIN
creators c3
ON
c3.creatorID = (SELECT creatorID FROM creators WHERE creatorID = (SELECT creatorID FROM itemCreators WHERE itemID = i.itemID ORDER BY orderIndex LIMIT 2,1) LIMIT 1)
LEFT JOIN
creatorTypes ct3
ON
ct3.creatorTypeID = (SELECT creatorTypeID FROM itemCreators WHERE itemID = i.itemID ORDER BY orderIndex LIMIT 2,1)
LEFT JOIN
creators c4
ON
c4.creatorID = (SELECT creatorID FROM creators WHERE creatorID = (SELECT creatorID FROM itemCreators WHERE itemID = i.itemID ORDER BY orderIndex LIMIT 3,1) LIMIT 1)
LEFT JOIN
creatorTypes ct4
ON
ct4.creatorTypeID = (SELECT creatorTypeID FROM itemCreators WHERE itemID = i.itemID ORDER BY orderIndex LIMIT 3,1)
LEFT JOIN
creators c5
ON
c5.creatorID = (SELECT creatorID FROM creators WHERE creatorID = (SELECT creatorID FROM itemCreators WHERE itemID = i.itemID ORDER BY orderIndex LIMIT 4,1) LIMIT 1)
LEFT JOIN
creatorTypes ct5
ON
ct5.creatorTypeID = (SELECT creatorTypeID FROM itemCreators WHERE itemID = i.itemID ORDER BY orderIndex LIMIT 4,1)
LEFT JOIN
tags t1
ON
t1.tagID = (SELECT tagID FROM itemTags WHERE itemID = i.itemID LIMIT 1)
LEFT JOIN
tags t2
ON
t2.tagID = (SELECT tagID FROM itemTags WHERE itemID = i.itemID LIMIT 1,1)
LEFT JOIN
tags t3
ON
t3.tagID = (SELECT tagID FROM itemTags WHERE itemID = i.itemID LIMIT 2,1)
LEFT JOIN
tags t4
ON
t4.tagID = (SELECT tagID FROM itemTags WHERE itemID = i.itemID LIMIT 3,1)
LEFT JOIN
deletedItems
ON i.itemID = deletedItems.itemID
LEFT JOIN
itemDataValues extra
ON
extra.valueID = (SELECT itemData.valueID FROM itemData WHERE itemData.fieldID = (SELECT fieldID FROM fields WHERE fields.fieldName = 'extra' LIMIT 1) AND itemData.itemID=i.itemID LIMIT 1)
LEFT JOIN
groups g
ON
g.libraryID = i.libraryID
/* End JOIN statements. */
/* Optional JOIN Statements. */
/* This is an optional JOIN statement to select for a specific collection. To only show a specific collection in your output, remove the double-hyphen from the beginning of the statement and replace the collectionName value (e.g. "Instructional Design") with the name of your desired collection (encased by quotes). */
--INNER JOIN collectionItems ON collectionItems.itemID = i.itemID AND collectionItems.collectionID = (SELECT collectionID FROM collections WHERE collectionName = "Instructional Design" LIMIT 0,1)
/* End optional JOIN statements. */
/* Final conditional WHERE statement allows us to ignore entries that have been deleted in Zotero. */
WHERE deletedItems.itemID IS NULL
/* If you would like to add any additional selection criteria, this is the place to do it. Here are some examples that you may wish to use. Merely remove the double-hyphen from the beginning of a condition to make it active in the query. */
/* Begin optional conditions. */
/* Only show a specific library. */
--AND g.name = "UTexas IT Students Public Group"
/* Only show journal articles. */
--AND t.typeName = "journalArticle"
/* Only show items where the first author's last name is Smith. */
--AND c1.lastName = "Smith"
/* Only show items from a particular publication. */
--AND pub.value = "Teachers College Record"
/* Only show items added to Zotero after January 1, 2010. */
--AND i.dateAdded > "2010-01-01"
/* End optional conditions. */
/* End query. */