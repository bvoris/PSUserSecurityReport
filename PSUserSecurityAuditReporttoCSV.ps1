#########################################################
#User Security Audit Report
#########################################################

############################################
#Created by Brad Voris
############################################

############################################
#Import Active Directory Module
############################################

import-module activedirectory
############################################
#Get and export users to CSV
############################################
Get-ADUser -filter * -Properties * | Select SamAccountName,SurName,GivenName,Description,PasswordExpired,PasswordLastSet,AccountLockoutTime,AccountExpirationDate,LastLogonDate,@{name=”MemberOf”;expression={$_.memberof -join “;”}} | export-csv “c:\UserSecurityAuditReport{0:yyyyMMdd}.csv" -f (get-date))
