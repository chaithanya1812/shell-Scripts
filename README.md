# shell-Scripts
# 1.ATM-Application
# create a file
#With name  (user_data.txt),
 This  data-file will acts as database
#Add this data to file
```bash 
Name,AC.number,Pin,Amount,e-mail,P.Number
Dasari Chaithanya,3780478***5858,1212,65800,chaithanya1812@gmail.com,6303128***
```
# Source-code link
https://slides.com/chaithanya/bold/fullscreen
# source code
```bash 
#!/bin/bash
########################
function intro() {
clear
echo -e "\e[32m"
echo -e "\e[5m"
printf "\n\n\n\n\n\n\n\n\t\t\t\t --------------------------\n"
printf "\t\t\t\t| Please Insert your card  |\n"
printf "\t\t\t\t --------------------------\n"
sleep 4
clear
printf "\n\n\n\n\n\n\n\n\n\n\t\t\t\tWe are Processing your request\n"
printf "\t\t\t   Please Wait this may take a few seconds.\n"
sleep 4
echo -e "\e[25m"
echo -e "\e[0m"
clear
}
######################
function recepit(){
clear
echo -e "\e[5m"
printf "|--------------------------------------------------------\n"
printf "|      KOTAK\n"
printf "|      kotak Mahindra Bank\n"
printf "|\n|\n"
printf "| KOTAK MAHINDRA BANK\n"
printf "| DATE         TIME           TERM ID\n"
printf "| %s     %s          %s\n|\n" "`date +%D`" "`date +%H:%M`" "APBW9116"
printf "| LOCATION:   MADANAPALLI,MADANAPA\n"
printf "| CARD NO.    %s \n" "$1"
printf "| RECORD NO.           608195\n|\n"
printf "| Balance Amount is %d\n" "$2"

printf "|EASY WAYS TO GET KOTAK A/C MINI STMT:\n"
printf "|SMS TXN <LAST 4 DIGITS OF A/C NO>\n"
printf "|TC 9971056767 OR\n"
printf "|DOWNLOAD OUR APP FROM APP.KOTAK.COM\n|\n"


printf "|\t\t  _____\n"
printf "|\t\t |. .. |\n"
printf "|\t\t |: :: |   Do 100+ things on the\n"
printf "|\t\t |: :: |   Kotak Mobile Banking App\n"
printf "|\t\t |_____|   Download at app.kotak.com\n"
printf "|---------------------------------------------------------\n\n\n"
sleep 4
echo -e "\e[25m"
clear
exit 1
}

function recepit1(){
acountno=`awk -F"," '{if(NR==1) next;print $2}' ./user_data.txt`
balancamount=`awk -F"," '{if(NR==1) next;print $4}' ./user_data.txt`
clear
printf "\n\n\t\tChoose to save paper and the environment\n"
printf "\t\t\tby not printing a receipt.\n"
echo -e "\e[32m"
echo -e "\e[5m"
printf "\n\t\t\t\t -------------\n"
printf " \t\t\t\t|1.Don't Print|\n"
printf " \t\t\t\t ------------- \n"
printf "\t\t\t\t--------\n"
printf " \t\t\t\t|2.Print|\n"
printf " \t\t\t\t-------- \n"
echo -e "\e[25m"
echo -e "\e[0m"

echo -e "\t\t\t\t\tPlease select the option:\c"
read receipt

if [ $receipt -eq 2 ]; then
        recepit $acountno $balancamount
else
clear
exit 1
fi
}


########################
function pin() {
clear
cat << NAME
   _______________
  |   _   _   _   |
  |  |1| |2| |3|  |
  |   -   -   -   |
  |   _   _   _   |
  |  |4| |5| |6|  |
  |   -   -   -   |
  |   _   _   _   |
  |  |7| |8| |9|  |
  |   -   -   -   |
  |   _   _   _   |
  |  |<| |0| |>|  |
  |   -   -   -   |
  |_______________|

NAME
echo -e "\t\t\t\t\tHello,"
echo -e "\t\tPlease enter your Personal Identification Number (PIN)\n\t\t\t\t\t\c"
read PIN
}

function pinchecking() {
if [ $1 != $2 ]; then
     clear
     echo -e "\e[5m"
     echo -e "\e[31m"
     printf "\n\n\n\n\n\n\n\n\n\n\t\t\t\t ----------------------\n"
     printf "\t\t\t\t| Entered PIN is wrong |\n"
     printf "\t\t\t\t ----------------------\n"
     echo -e "\e[0m"
     sleep 3
     echo -e "\e[25m"
     clear
     exit 1
fi
}
#############################
function amountchange() {
clear
cat << NAME
   _______________
  |   _   _   _   |
  |  |1| |2| |3|  |
  |   -   -   -   |
  |   _   _   _   |
  |  |4| |5| |6|  |
  |   -   -   -   |
  |   _   _   _   |
  |  |7| |8| |9|  |
  |   -   -   -   |
  |   _   _   _   |
  |  |<| |0| |>|  |
  |   -   -   -   |
  |_______________|

NAME
echo -e "\t\tPlease use the number pad to enter the amount\n\t\t\tyou wish to withdraw\n"
echo -e "\t\t\t   Rs:- \c"
read withdrawamount
}
#######################################

function amountappend() {
 actl=$1
 witlt=$2
 appenAmount=`expr $actl - $witlt`

 #echo "the append amount is $appenAmount"
 sed -i "s/$actl/$appenAmount/" ./user_data.txt
}


######################################
function waitt() {
clear
echo -e "\e[32m"
echo -e "\e[5m"
printf "\n\n\n\n\n\n\n\n\n\t\t\tWe are Processing your request\n"
printf "\t\t   Please Wait this may take a few seconds.\n"
sleep 5
#echo -e "\e[25m"
clear
#echo -e "\e[5m"
printf "\n\n\n\n\n\n\n\n\n\n\t\t\t\t --------------------------\n"
printf "\t\t\t\t| Please collect your cash |\n"
printf "\t\t\t\t --------------------------\n"
sleep 3
echo -e "\e[25m"
echo -e "\e[0m"
clear
}
#############################################
function fundchecking() {
if [ $2 -ge $1 ];then
     clear
     echo -e "\e[5m"
     echo -e "\e[31m"
     printf "\n\n\n\n\n\n\n\n\n\n\t\t\t\t ----------------------\n"
     printf "\t\t\t\t| Insufficient Funds |\n"
     printf "\t\t\t\t ----------------------\n"
     echo -e "\e[0m"
     sleep 3
     echo -e "\e[25m"
     clear
     exit 1
fi
}
###############################################
function balancenq() {
     clear
     echo -e "\e[5m"
     echo -e "\e[32m"
     printf "\n\n\n\n\n\t\t\t\t -----------------------------\n"
     printf "\t\t\t\t|Your Account Balance if $1 |\n"
     printf "\t\t\t\t -----------------------------\n"
     echo -e "\e[0m"
     sleep 4
     echo -e "\e[25m"
     clear
}
##############################################
function pinchange(){
clear
pincheck=`awk -F"," '{if(NR==1) next;print $3}' ./user_data.txt`
printf "\n\n\n\n\n"
echo -e "\t\t\tPlease enter 4-digit previous pin::\c"
read previouspin

if [ $previouspin = $pincheck ]; then
   clear
   echo -e "Changing password for user"
   while true
   do
   echo -e  "New password::\c"
   read fpin
   echo -e  "Retype new password:\c"
   read spin
    if [ $spin = $fpin ]; then
       sed -i "s/$pincheck/$spin/" ./user_data.txt
       clear
        echo -e "\e[5m"
        echo -e "\e[32m"
          echo -e  "\n\n\n\n\n\t\t\tYour Pin setting is done successfully\c"
            echo -e "\e[0m"
            echo -e "\e[25m"
            sleep 3
            break
           else
           echo -e "Sorry, passwords do not match."
       fi
  done
else
    clear
    echo -e "\e[5m"
    echo -e "\e[31m"
    printf "\n\t\t\t\tYour  pin is Incorrect\n"
    printf "\t\t\t\tPlease enter correct pin\n"
    echo -e "\e[0m"
    echo -e "\e[25m"
    sleep 3
    clear
    exit 1
fi
}
###################################################
function deposit {
clear
cat << NAME
   _______________
  |   _   _   _   |
  |  |1| |2| |3|  |     Please enter your Cash in the Cash
  |   -   -   -   |     deposit slot.
  |   _   _   _   |
  |  |4| |5| |6|  |     ----------     ----------
  |   -   -   -   |    | Rs. 100. |   | Rs. 200. |
  |   _   _   _   |     ----------     ----------
  |  |7| |8| |9|  |
  |   -   -   -   |     ----------     -----------
  |   _   _   _   |    | Rs. 500. |   | Rs. 2000. |
  |  |<| |0| |>|  |     ----------     -----------
  |   -   -   -   |
  |_______________|

NAME

declare -a hund
echo -e  "\t\t\t\e[5mEnter 100 notes   Rs:\e[25m\c"
read hund[0]
echo -e  "\t\t\t\e[5mEnter 200 notes   Rs:\e[25m\c"
read hund[1]
echo -e  "\t\t\t\e[5mEnter 500 notes   Rs:\e[25m\c"
read hund[2]
echo -e  "\t\t\t\e[5mEnter 2000 notes  Rs:\e[25m\c"
read hund[3]

clear
echo -e "\e[32m"
echo -e "\e[5m"
printf "\n\n\n\n\n\n\n\n\n\t\t\tWe are Processing your request\n"
printf "\t\t   Please Wait this may take a few seconds.\n"
sleep 4
echo -e "\e[0m"
echo -e "\e[25m"
clear

echo -e "\n\n\n\n\t DNM  \t CNT \t SUB"
echo -e "\t 100  *\t ${hund[0]}: \t `expr 100 \* ${hund[0]}`"
echo -e "\t 200  *\t ${hund[1]}: \t `expr 200 \* ${hund[1]}`"
echo -e "\t 500  *\t ${hund[2]}: \t `expr 500 \* ${hund[2]}`"
echo -e "\t 2000 *\t ${hund[3]}: \t `expr 2000 \* ${hund[3]}`"
echo -e "\n\t-----------------------"
echo -e "\t Total \t \t `expr $((100*${hund[0]})) + $((200*${hund[1]})) + $((500*${hund[2]})) + $((2000*${hund[3]}))`"
echo -e "\t-----------------------"

echo -e "\n\t\t\e[32mPlease type \e[5m0 \e[25m to continue deposit:\c"
read dpst
echo -e "\e[0m"
if [ $dpst -eq 0 ];
then
totamt=`expr $((100*${hund[0]})) + $((200*${hund[1]})) + $((500*${hund[2]})) + $((2000*${hund[3]}))`
actualamount=`awk -F"," '{if(NR==1) next;print $4}' ./user_data.txt`
depositamt=`expr $totamt + $actualamount`
sed -i "s/$actualamount/$depositamt/" ./user_data.txt
else
clear
exit 1
fi
clear
echo -e "\e[32m"
echo -e "\e[5m"
printf "\n\n\n\n\n\n\n\n\n\t\t\tWe are Processing your request\n"
printf "\t\t   Please Wait this may take a few seconds.\n"
sleep 3
echo -e "\e[0m"
echo -e "\e[25m"
clear

echo -e "\e[5m"
printf "\n\n\n\n\n\t\t\t\t -----------------------------\n"
printf "\t\t\t\t|Your transaction is complete |\n"
printf "\t\t\t\t -----------------------------\n"
sleep 3
echo -e "\e[25m"
clear
}
#################################################
intro
printf "\n\t\tPlease select the type of transaction you with to make\n"

printf "\n\t ------------------                              ------------------------\n"
printf " \t|1. Quick Cash 1000 |                           |2. Cash any other amount |\n"
printf " \t ------------------                              ------------------------- \n"
printf "\t -------------------                             -------------------\n"
printf " \t|3. Quick Cash 2000 |                           |4. Balance Inquiry |\n"
printf " \t -------------------                             ------------------- \n"
printf "\t ------------------                              --------------\n"
printf " \t|5. Quick Cash 3000 |                           |6. PIN Change |\n"
printf " \t ------------------                              --------------\n"
printf "\t  -----------------                              ----------------\n"
printf " \t|7. Quick Cash 5000 |                           |8. Deposit Cash |\n"
printf " \t  -----------------                              ---------------- \n"
printf "\n"


echo -n "Select the option::"
read opt

orginalpin=`awk -F"," '{if(NR==1) next;print $3}' ./user_data.txt`
Actualamount=`awk -F"," '{if(NR==1) next;print $4}' ./user_data.txt`
acountno=`awk -F"," '{if(NR==1) next;print $2}' ./user_data.txt`
case $opt in
        1) pin
           pinchecking $PIN $orginalpin
           fundchecking $Actualamount 1000
           waitt
           amountappend  $Actualamount 1000
           recepit1
           ;;
        3) pin
           pinchecking $PIN $orginalpin
           fundchecking $Actualamount 1000
           waitt
           amountappend  $Actualamount 2000
           recepit1
           ;;
        5) pin
           pinchecking $PIN $orginalpin
           fundchecking $Actualamount 1000
           waitt
           amountappend  $Actualamount 3000
           recepit1
           ;;
        7) pin
           pinchecking $PIN $orginalpiu
           fundchecking $Actualamount 1000
           waitt
           amountappend  $Actualamount 5000
           recepit1
           ;;
         4) pin
           pinchecking $PIN $orginalpin
           balancenq $Actualamount
           recepit1
           ;;
        2) pin
           pinchecking $PIN $orginalpin
           amountchange
           fundchecking $Actualamount $withdrawamount
           waitt
           amountappend  $Actualamount $withdrawamount
           recepit1
           ;;
       6) pinchange
          recepit1
               ;;
       8)   pin
            pinchecking $PIN $orginalpin
            deposit
            recepit1
            ;;

esac
```  

