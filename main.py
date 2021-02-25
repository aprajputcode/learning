from flask import Flask, render_template, request,session,redirect,flash
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import json
from flask_mail import Mail
import os
from werkzeug.utils import secure_filename
import math

with open( 'config.json', 'r' ) as c :
    params = json.load( c )["params"]
local_server = True
app = Flask( __name__ )
app.secret_key='super-secret_key'
app.config['UPLOAD_FOLDER']=params['upload_location']
app.config.update(
    MAIL_SERVER='smtp.gmail.com',
    MAIL_PORT='465',
    MAIL_USE_SSL=True,
    MAIL_USERNAME=params['mail_user'],
    MAIL_PASSWORD=params['mail_pass']
)
mail = Mail( app )
if (local_server) :
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else :
    app.config['SQLALCHEMY_DATABASE_URI'] = params['production_uri']

db = SQLAlchemy( app )


class Contacts( db.Model ) :
    sr_no = db.Column( db.Integer, primary_key=True )
    name = db.Column( db.String( 80 ), nullable=False )
    phone_no = db.Column( db.Integer, nullable=False )
    message = db.Column( db.String( 120 ), nullable=False )
    date = db.Column( db.String( 12 ), nullable=True )
    email = db.Column( db.String( 20 ), nullable=False )



class Languges( db.Model ) :
    sno= db.Column( db.Integer, primary_key=True )
    languag= db.Column( db.String( 50 ), nullable=False )
    lang_photo = db.Column( db.String( 50 ), nullable=False )
    description = db.Column( db.String( 200 ), nullable=True )
    writing_name = db.Column( db.String( 50 ), nullable=True )
    date= db.Column( db.String( 12 ), nullable=True)


class Java( db.Model ) :
    sno = db.Column( db.Integer, primary_key=True )
    languagsubpoint= db.Column( db.String( 50 ), nullable=False )
    program= db.Column( db.String( 1000 ), nullable=False )
    subdescription = db.Column( db.String( 2000 ), nullable=True )
    example= db.Column( db.String( 500 ), nullable=True )
    date = db.Column( db.String( 12 ), nullable=True)
    whoissinsertthisdata = db.Column( db.String( 50 ), nullable=True)
@app.route( "/" )
def home() :
    posts = Languges.query.filter_by().all()
    last=math.ceil(len(posts)/int(params['no_of_posts']))
    page=request.args.get('page')
    if(not str(page).isnumeric()):
        page=1
    page=int(page)
    posts = posts[(page-1)*int(params['no_of_posts']):(page-1)*int(params['no_of_posts'])+int(params['no_of_posts'])]
    if (page==1):
        prev="#"
        next="/?page="+str(page+1)
    elif(page==last):
        next = "#"
        prev = "/?page=" + str( page - 1 )
    #middle
    else:
        prev = "/?page=" + str( page - 1 )
        next = "/?page=" + str( page + 1 )
    return render_template( 'index.html', params=params ,posts=posts,prev=prev,next=next)

@app.route( "/about" )
def about() :
    return render_template( 'about.html', params=params )


@app.route("/post/<string:languag>", methods=['GET'])
def post_route(languag):
    post = Languges.query.filter_by(languag=languag).first()
    posts=Java.query.all()
    return render_template('post.html', params=params, post=post,posts=posts)

@app.route("/posts/<string:sno>", methods=['GET'])
def sub_post_route(sno):
    posts=Java.query.filter_by(sno=sno).first()
    b=len(posts.program)
    x=posts.program.split("\n")
    return render_template('subpost.html', params=params, posts=posts,x=x)



@app.route( "/contact", methods=['GET', 'POST'] )
def contact() :
    if (request.method == 'POST') :
        name = request.form.get( 'name' )
        email = request.form.get( 'email' )
        phones = request.form.get( 'phone' )
        messages = request.form.get( 'message' )
        entry = Contacts( name=name, email=email, phone_no=phones, message=messages, date=datetime.now() )
        db.session.add( entry )
        db.session.commit()
        '''mail.send_message( 'New message from ' + name,
                           sender=email,
                           recipients=[params['mail_user']],
                           body=messages + "\n" + phones
                           )'''
        flash("THANK YOU FOR SUBMITING YOUR DETAILS.WE WILL GET BACK TO YOU SOON","success")

    return render_template( 'contact.html', params=params )


@app.route( "/dashboard",methods=['GET','POST'] )
def admin() :
    if ('uname' in session and session['uname']==params['admin_user']):
        posts = Java.query.all()
        return render_template( 'dashboard.html', params=params, posts=posts )

    if request.method=='POST':
        user=request.form.get('uname')
        passw=request.form.get('pass')
        if (user==params['admin_user'] and passw==params['admin_pass']):
            session['uname']= user
            posts=Java.query.all()
            return render_template( 'dashboard.html', params=params ,posts=posts)

    return render_template( 'admin.html',params=params)


@app.route( "/logout")
def logout() :
    session.pop('uname')
    return redirect('/dashboard')

@app.route( "/uploader", methods=['GET', 'POST']  )
def uploader() :
    if ('uname' in session and session['uname'] == params['admin_user']) :
        if (request.method=='POST'):
            f=request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename( f.filename ) ))
            return "Uploaded succefully"

@app.route( "/edit/<string:sno>",methods=['GET','POST'] )
def edit(sno) :
    if ('uname' in session and session['uname']==params['admin_user']):
        if request.method=='POST':
            point=request.form.get('point')
            slug = request.form.get( 'slug' )
            content = request.form.get( 'content' )
            program=request.form.get('program')
            example=request.form.get('example')
            writer=request.form.get('writer')
            imgfile=request.form.get('imgfile')
            if sno=='0':
                post = Java( languagsubpoint=point,slug=slug,  subdescription=content,program=program,whoissinsertthisdata=writer, example=example, imgfile=img_file,
                              date=datetime.now() )
                db.session.add( post )
                db.session.commit()



            else:
                post = Java.query.filter_by( sno=sno ).first()
                post.languagsubpoint = point
                post.slug = slug
                post.subdescription = content
                post.program = program
                post.example = example
                post.whoissinsertthisdata = writer
                post.imgfile= imgfile
                db.session.commit()
                return redirect( '/edit/' + sno )
        post = Java.query.filter_by( sno=sno ).first()
        return render_template( 'edit.html', params=params, post=post,sno=sno )

@app.route( "/delete/<string:sno>",methods=['GET','POST'] )
def delete(sno) :
    if ('uname' in session and session['uname'] == params['admin_user']) :
        post = Java.query.filter_by( sno=sno ).first()
        db.session.delete( post )
        db.session.commit()
        if request.method == 'POST' :

            post = Java.query.filter_by( sno=sno ).first()
            db.session.delete(post)
            db.session.commit()
        return redirect('/dashboard')

app.run( debug=True )






