# PySpark

## Background
Many of Amazon's shoppers depend on product reviews to make a purchase. Amazon makes these datasets publicly available. However, they are quite large and can exceed the capacity of local machines to handle. One dataset alone contains more than 1.5 million rows. With more than 40 datasets, this can be quite taxing on the average local computer.

### Objectives
* Perform ETL on one of the review datasets.
* Store your results on an AWS RDS database.
* Determine if reviews are biased using PySpark or SQL with the appropriate statistical methods.

## Resources
* Google Colab [https://colab.research.google.com/drive/11L-bw7P_RZn5_XFyRqYRrESVMu-1Uv-e?usp=sharing](https://colab.research.google.com/drive/11L-bw7P_RZn5_XFyRqYRrESVMu-1Uv-e?usp=sharing)
* Spark
* pgAdmin4: [queries](queries.sql)
* AWS RDS database
* data:  Amazon Reviews of Watches in USA
  * [https://s3.amazonaws.com/amazon-reviews-pds/tsv/amazon_reviews_us_Watches_v1_00.tsv.gz](https://s3.amazonaws.com/amazon-reviews-pds/tsv/amazon_reviews_us_Watches_v1_00.tsv.gz)


## Analysis Results

I chose the Watches dataset to investigate.  [https://s3.amazonaws.com/amazon-reviews-pds/tsv/amazon_reviews_us_Watches_v1_00.tsv.gz](https://s3.amazonaws.com/amazon-reviews-pds/tsv/amazon_reviews_us_Watches_v1_00.tsv.gz)

Once I ran through the ETL process with Spark on Google Colab, (notebook: [https://colab.research.google.com/drive/11L-bw7P_RZn5_XFyRqYRrESVMu-1Uv-e?usp=sharing](https://colab.research.google.com/drive/11L-bw7P_RZn5_XFyRqYRrESVMu-1Uv-e?usp=sharing)), 
I used pgAdmin to run SQL queries to investigate the dataset by splitting out the paid vine program reviews from the unpaid reviews.  All of my SQL queries can be found in the file: [queries.sql](queries.sql)

                    vine        non-vine
Total Reviews:      1,747       958,932
5-star Reviews:     605         570,888
Average Rating:     4.0         4.1
Average Helpful
Votes per Review:   2.86        1.19

From this data, it appears that there is not much of a difference in the Average Rating between the paid vine reviews and the unpaid reviews.  The vine reviewers give a 5-star rating 34.6% of the time compared to non-vine reviewers 59.5%.  

To dive further into the dataset I chose to look at only reviews with at least 5 Helpful votes.  Below are the results of those queries to the database.

                    vine        non-vine
Total Reviews:      188         41,045
5-star Reviews:     71          21,815
Average Rating:     4.0         3.9
Average Helpful
Votes per Review:   17.56       15.92

The Average Rating has not changed very dramatically when we pare down the data by looking at reviews that folks found to be more helpful.  Also, the percentage of 5-star ratings (vine 37.8%, non-vine 53.1%) is within ~5% of the full dataset.  Looking at the average helpful votes per review, it seems that in general people found both vine and non-vine reviews to be similarly helpful.  Examining all of this data together, it is safe to say that the vine reviews for watches are not biased.   
