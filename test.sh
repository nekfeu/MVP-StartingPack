#!/bin/bash

echo toto > test.test
my_array=("Adding architecture and getParks method in service." "Adding spaces retrieving and display them on map." "Adding getSpacesDetails methods." "Adding spaceDetails controller with space details data displaying." "Adding clusters number." "Adding country detection from city, adding button to zoom out and textfield to research coworking in cities/countries." "Adding login and register page with Firebase." "Adding google authentification." "Adding twitter authentification and rework loginPage design." "Adding logo to login page." "Reworking spaceDetails page and adding reviews and rating (using fake data for the moment)." "Replacing fake data by Firebase data, adding reviews working good." "Adding new sign up page and adding some presenters." "Adding comments." "Solve bug when user can't get space details from a country search." "Adding space in database by slug and no more by name." "Disabling user interaction when app loading." "Adding FirebaseAuthManager, FirebaseStorageManager and adding some units tests." "Adding some units tests for Model, API Calls and Firebase." "Adding presenters units tests." "Resolving some bugs" "Resolving bug where google sign in button doesn't work." "Disabling come back to login page possibility when swiping right in mapView." "Renaming LoginControllerDelegate to SignupControllerDelegate and separating BorderedViews in two class." "Adding dynamic cornerRadius when needed." "Adding NVActivityIndicatorView to get custom loadings and auto UIBlocker.")
for i in "${my_array[@]}";
do
        echo $i > test.test
	sleep 1
	git commit -am "$i"
	sleep 1
	git push origin master
	sleep 1
done
