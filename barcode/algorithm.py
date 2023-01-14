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
    return df;

def check_medication(image, df):
    destination = barcodes.read_barcode(image)
    # return for the name of the drug, comment out the other to use
    return(df.loc[df['barcode_id'] == destination]['drug_name'].values)
    # return for the interaction list of the drug, comment out the other to use
    return(df.loc[df['barcode_id'] == destination]['negative_interactions'].values)

def main():
    df = build_database(5)

    print(check_medication("59012341.png", df))

main()