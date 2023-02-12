for i in $(ls /besu/jars/*.jar)
do
    FILE="$(echo $i | rev | cut -d'/' -f1 | rev)"
    NAME="$(echo $FILE | rev | cut -d'-' -f2- | rev)"

    rm -rf /opt/besu/lib/$NAME-*.jar
    mv $i /opt/besu/lib/

    sed -i "s/$NAME-.*.jar/$FILE/g" /opt/besu/bin/besu
done
