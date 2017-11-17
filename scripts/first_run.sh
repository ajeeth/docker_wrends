unzip /opt/wrends.zip -d /opt/
mv /opt/opendj/* /opt/wrends/
rm /opt/wrends.zip
rm -rf /opt/opendj

### Begin workaround for WrenDS issue #12
cd /opt/wrends/lib
rename Wren:DS WrenDS Wren*.jar
rm bootstrap*.jar
mv /scripts/Manifest* .
jar cfm bootstrap.jar Manifest_bootstrap.txt
jar cfm bootstrap-client.jar Manifest_bootstrap-client.txt
### End workaround for WrenDS issue #12

cd /opt/wrends
chmod +x setup
./setup --cli -v \
            --ldapPort 1389 \
            --ldapsPort 1636 \
            --adminConnectorPort 4444 \
            --rootUserDN "$LDAP_ROOT_DN" \
            --rootUserPassword $LDAP_ROOT_PASS \
            --generateSelfSignedCertificate \
            --baseDN "$LDAP_BASE_DN" \
            --addBaseEntry \
            --no-prompt --noPropertiesFile \
            --doNotStart \
            --acceptLicense

rm /first_run
