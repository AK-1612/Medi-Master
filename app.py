from flask import Flask, render_template, request, redirect, url_for, session, send_file, flash
import mysql.connector
from io import BytesIO
from reportlab.pdfgen import canvas
from reportlab.lib.utils import ImageReader
from reportlab.lib import colors
from datetime import datetime
import os

app = Flask(__name__)
app.secret_key = 'your_secret_key_here'

# ------------------ DATABASE CONFIG ------------------
DB_CONFIG = {
    'host': '127.0.0.1',
    'user': 'root',
    'password': 'AnshulKumaria',
    'database': 'medi_master',
    'port': 3306
}

conn = mysql.connector.connect(**DB_CONFIG)
cursor = conn.cursor()

# ------------------ HOME ------------------

@app.route('/')
def home():
    cursor.execute("""
        SELECT Symptom, Category 
        FROM SYMPTOM 
        ORDER BY Category, Symptom
    """)
    results = cursor.fetchall()

    categorized_symptoms = {}
    for symptom, category in results:
        if category not in categorized_symptoms:
            categorized_symptoms[category] = []
        categorized_symptoms[category].append(symptom)

    return render_template('index.html', categorized_symptoms=categorized_symptoms)

# ------------------ STATIC PAGES ------------------

@app.route('/about')
def about():
    return render_template('about.html')

@app.route('/prescription')
def prescription():
    return render_template('prescriptions.html')

# ------------------ DATABASE VIEW ------------------

@app.route('/database')
def database():
    cursor.execute("""
        SELECT MNAME, TYPE, PRE_REQ, NEED, ALTERNATIVE_MNAME
        FROM MEDICINE
        ORDER BY MNAME
    """)
    medicines = cursor.fetchall()

    page_name = 'database.html'

    try:
        cursor.execute("SELECT page_access_function(%s)", (page_name,))
        function_result = cursor.fetchone()[0]

        cursor.execute("CALL page_access_procedure(%s, @msg)", (page_name,))
        cursor.execute("SELECT @msg")
        procedure_result = cursor.fetchone()[0]

    except Exception as e:
        function_result = f"Function Error: {e}"
        procedure_result = f"Procedure Error: {e}"

    return render_template(
        'database.html',
        medicines=medicines,
        function_result=function_result,
        procedure_result=procedure_result
    )

# ------------------ SYMPTOM → MEDICINE ------------------

@app.route('/results', methods=['POST'])
def results():
    selected_symptoms = request.form.getlist('symptoms')
    session['symptoms'] = selected_symptoms

    if not selected_symptoms:
        session['medicines'] = []
        return render_template('results.html', medicines=[])

    placeholders = ','.join(['%s'] * len(selected_symptoms))

    cursor.execute(f"""
        SELECT DISTINCT MNAME 
        FROM SYMPTOM_MEDICINE_MAP
        WHERE Symptom IN ({placeholders})
    """, tuple(selected_symptoms))

    medicines = [row[0] for row in cursor.fetchall()]
    session['medicines'] = medicines

    return render_template('results.html', medicines=medicines)

# ------------------ PATIENT FORM ------------------

@app.route('/patient')
def patient_form():
    if not session.get('medicines'):
        flash("Select symptoms first.")
        return redirect(url_for('home'))

    cursor.execute("SELECT Symptom FROM SYMPTOM ORDER BY Symptom")
    symptoms = [row[0] for row in cursor.fetchall()]

    return render_template('splash.html', symptoms=symptoms)

@app.route('/form', methods=['POST'])
def save_patient():
    name = request.form.get('name')
    gender = request.form.get('gender')
    blood_group = request.form.get('blood_group')
    age = request.form.get('age')
    allergies = request.form.get('allergies')
    
    # Process symptoms chosen on the form itself
    selected_symptoms = request.form.getlist('symptoms')
    session['symptoms'] = selected_symptoms
    
    if selected_symptoms:
        placeholders = ','.join(['%s'] * len(selected_symptoms))
        cursor.execute(f"""
            SELECT DISTINCT MNAME 
            FROM SYMPTOM_MEDICINE_MAP
            WHERE Symptom IN ({placeholders})
        """, tuple(selected_symptoms))
        medicines = [row[0] for row in cursor.fetchall()]
        session['medicines'] = medicines
    else:
        session['medicines'] = []

    if not name or not age:
        flash("Name and Age are required.")
        return redirect(url_for('patient_form'))

    cursor.execute("""
        INSERT INTO PATIENT (NAME, GENDER, BLOOD_GROUP, AGE, ALLERGIES)
        VALUES (%s, %s, %s, %s, %s)
    """, (name, gender, blood_group, age, allergies))

    conn.commit()
    return redirect(url_for('download_pdf', name=name))

# ------------------ PDF GENERATION ------------------

