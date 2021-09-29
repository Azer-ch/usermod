echo "Please choose an option :
1-View Users' list
2-Changer a user's information"
read choice
case $choice in 
	1) cat /etc/passwd | awk -F: '{printf("%d %s\n",$3,$1);}'
		;;
	2) echo "Type the user's name"
	       read name	
	       a=$(echo $(grep $name /etc/passwd | cut -f 1 -d:) )
	       if  [ "$a" != "$name" ]
	       then
		       echo "User does not exist."
		       exit 1 
	       fi
	echo "please specify the information to change
		1- Username
		2- Passowrd
		3- User ID 
		4- Group ID
		5- Home Directory
		6- Shell"
		
	read x
        case $x in 
		1) read -p "Type the new username : " var
		  sudo usermod -l $var $name
	           echo "User's info after the changes :"
	           grep $name /etc/passwd
		   ;;
	       2) sudo passwd $name 
		       ;;
	       3) read -p "Type the new user id : " var
	          sudo usermod -u $var $name 
	           echo "User's info after the changes :"
	           grep $name /etc/passwd
		  ;;
	       4) read -p "Type the new group id : " var
	          sudo usermod -u $var $name 
	           echo "User's info after the changes :"
	           grep $name /etc/passwd
		  ;;
	       5) read -p "Type The new home directory : " var
		  sudo usermod -d $var $name
	           echo "User's info after the changes :"
	           grep $name /etc/passwd
		  ;;
	       6) read -p "Type the new shell : " var
		  sudo usermod -s $var $name
	           echo "User's info after the changes :"
	           grep $name /etc/passwd
		  ;;
      esac 
      ;;
		  
esac
