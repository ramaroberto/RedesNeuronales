#!/bin/bash
INPUT_FILE="optdigits.arff"
TEST_FILE="adult_75.arff"

DATASET=$INPUT_FILE
FOLDS=10
FILTER=weka.filters.unsupervised.instance.RemoveFolds
SEED=1
 
for ((i = 1; i <= $FOLDS; i++))
do
  echo -n "Generating pair $i/$FOLDS... "

  # train set
  java -Xmx2g $FILTER -V -N $FOLDS -F $i -S $SEED -i $INPUT_FILE -o "folds_arffs/$i-train-$DATASET"
  # test set
  java -Xmx2g $FILTER    -N $FOLDS -F $i -S $SEED -i $INPUT_FILE -o "folds_arffs/$i-test-$DATASET"
  
  echo "Done!"
done

# Hay que sacar los resultados a mano y terminar de computar los folds (sumar la certeza, el error y el desvio y hacer promedios).
# Entrenar y guardar modelo: java weka.classifiers.trees.J48 -C 0.25 -M 2 -t optdigits.arff -d j48.model
# Cargar modelo y ejecutar estadistica con test: java weka.classifiers.trees.J48 -l j48.model -T optdigits.arff
# java weka.filters.supervised.attribute.AddClassification -serialized j48.model -classification -remove-old-class -i optdigits_test.arff -o optdigits_output.arff -c last


