It appears that birthDate, which are dates only, are converted to local time when compared with Now(). 
So in cqlt.yml make Now() end with T00:00:00.0 (local time zone)
This means that dateTime comparisons in Procedure and Observation have to be expressly your local time zone e.g. 00:00:00.0-10:00 in Hawaii. 
I'm not sure why it behaves this way. Formatting Procedure and Observation dateTime as T00:00:0 (without explicit time zone) results in T00:00:0-10:00 in the result files. 