import yaml
import os

with open('dbt_project.yml', 'r') as f:
    dbt_project_config = yaml.full_load(f)

with open('dbt_docs_config.yml', 'r') as f:
    data = yaml.full_load(f)

output_s3_path = "s3_output/{}/{}".format(dbt_project_config.get('name'),dbt_project_config.get('version'))
if(len(data.get('config')) > 0):
    os.system("mkdir s3_output")
    s3_project_path = "mkdir s3_output/{}".format(dbt_project_config.get('name'))
    os.system(s3_project_path)
    s3_project_path_per_version = "mkdir {}/{}".format(s3_project_path,dbt_project_config.get('version'))
    os.system(s3_project_path_per_version)

# Print the values as a dictionary
for model_config in data.get('config'):
        print(model_config)
        for key in model_config.keys():
            print("Key:", key, "Value:", model_config[key])
            dbt_docs_generate_string = "dbt docs generate --vars '{}'".format(model_config[key])
            print(dbt_docs_generate_string)
            os.system(dbt_docs_generate_string)
            os.system("mkdir {}/{}".format(output_s3_path, key))
            os.system("cp dbt_project.yml {}/{}".format(output_s3_path, key))
            os.system("cp -R target {}/{}".format(output_s3_path, key))