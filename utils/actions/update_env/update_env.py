import fire
import requests
import json

def lookup_env_var(api_key, account_id, project_id, variable_name, api_base='cloud') -> int:
  """
  Gets the ID of the project's environment variable given a string variable_name
  """
  headers = {
    'Accept': 'application/json',
    'Authorization': f'Token {api_key}'
  }
  url = f'https://{api_base}.getdbt.com/api/v3/accounts/{account_id}/projects/{project_id}/environment-variables/environment/'

  response = requests.get(url, headers=headers)
  try:
    variable_id = response.json()['data']['variables'][variable_name]['project']['id']
  except KeyError:
    print(f'{variable_name} not found in dbt Cloud project id: {project_id}\n\tPrinting found variables...')
    print(response.json()['data']['variables'])
  
  return variable_id


def update_env(
    api_key,
    account_id,
    project_id,
    variable_name,
    variable_value,
    variable_type = 'project',
    api_base = 'cloud'
) -> int:
  """
  Updates a dbt environment variable
  """

  variable_id = lookup_env_var(api_key, account_id, project_id, variable_name, api_base)

  url = f'https://{api_base}.getdbt.com/api/v3/accounts/{account_id}/projects/{project_id}/environment-variables/{variable_id}/'

  headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    'Authorization': f'Token {api_key}',
  }

  payload = {
    "account_id": account_id,
    "project_id": project_id,
    "name": variable_name,
    "type": variable_type,
    "raw_value": variable_value
  }

  # trigger job
  print(f"""
  Configuration:
  api_url: {url}
  account_id: {account_id}
  project_id: {project_id}
  variable_id: {variable_id}
  variable_name: {variable_name}
  """
  )

  response = requests.post(url, json=payload, headers=headers)

  if response.json()['status']['is_success'] == True:
    print(f'Update of {variable_name} completed successfully')
  else:
    raise Exception(f'Update of environment variable {variable_name} failed!')
  
  return response.json()['status']['code']


if __name__ == "__main__":
    fire.Fire(update_env)