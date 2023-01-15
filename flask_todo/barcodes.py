### imports ----------

# import EAN13 from barcode module for EAN13 support
from barcode import EAN13
# import ImageWriter to generate an image file
from barcode.writer import ImageWriter
# computer vision to show the barcode image
import cv2
# pyzbar identify barcode borders in images and decodes them
from pyzbar.pyzbar import decode


### global variables ----------
global barcode_storage_variable
barcode_storage_variable = "Drugz/flask_todo/barcode_storage/"


### functions ----------
# create a barcode from a 13-digit code, and saves it as an image
# function used for creating new barcodes for new drugs
def create_barcode(number_id: str, image_name: str) -> None:
    # creating barcode with EAN13 configuration and saving it to a specific location
    my_code = EAN13(number_id, writer=ImageWriter())
    save_string = barcode_storage_variable + image_name
    my_code.save(save_string)

# detects and decodes barcode
def read_barcode(image: str) -> str:
     
    # read the image in numpy array using cv2
    img = cv2.imread(image)
      
    # decode the barcode image
    detectedBarcodes = decode(img)
      
    # if not detected then print the message
    if not detectedBarcodes:
        print("Barcode not detected")
    else:
       
          # traverse through all the detected barcodes in image, and displays a rectangle over them
        for barcode in detectedBarcodes: 
            # locate the barcode position in image
            (x, y, w, h) = barcode.rect
             
            # places rectangle over iamge
            cv2.rectangle(img, (x-10, y-10),(x + w+10, y + h+10),(255, 0, 0), 2)
            
            # return if barcode data is valid
            if barcode.data!="":
                # NOTE show_image has been commented out but can be called
                # show_barcodes(img)
                return barcode.data.decode("utf-8")
    
# function to show the image
def show_barcodes(img: str) -> None:
    cv2.imshow("Image", img)
    cv2.waitKey(0)
    cv2.destroyAllWindows()

def main():
    create_barcode('7632267416356', '7632267416356')

    # reading testing (image address out of date)
    # image="59012341.png"
    # print(read_barcode(image))

# commented out main call, only needed for individual testing
# main()