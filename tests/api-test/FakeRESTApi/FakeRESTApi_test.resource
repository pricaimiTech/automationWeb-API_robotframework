*** Settings ***
Library    RequestsLibrary
Library    Collections


*** Variables ***
${baseURL}    https://fakerestapi.azurewebsites.net
${path_Activities}    api/v1/Activities