
### Module contains all validation function

## Function accepts a file name, and return 0 if exists, 1 not exists
function checkFile {
	FILENAME=${1}
	if [ -f ${FILENAME} ]
	then
		return 0
	else
		return 1
	fi
}

## Function accepts a file name, and return 0 if has r perm, 1 not 
function checkRFile {
        FILENAME=${1}
        if [ -r ${FILENAME} ]
        then
                return 0
        else
                return 1
        fi
}

## Function accepts a file name, and return 0 if has write, 1 not exists
function checkWFile {
        FILENAME=${1}
        if [ -w ${FILENAME} ]
        then
                return 0
        else
                return 1
        fi
}


##Functionm accepts a value, return 0 if valid positive integer, 1 not
function checkInteger {
	VAL=${1}
	if [ $(echo ${VAL} | grep -c "^[0-9]*$") -eq 1 ]
	then
		return 0
	else
		return 1
	fi
}

##Functionm accepts a value, return 0 if valid negative integer, 1 not
function checkNInteger {
        VAL=${1}
        if [ $(echo ${VAL} | grep -c "^\-\{0,1\}[0-9]*$") -eq 1 ]
        then
                return 0
        else
                return 1
        fi
}

## function accepts one parameter to check if is float point or not

## parameters 

## takes only one number as parameter

## returns

# 1: if not float number
# 0: if float number

function checkFloatPoint {
	local num=${1}
	local regx='^[+-]?[0-9]{1,}\.?[0-9]{1,}$'
	if [ ${#} -eq 1 ]
	then
		if [ $num=${regx} ]
		then
			echo "valid num"
			return 0
		else
			echo "not valid"
			return 1
		fi
	else
		echo "insert only one parameter"
		return 1
	fi
}


# Function accepts a value to check if email is valid or not
 
# parameters
## accepts only one string value 

# Returns 
## 1: not valid email
## 0: valid email

function checkEmail {

        VAL=${1}
	echo "${VAL}"
	local regx='^([a-zA-Z0-9_.+-]{1,})@([a-zA-Z0-9-]{1,})\.([a-zA-Z]{2,6})$'
	echo "${regx}"

	if [ ${#} -eq 1 ]
	then
##	 	if [ ! $(echo ${VAL} | grep -c ^[0-9]*$) -eq 1 ]
		if [ ${VAL}=${regx} ]
		then
			echo "valid email"
                	return 0
        	else
			echo "not valid email"
                	return 1
        	fi
	else
		echo "insert only 1 value"
		return 1
	fi
}