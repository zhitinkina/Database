from ssl import create_default_context
from smtplib import SMTP_SSL


def report_on_email(report, to_email):
    email = "lovelymeg346@gmail.com"
    password = "q9w2e5r0"

    with SMTP_SSL("smtp.gmail.com", port=465, context=create_default_context()) as server:
        server.login(email, password)
        server.sendmail(email, to_email, f"""Subject: Payment report

{report}
""")
