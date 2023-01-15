### imports ----------
import barcodes
import pandas as pd
import random

# BIG NOTE THIS FILE ALWAYS NEEDS TO BE RUN FROM INSIDE FLASK_TODO

### functions ----------

# function for building fake databases, only needed for testing and before the real database was created
def build_database(size: int) -> pd.DataFrame:
    list_barcode_id = []
    list_drug_name = ["isotretinon", "Hydrocodone-Acetaminophen", "Hydrochlorothiazide", "Atorvastatin Calcium", "Ventolin"]
    list_negative_interations = ['bad1, bad1, bad1', 'bad2 bad2 bad2', 'bad2 bad2 bad2', 'bad2 bad2 bad2', 'bad2 bad2 bad2']
    for i in range (size-1):
        list_barcode_id.append(str(random.randint(10000000, 99999999)))
    list_barcode_id.append(str(59012344))

    data = {'barcode_id':  list_barcode_id,
        'drug_name': list_drug_name,
         'negative_interactions': list_negative_interations
        }

    df = pd.DataFrame(data)
    return df

# check medication from inside this same file
def check_medication(image, df):
    string_return = ""
    destination = int(barcodes.read_barcode(image))
    # drug name addition
    string_return += "Drug Name:\n" + df.loc[df['Code'] == destination]['Name'].values[0]
    # conflicts list addition
    string_return += "\nConflicts: \n" + df.loc[df['Code'] == destination]['Conflicts'].values[0].replace(";", "; ")
    return string_return

def check_medication_from_outside(image_path):
    string_return = ""
    destination = int(barcodes.read_barcode(image_path))
    df = build_database_real("drug_data.csv")
    # return for the name of the drug, comment out the other to use
    string_return += "Drug Name:\n" + df.loc[df['Code'] == destination]['Name'].values[0]
    # return([df.loc[df['Code'] == destination]['Name'].values], [(df.loc[df['Code'] == destination]['Conflicts'].values)])
    # return for the interaction list of the drug, comment out the other to use
    string_return += "\nConflicts: \n" + df.loc[df['Code'] == destination]['Conflicts'].values[0].replace(";", "; ")
    return string_return

def build_database_real(csv_file_path):
    df = pd.read_csv(csv_file_path)
    return df

def main():
    # df = build_database(5)

    df = build_database_real("drug_data.csv")
    # list_codes = df.Code.values.tolist()
    # for code in list_codes:
        # barcodes.create_barcode(str(code), str(code))
    print(check_medication("barcode_storage/6965131511316.png", df))

# function call for a return string with med name and conflict name
# print(check_medication_from_outside("barcode_storage/6965131511316.png"))

# general main call
main()