<div align="center">
  <img src="static/assets/red-cross.png" alt="Medi-Master Logo" width="100"/>
  <h1>Medi-Master</h1>
  <p><strong>Intelligent Diagnostic & Healthcare Prescription Engine</strong></p>
  <p>
    <a href="https://python.org">
      <img src="https://img.shields.io/badge/Python-3.9+-blue.svg" alt="Python Version"/>
    </a>
    <a href="https://flask.palletsprojects.com/">
      <img src="https://img.shields.io/badge/Framework-Flask-black.svg" alt="Flask"/>
    </a>
    <a href="https://www.mysql.com/">
      <img src="https://img.shields.io/badge/Database-MySQL-4479A1.svg" alt="MySQL"/>
    </a>
  </p>
</div>

<br/>

Medi-Master is a state-of-the-art medical diagnostic assistant designed for clinical speed, security, and precision. Built on a high-performance Flask and MySQL architecture, it evaluates complex, multi-symptom profiles to securely identify and recommend pharmacological interventions.

It features a minimalist, corporate-grade Apple/Northern Trust inspired design system and automated hospital-grade PDF report generation.

---

## 🌟 Key Features

- **Intelligent Symptom Triage**: Advanced matrix system allowing for multi-symptom selection and immediate algorithmic cross-referencing.
- **Enterprise-Grade UI**: A highly polished, responsive design utilizing a stark, corporate color palette, glassmorphism, and seamless micro-interactions.
- **Dynamic Medical Registry**: Full relational database backend containing available medications, prerequisites, and clinical alternatives.
- **Automated Clinical Reports**: Generates formal, hospital-grade PDF documents using ReportLab, complete with diagnostic record IDs, demographic boxes, and professional formatting.

## 🛠 Tech Stack

- **Frontend:** HTML5, CSS3 (Custom Design System), Jinja2 Templating, jQuery, Select2
- **Backend:** Python 3.9+, Flask
- **Database:** MySQL
- **PDF Generation:** ReportLab

## 🚀 Getting Started

### Prerequisites
Make sure you have Python 3.9+ and MySQL installed. 

### 1. Clone the repository
```bash
git clone https://github.com/yourusername/medi-master.git
cd medi-master
```

### 2. Set up the Database
1. Launch your MySQL server.
2. Create the `medi_master` database.
3. Import your SQL dump (if available) to populate the `SYMPTOM`, `MEDICINE`, and `SYMPTOM_MEDICINE_MAP` tables.
4. Update the `DB_CONFIG` credentials in `app.py` to match your local setup:
```python
DB_CONFIG = {
    'host': '127.0.0.1',
    'user': 'root',
    'password': 'YourPasswordHere',
    'database': 'medi_master',
    'port': 3306
}
```

### 3. Install Requirements
We recommend using a virtual environment:
```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

### 4. Run the Application
Launch the Flask development server:
```bash
python3 app.py
```
Visit `http://127.0.0.1:5000/` in your browser.

## 📁 Project Structure

```text
├── app.py                  # Main Flask application & routing
├── requirements.txt        # Python dependencies
├── static/                 
│   ├── assets/             # Images and logos
│   └── css/
│       └── main.css        # Enterprise design system
└── templates/              # Jinja2 HTML templates
    ├── base.html           # Master layout
    ├── index.html          # Hero and triage view
    ├── patient.html        # Demographics intake
    ├── database.html       # Medical registry view
    └── ...
```

---
<div align="center">
  <i>Developed for clinical precision. © 2026 Medi-Master Healthcare Systems.</i>
</div>
