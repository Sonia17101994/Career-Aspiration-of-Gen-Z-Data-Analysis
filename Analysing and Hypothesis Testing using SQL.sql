----- 1- What percentage of male and female Genz wants to go to office Every Day?
SELECT
Round((SUM(CASE WHEN Gender = 'Male\r'THEN 1 ELSE 0 END)/count(*))*100,2) AS Male_Genz,
Round((SUM(CASE WHEN Gender = 'Female\r' THEN 1 ELSE 0 END)/count(*))*100,2) AS Female_Genz
    from personalized_info p 
    inner join learning_aspirations l on l.ResponseID=p.ResponseID
    where PreferredWorkingEnvironment="Every Day Office Environment";
----- 2- What percentage of Genz who have chosen their career in Business operations are mostly likely to be influenced by their parents ?
SELECT
Round((SUM(CASE WHEN ClosestAspirationalCareer like 'Business Operations%' THEN 1 ELSE 0 END)/count(*))*100,2) AS Genz_in_BO
 from learning_aspirations
 where CareerInfluenceFactor='My Parents';
----- 3- What percentage of Genz prefer opting for higher studies ,give gender wise approach ?
SELECT
Round((SUM(CASE WHEN Gender = 'Male\r'THEN 1 ELSE 0 END)/count(*))*100,2) AS Male_Genz,
Round((SUM(CASE WHEN Gender = 'Female\r' THEN 1 ELSE 0 END)/count(*))*100,2) AS Female_Genz
    from personalized_info p 
    inner join learning_aspirations l on l.ResponseID=p.ResponseID
    where HigherEducationAbroad='Yes, I wil';
----- 4- What percentage of Genz are willing & not willing to work for a company whose mission is misalighned with their public actions or even thier products ?
----- (give gender based split)

----- 5- What is the most suitable working environment according to female gen'z ?
SELECT PreferredWorkingEnvironment,count(*) as count FROM learning_aspirations L 
inner join personalized_info p on l.ResponseID=p.ResponseID
where  Gender= 'Female\r'
group by PreferredWorkingEnvironment
order by  count(*) DESC
limit 1;
----- 6- Calculate the total number of female who aspire to work in their Closet Aspirational Career and have a NO Social impact Likelihood of "1 to 5"?
SELECT count(Gender)as female_count
from personalized_info p  
inner join learning_aspirations l on p.ResponseID=l.ResponseID
inner join mission_aspirations M on M.ResponseID=l.ResponseID
where Gender='Female\r' and NoSocialImpactLikelihood BETWEEN 1 AND 5 ;
----- 7- Retrieve the Male who are interested in Higher Education Abroad and have a Career Influence Factor of "My Parents"?
SELECT count(p.ResponseID) as Males ,Gender,CareerInfluenceFactor,HigherEducationAbroad 
from  personalized_info p  
inner join learning_aspirations l on p.ResponseID=l.ResponseID
group by Gender,CareerInfluenceFactor,HigherEducationAbroad 
having Gender='Male\r'
and CareerInfluenceFactor='My Parents'
and HigherEducationAbroad ='Yes, I wil';
----- 8- Determine the percentage of gender who have a No Social Impact Likelihood of "8 to 10" among those who are interested in Higher Education Abraod?
 SELECT
Round((SUM(CASE WHEN Gender = 'Male\r'THEN 1 ELSE 0 END)/count(*))*100,2) AS Male_Genz,
Round((SUM(CASE WHEN Gender = 'Female\r' THEN 1 ELSE 0 END)/count(*))*100,2) AS Female_Genz
    from personalized_info p 
    inner join learning_aspirations l on l.ResponseID=p.ResponseID
    inner join mission_aspirations M on M.ResponseID=l.ResponseID
where  NoSocialImpactLikelihood BETWEEN 8 AND 10
and HigherEducationAbroad ='Yes, I wil'; 
    
----- 9- Give a detailed split of the Genz preferences to work with teams ,Data should include Male,Feamle and overall in counts and also the overall in %?

----- 10- Give a detailed breakdown of "Worklikelihood3years" for each gender?
select Gender,WorkLikelihood3Years from personalized_info p
inner  join manager_aspirations M on p.ResponseID=M.ResponseID
group by Gender,WorkLikelihood3Years ;
----- 11- Give a detailed breakdown of "Worklikelihood3years" for each states?
select CurrentCountry,WorkLikelihood3Years from personalized_info p
inner  join manager_aspirations M on p.ResponseID=M.ResponseID
group by CurrentCountry,WorkLikelihood3Years ;
----- 12- What is the Average Starting salary expectations at 3 year mark for each gender ?
select Gender,round(avg(ExpectedSalary3Years),2) as Average_Starting_salary_expectations_at_3year 
from personalized_info p
inner  join mission_aspirations M on p.ResponseID=M.ResponseID
group by Gender ;
----- 13- What is the Average Starting salary expectations at 5 year mark for each gender ?
select Gender,round(avg(ExpectedSalary5Years),2) as Average_Starting_salary_expectations_at_5year  from personalized_info p
inner  join mission_aspirations M on p.ResponseID=M.ResponseID
group by Gender ;
----- 14- What is the Average Starting Higher bar salary expectations at 3 year mark for each gender ?
select Gender,max(avg(ExpectedSalary3Years)) as Average_Starting_Higherbar_salary_expectations_at_3year 
from personalized_info p
inner  join mission_aspirations M on p.ResponseID=M.ResponseID
group by Gender ;
----- 15- What is the Average Starting Higher bar salary expectations at 5 year mark for each gender ?

----- 16- What is the Average Starting salary expectations at 3 year mark for each gender and each state in india ?
select Gender,CurrentCountry,round(avg(ExpectedSalary3Years),2) as Average_Starting_salary_expectations_at_3yearfor_gender_and_state 
from personalized_info p
inner  join mission_aspirations M on p.ResponseID=M.ResponseID
group by Gender,CurrentCountry ;
----- 17- What is the Average Starting salary expectations at 5 year mark for each gender and each state in india ?
select Gender,CurrentCountry,round(avg(ExpectedSalary5Years),2) as Average_Starting_salary_expectations_at_3yearfor_gender_and_state 
from personalized_info p
inner  join mission_aspirations M on p.ResponseID=M.ResponseID
group by Gender,CurrentCountry ;
----- 18- What is the Average Starting Higher bar salary expectations at 3 year mark for each gender and each state in india ?

----- 19- What is the Average Starting Higher bar salary expectations at 5 year mark for each gender and each state in india ?

----- 20- Give a detailed breakdown of the possibility of Genz working for an ORG if the "Mission is Misalighned "for each state in india ?

