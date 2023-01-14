import barcodes
import pandas as pd
import random

def build_database(size):
    list_barcode_id = []
    list_drug_name = ["isotretinon", "Hydrocodone-Acetaminophen", "Hydrochlorothiazide", "Atorvastatin Calcium", "Ventolin"]
    list_negative_interations = ['bad1, bad1, bad1', 'bad2 bad2 bad2', 'bad2 bad2 bad2', 'bad2 bad2 bad2', 'bad2 bad2 bad2']
    for i in range (size):
        list_barcode_id.append(random.randint(10000000, 99999999))


    data = {'barcode_id':  list_barcode_id,
        'drug_name': list_drug_name,
         'negative_interactions': list_negative_interations
        }

    df = pd.DataFrame(data)

    print(df)

def check_medication(image):
    barcodes.read_barcode(image)


def main():
    build_database(5)

    check_medication("download.png")

main()