@app.route('/download_pdf')
def download_pdf():
    name = request.args.get('name')

    cursor.execute("""
        SELECT * FROM PATIENT
        WHERE NAME = %s
        ORDER BY PID DESC LIMIT 1
    """, (name,))
    patient = cursor.fetchone()

    if not patient:
        return "Patient not found", 404

    symptoms = session.get('symptoms', [])
    medicines = session.get('medicines', [])
    diagnosis_id = f"DX{datetime.now().strftime('%Y%m%d%H%M%S')}"
    scan_date = datetime.now().strftime('%B %d, %Y - %H:%M')

    buffer = BytesIO()
    pdf = canvas.Canvas(buffer)
    width, height = pdf._pagesize

    # Hospital Header
    header_color = colors.HexColor('#0066CC')
    text_color = colors.HexColor('#1d1d1f')
    secondary_text = colors.HexColor('#86868b')
    line_color = colors.HexColor('#d2d2d7')

    pdf.setFillColor(header_color)
    pdf.rect(0, height - 90, width, 90, fill=True, stroke=False)
    
    logo = os.path.join(app.root_path, 'static', 'assets/red-cross.png')
    if os.path.exists(logo):
        pdf.drawImage(ImageReader(logo), 40, height - 75, 55, 55, mask='auto')

    pdf.setFillColor(colors.white)
    pdf.setFont("Helvetica-Bold", 24)
    pdf.drawString(110, height - 50, "MEDI-MASTER HEALTHCARE")
    pdf.setFont("Helvetica", 10)
    pdf.drawString(110, height - 70, "123 Innovation Drive, Tech District | (800) 555-0199 | medimaster.hospital.demo")

    # Document Details Box
    pdf.setFillColor(text_color)
    pdf.setFont("Helvetica-Bold", 14)
    pdf.drawString(40, height - 130, "CLINICAL DIAGNOSTIC REPORT")
    
    pdf.setFont("Helvetica", 10)
    pdf.setFillColor(secondary_text)
    pdf.drawRightString(width - 40, height - 120, f"Record ID: {diagnosis_id}")
    pdf.drawRightString(width - 40, height - 135, f"Date: {scan_date}")

    pdf.setStrokeColor(line_color)
    pdf.setLineWidth(1)
    pdf.line(40, height - 145, width - 40, height - 145)

    # Patient Demographics
    y = height - 180
    pdf.setFillColor(text_color)
    pdf.setFont("Helvetica-Bold", 12)
    pdf.drawString(40, y, "PATIENT DEMOGRAPHICS")
    
    pdf.setFillColor(colors.HexColor('#fbfbfd'))
    pdf.setStrokeColor(line_color)
    pdf.rect(40, y - 90, width - 80, 80, fill=True, stroke=True)

    pdf.setFillColor(text_color)
    pdf.setFont("Helvetica-Bold", 10)
    
    # Col 1
    pdf.drawString(55, y - 30, "Patient Name:")
    pdf.drawString(55, y - 50, "Patient ID:")
    pdf.drawString(55, y - 70, "Age / Gender:")
    
    # Col 2
    pdf.drawString(320, y - 30, "Blood Group:")
    pdf.drawString(320, y - 50, "Known Allergies:")

    pdf.setFont("Helvetica", 10)
    pdf.drawString(150, y - 30, str(patient[1]))
    pdf.drawString(150, y - 50, f"PT-{patient[0]}")
    pdf.drawString(150, y - 70, f"{patient[4]} Yrs / {patient[2]}")
    
    blood_group = patient[3] if patient[3] else "Not Specified"
    allergies = patient[5] if patient[5] else "None Reported"
    pdf.drawString(420, y - 30, str(blood_group))
    pdf.drawString(420, y - 50, str(allergies))

    # Medical Assessment
    y -= 130
    pdf.setFont("Helvetica-Bold", 12)
    pdf.drawString(40, y, "CLINICAL ASSESSMENT")
    
    y -= 25
    pdf.setFont("Helvetica-Bold", 10)
    pdf.setFillColor(header_color)
    pdf.drawString(40, y, "REPORTED SYMPTOM MATRIX")
    
    y -= 20
    pdf.setFillColor(text_color)
    pdf.setFont("Helvetica", 10)
    
    if symptoms:
        for s in symptoms:
            pdf.drawString(50, y, f"•  {s}")
            y -= 16
    else:
        pdf.setFont("Helvetica-Oblique", 10)
        pdf.drawString(50, y, "No formal symptoms selected during triage.")
        y -= 16

    y -= 10
    pdf.setFont("Helvetica-Bold", 10)
    pdf.setFillColor(header_color)
    pdf.drawString(40, y, "RECOMMENDED PRESCRIPTIONS")
    
    y -= 20
    pdf.setFillColor(text_color)
    pdf.setFont("Helvetica", 10)
    
    if medicines:
        for m in medicines:
            # Add a checkbox square for a medical chart feel
            pdf.rect(50, y - 2, 8, 8, stroke=True, fill=False)
            pdf.drawString(70, y, str(m))
            y -= 16
    else:
        pdf.setFont("Helvetica-Oblique", 10)
        pdf.drawString(50, y, "No direct pharmacological intervention recommended.")
        y -= 16

    # Doctor Signature Line
    y = max(y - 60, 150)
    pdf.setStrokeColor(line_color)
    pdf.line(40, y, 200, y)
    pdf.setFont("Helvetica", 9)
    pdf.setFillColor(secondary_text)
    pdf.drawString(40, y - 15, "Attending Physician Signature")
    
    pdf.line(width - 240, y, width - 40, y)
    pdf.drawString(width - 240, y - 15, "Pharmacy Dispensing Authorization")

    # Confidentiality Footer
    pdf.setFillColor(colors.HexColor('#f0f0f5'))
    pdf.rect(0, 0, width, 40, fill=True, stroke=False)
    
    pdf.setFillColor(secondary_text)
    pdf.setFont("Helvetica-Oblique", 8)
    footer_text = "CONFIDENTIAL MEDICAL RECORD. This document is system-generated by Medi-Master. Do not duplicate without authorization."
    pdf.drawCentredString(width / 2, 15, footer_text)

    pdf.showPage()
    pdf.save()
    buffer.seek(0)

    return send_file(buffer, as_attachment=True,
                     download_name=f"Clinical_Report_{name.replace(' ', '_')}.pdf",
                     mimetype='application/pdf')

# ------------------ RUN ------------------

if __name__ == '__main__':
    app.run(debug=True)