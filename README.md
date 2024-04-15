# README

The command or task to persist the external information :
rake earthquakes:persist_information 


The API for get earthquakes features is: 
http://127.0.0.1:3000/api/features/earthquakes
params: {
  page: number
  per_page: number
  mag_types: array<string>
  search?: string
}

The API for get comment by feature:
http://127.0.0.1:3000/api/features/{feature_id}/comments
No parameters

The API for save new comment:
http://127.0.0.1:3000/api/features/comments/save
the parameters:
{
    "feature_id": 1,
	  "description": "test"
}


Thanks for reading :D
