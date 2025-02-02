from fastapi import (BackgroundTasks, UploadFile, 
                    File, Form, Depends, HTTPException, status)

from dotenv import dotenv_values
from pydantic import BaseModel, EmailStr
from typing import List
from fastapi_mail import FastMail, MessageSchema,ConnectionConfig
import jwt
from models import User

config_credentials = dict(dotenv_values(".env"))
conf = ConnectionConfig(
    MAIL_USERNAME=config_credentials["EMAIL"],
    MAIL_PASSWORD=config_credentials["PASS"],
    MAIL_FROM=config_credentials["EMAIL"],
    MAIL_PORT=587,
    MAIL_SERVER="smtp.gmail.com",
    MAIL_STARTTLS = True,  # Ganti MAIL_TLS dengan MAIL_STARTTLS
    MAIL_SSL_TLS = False,  # Ganti MAIL_SSL dengan MAIL_SSL_TLS
    USE_CREDENTIALS = True,
    VALIDATE_CERTS = True  # Tambahkan ini untuk memvalidasi sertifikat
)

class EmailSchema(BaseModel):
    email: List[EmailStr]

async def send_email(email : List, instance: User):

    token_data = {
        "id" : instance.id,
        "username" : instance.username,
    }

    token = jwt.encode(token_data, config_credentials["SECRET"], algorithm="HS256")

    template = f"""
        <!DOCTYPE html>
        <html>
        <head>
        </head>
        <body>
            <div style=" display: flex; align-items: center; justify-content: center; flex-direction: column;">
                <h3> Account Verification </h3>
                <br>
                <p>Thanks for choosing Warung Omega, please 
                click on the link below to verify your account</p> 

                <a style="margin-top:1rem; padding: 1rem; border-radius: 0.5rem; font-size: 1rem; text-decoration: none; background: #0275d8; color: white;"
                 href="http://localhost:8000/verification/?token={token}">
                    Verify your email
                <a>

                <p style="margin-top:1rem;">If you did not register for Warung Omega, 
                please kindly ignore this email and nothing will happen. Thanks<p>
            </div>
        </body>
        </html>
    """

    message = MessageSchema(
        subject="Warung Omega Account Verification Mail",
        recipients=email,  # List of recipients, as many as you can pass 
        body=template,
        subtype="html"
        )

    fm = FastMail(conf)
    await fm.send_message(message) 