# withdraw money
#Before Withdraw see the amount
```bash 
Name,AC.number,Pin,Amount,e-mail,P.Number
Dasari Chaithanya,3780478***5858,1212,60800,chaithanya1812@gmail.com,6303128***
```
#Attached-viedo

https://github.com/chaithanya1812/shell-Scripts/assets/111736742/f8e2865e-8aa6-46c9-a0d6-519caf58fd9a

#After Withdraw see the amount
```bash 
Name,AC.number,Pin,Amount,e-mail,P.Number
Dasari Chaithanya,3780478***5858,1212,55800,chaithanya1812@gmail.com,6303128***
```
# withdraw money option-2

#Before Withdraw see the amount
```bash 
Name,AC.number,Pin,Amount,e-mail,P.Number
Dasari Chaithanya,3780478***5858,1212,55800,chaithanya1812@gmail.com,6303128***
```
#Attached-viedo

https://github.com/chaithanya1812/shell-Scripts/assets/111736742/362c140f-5f24-4a5b-8235-1b4ea7013ca7

#After Withdraw see the amount
```bash 
Name,AC.number,Pin,Amount,e-mail,P.Number
Dasari Chaithanya,3780478***5858,1212,45800,chaithanya1812@gmail.com,6303128***
```
# ATM PIN-CHANGE
#see the PIN (Befor PIN-Change)

