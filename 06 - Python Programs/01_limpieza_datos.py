import pandas as pd

# ─────────────────────────────────────────────
# PASO 1: Cargar el dataset original
# ─────────────────────────────────────────────
df = pd.read_csv('01_raw_data/supplement_impact_data.csv')

print(f"Dataset cargado: {df.shape[0]} filas × {df.shape[1]} columnas")

# ─────────────────────────────────────────────
# PASO 2: Limpiar 'Strength_Gain'
# Eliminar el símbolo '%' y convertir a decimal (8% → 0.08)
# ─────────────────────────────────────────────
df['Strength_Gain'] = (
    df['Strength_Gain']
    .str.replace('%', '', regex=False)
    .astype(float) / 100
)

# ─────────────────────────────────────────────
# PASO 3: Estandarizar columnas categóricas
# Strip de espacios fantasmas (TRIM)
# ─────────────────────────────────────────────
columnas_categoricas = ['Gender', 'Supplement', 'Primary_Benefit']

for col in columnas_categoricas:
    df[col] = df[col].str.strip()

# ─────────────────────────────────────────────
# PASO 4: Guardar el dataset limpio
# ─────────────────────────────────────────────
df.to_csv('02_clean_data/dataset_limpio.csv', index=False)

print("✔ Dataset limpio guardado en: 02_clean_data/dataset_limpio.csv")
print(f"  - Filas: {df.shape[0]}")
print(f"  - Columnas: {df.shape[1]}")
print(f"  - Nulos totales: {df.isnull().sum().sum()}")
print(f"\nDTYPES finales:\n{df.dtypes}")
