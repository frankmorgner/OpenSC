# Select the right java
SETX /M PATH "%PATH%;C:\Program Files\Java\jdk1.8.0"
SETX /M JAVA_HOME "C:\Program Files\Java\jdk1.8.0"

# VSmartcard
./.github/setup-vsmartcard.ps1

# Javacard SDKs
git clone https://github.com/martinpaljak/oracle_javacard_sdks.git
SETX /M JC_HOME=$pwd.Path/oracle_javacard_sdks/jc222_kit
SETX /M JC_CLASSIC_HOME=$pwd.Path/oracle_javacard_sdks/jc305u3_kit

# jCardSim
# https://github.com/licel/jcardsim/pull/174
git clone https://github.com/Jakuje/jcardsim.git
CD jcardsim
mvn initialize
mvn clean install
CD ..
