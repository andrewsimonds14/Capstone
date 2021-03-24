import numpy as np
import pandas as pd

comparison = pd.read_csv('./comparisonPredictionData.csv')
final = pd.read_csv('./testPredictionData.csv')

columnsComparison = set(list(comparison.columns.values))
columnsFinal = set(list(final.columns.values))

print(columnsComparison.difference(columnsFinal))
print(columnsFinal.difference(columnsComparison))

