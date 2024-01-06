----- 1- How many Male have responded to the survey of india?
select count(Gender) as Male_Responded from personalized_info
where Gender='Male\r';
----- 2- How many Female have responded to the survey of india?
select count(Gender) as Female_Responded from personalized_info
where Gender='Female\r';
----- 3- How many of the Gen-Z are influenced by their parents in regards to their career choices of india?
select count(CareerInfluenceFactor) as Gen_Z_influenced from learning_aspirations
where CareerInfluenceFactor="My Parents";
----- 4- How many of the Female Gen-Z are influenced by their parents in regards to their career choices of india ?
select count(CareerInfluenceFactor) as Female_Gen_Z_influenced from learning_aspirations l
inner join personalized_info p on l.ResponseID=p.ResponseID
where CareerInfluenceFactor="My Parents" and Gender='Female\r';
----- 5- How many of the Male Gen-Z are influenced by their parents in regards to their career choices of india ?
select count(CareerInfluenceFactor) as Female_Gen_Z_influenced from learning_aspirations l
inner join personalized_info p on l.ResponseID=p.ResponseID
where CareerInfluenceFactor="My Parents" and Gender='Male\r';
----- 6- How many of the Male and Female (individually display in 2 different columns ,but as part of the same query)Gen-Z influenced by their parents in regards to their career choices of india ?
SELECT
    SUM(CASE WHEN gender = 'Male\r'THEN 1 ELSE 0 END) AS Male_Count,
    SUM(CASE WHEN gender = 'Female\r' THEN 1 ELSE 0 END) AS Female_Count
    from personalized_info p 
    inner join learning_aspirations l on l.ResponseID=p.ResponseID
    where CareerInfluenceFactor="My Parents";
----- 7- How many Gen-Z are influenced by Media and Influencers together from  india ?
select count(CareerInfluenceFactor) as Gen_Z_influenced_by_Media_and_Influencers from learning_aspirations 
where CareerInfluenceFactor IN("Social Media like LinkedIn" ,"Influencers who had successful careers");
----- 8- How many Gen-Z are influenced by Social Media and Influencers together ,display for Male and Female separately from india ?
SELECT
    SUM(CASE WHEN gender = 'Male\r'THEN 1 ELSE 0 END) AS Male_Count,
    SUM(CASE WHEN gender = 'Female\r' THEN 1 ELSE 0 END) AS Female_Count
    from personalized_info p 
    inner join learning_aspirations l on l.ResponseID=p.ResponseID
    where CareerInfluenceFactor IN("Social Media like LinkedIn" ,"Influencers who had successful careers");
----- 9- How many Gen-Z are influenced by Social Media for their career aspirations are looking to go abroad?
select count(CareerInfluenceFactor) as Gen_Z_influenced_by_Media_go_to_abroad from learning_aspirations
where  HigherEducationAbroad="Yes, I wil" ;
----- 10 -How many Gen-Z are influenced by "People in their circle" for career aspiration looking to go abroad?
select count(CareerInfluenceFactor) as Gen_Z_influenced_by_People_in_my_circle from learning_aspirations
where CareerInfluenceFactor="People from my circle, but not family members" and HigherEducationAbroad="Yes, I wil" ;
    
    