```bash 
Name,AC.number,Pin,Amount,e-mail,P.Number
Dasari Chaithanya,3780478***5858,1212,45800,chaithanya1812@gmail.com,6303128***
```
#Attached-viedo

https://github.com/chaithanya1812/shell-Scripts/assets/111736742/ebfece66-df59-4168-9317-9a62838ca90b

#see the PIN (After PIN-Change)

```bash 
Name,AC.number,Pin,Amount,e-mail,P.Number
Dasari Chaithanya,3780478***5858,1812,45800,chaithanya1812@gmail.com,6303128***
```



# Deposit Money

#see money (Before Deposit)

```bash 
Name,AC.number,Pin,Amount,e-mail,P.Number
Dasari Chaithanya,3780478***5858,1212,45800,chaithanya1812@gmail.com,6303128***
```
#Attached-viedo

https://github.com/chaithanya1812/shell-Scripts/assets/111736742/08642b70-e8ac-4a96-85e2-92ed684e3dfe

#see money (After Deposit)

```bash 
Name,AC.number,Pin,Amount,e-mail,P.Number
Dasari Chaithanya,3780478***5858,1812,63800,chaithanya1812@gmail.com,6303128***
```

# Balance-Enquiry

#Attached-viedo

https://github.com/chaithanya1812/shell-Scripts/assets/111736742/5f2c3a05-7fd2-4c61-8963-4561cd08e540

# Insufficient-Funds
#Attached-viedo

https://github.com/chaithanya1812/shell-Scripts/assets/111736742/2b6d2b64-0618-4a8d-a027-fbe4d183072b




