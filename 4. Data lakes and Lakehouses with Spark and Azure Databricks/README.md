# Data lake project

## Overview:
Divvy is a bike sharing program in Chicago, Illinois USA that allows riders to purchase a pass at a kiosk or use a mobile application to unlock a bike at stations around the city and use the bike for a specified amount of time. 

The bikes can be returned to the same station or to another station. The City of Chicago makes the anonymized bike trip data publicly available for projects like this where we can analyze the data.

## About dataset:
You can get data from this link: https://video.udacity-data.com/topher/2022/March/62420bb1_azure-data-lakehouse-projectdatafiles/azure-data-lakehouse-projectdatafiles.zip

Since the data from Divvy are anonymous, we have created fake rider and account profiles along with fake payment data to go along with the data from Divvy. The dataset looks like this:

![This is a alt text.](https://video.udacity-data.com/topher/2022/March/6239366d_dend-project-erd/dend-project-erd.jpeg "This is a sample image.")


### About Schema for Song Play Analysis:
![This is a alt text.](https://github.com/duongtieu101/DE_with_Azure/blob/main/4.%20Data%20lakes%20and%20Lakehouses%20with%20Spark%20and%20Azure%20Databricks/images/star_schema.PNG "This is star schema.")


## Project Template:
    - extract_step.ipynb: code of extract step

    - load_step.ipynb: code of load step

    - tranform_step.ipynb: code of tranform step
    
    - schema_and_data.pdf: star schema information and data sample after tranform stage.

    - images folder: contains some images (star schema, ingest , extract stage)

    - README.md provides informantion about project.

## Quick start:
### To access AWS, we need to do in AWS the following:
Create an Azure Databricks and create a cluster in Databricks.

Upload data to DBFS (Databrick File System)

Run the code of extract_step.ipynb file to extract and write data to Delta file system.

Run the code of load_step.ipynb file to create tables with the data from Delta file system.

Run the code of tranform_step.ipynb file to create tables of star schema and save tables in delta.




