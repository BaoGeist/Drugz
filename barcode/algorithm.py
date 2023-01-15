import barcodes
import pandas as pd
import random

def build_database(size):
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

def check_medication(image, df):
    string_return = ""
    destination = int(barcodes.read_barcode(image))
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

    df = build_database_real("webScrape\Scraping\output\drug_data.csv")
    # list_codes = df.Code.values.tolist()
    # for code in list_codes:
        # barcodes.create_barcode(str(code), str(code))
    print(check_medication("C:\\Users\\zarak\\Downloads\\temporary baoze hi zara\\Drugz\\barcode\\barcode_storage\\6965131511316.png", df))

main()