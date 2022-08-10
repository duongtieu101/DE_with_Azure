# Data warehouse project

## Overview:
Divvy is a bike sharing program in Chicago, Illinois USA that allows riders to purchase a pass at a kiosk or use a mobile application to unlock a bike at stations around the city and use the bike for a specified amount of time. 

The bikes can be returned to the same station or to another station. The City of Chicago makes the anonymized bike trip data publicly available for projects like this where we can analyze the data.

## About dataset:
Since the data from Divvy are anonymous, we have created fake rider and account profiles along with fake payment data to go along with the data from Divvy. The dataset looks like this:

![This is a alt text.](https://video.udacity-data.com/topher/2022/February/6205b1d2_divvy-erd/divvy-erd.png "This is a sample image.")


### About Schema for Song Play Analysis:
![This is a alt text.](https://github.com/duongtieu101/DE_with_Azure/blob/main/3.%20Cloud%20Data%20Warehouses%20with%20Azure/images/star_schema.PNG?raw=true "This is star schema.")


## Project Template:
    - DataToPostgres.py: push data from local folder (data) to Azure Database PostgreSQL (This will simulate the production environment where the data is being used in the OLTP system).
    
    - Scipts for creating external table folder: contains code to create and load data for external table (load stage).
    
    - SQL code for create table for star schema folder: SQL code to create and load data for table of star schema (tranform stage ).
    
    - schema_and_data.pdf: star schema information and data sample after tranform stage.

    - README.md provides informantion about project.

## Quick start:
### To access AWS, we need to do in AWS the following:
Create an Azure PostgreSQL database.

Create an Azure Synapse workspace.

Create a Dedicated SQL Pool and database within the Synapse workspace.

Install python3 environment and psycopg2 in local machine. Fill host, user and password of Azure PostgreSQL database to DataToPostgres.py file, after that please run this file.

Go to Azure Synapse workspace, create linked service for Azure PostgreSQL database and Azure Blob Storage. After that, ingest data from PostgreSQL database to Blob Storage (extract stage).

Run code from Scipts for creating external table folder to create and load data for external table (load stage).

Run code from SQL code for create table for star schema folder to create and load data for table of star schema (tranform stage ).


