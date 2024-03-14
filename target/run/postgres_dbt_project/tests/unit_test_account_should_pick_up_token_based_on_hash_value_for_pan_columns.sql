select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      -- depends_on: "DBT_CTE__hash_token_lkp"




  
  


  
    
      
  
  
  
  
  
  

      
      
      
      
      

      
      
      select * from (select 1) as t where False    
      
  
  
  

    
  

      
    ) dbt_internal_test