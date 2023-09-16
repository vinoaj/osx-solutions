import PyPDF2
import sys
import os

def unlock_pdf(input_file, password):
    try:
        # Create a PDF file reader
        pdf_reader = PyPDF2.PdfReader(input_file)
        
        # Authenticate the password
        if pdf_reader.is_encrypted:
            if not pdf_reader.decrypt(password):
                print("Failed to decrypt the PDF. Please check your password and try again.")
                return
        
        # Create a PDF file writer
        pdf_writer = PyPDF2.PdfWriter()
        
        # Add pages to the writer
        for page_num in range(len(pdf_reader.pages)):
            page = pdf_reader.pages[page_num]
            pdf_writer.add_page(page)
        
        # Generate output file name
        base_name = os.path.basename(input_file)
        name, ext = os.path.splitext(base_name)
        output_file = f"{name}-unlocked{ext}"
        
        # Create an output PDF file
        with open(output_file, 'wb') as out_pdf:
            pdf_writer.write(out_pdf)
        
        print(f"Successfully created unlocked PDF as {output_file}")
    
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python unlock_pdf.py <PDF File> <Password>")
    else:
        input_file = sys.argv[1]
        password = sys.argv[2]
        unlock_pdf(input_file, password)

