[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://dashboard.heroku.com/new?template=https://github.com/devillD/nsfw-autofilter-telegrambot)


# NSFW Auto Filter [Telegram Bot](https://core.telegram.org/bots) by [Django](https://www.djangoproject.com/) and [Keras](https://keras.io/)
I've used the a pretraiend model for detecting nsfw contents that is avaiable in [NudeNet](https://github.com/notAI-tech/NudeNet) repository.
You should start this robot and add it to each group you want (you have to set the bot as admin) and when somebody sends nsfw contents, this bot removes that automatically. By the way this bot has more options like filtering links, stickers, documents, etc.

## How to run project
1. Install Python v3.6
2. Install virtualenv
```bash
pip insatll virtualenv
```
3. Create a virtual environment:
```bash
virtualenv venv
```
4. Active the virtual environment (On Linux):
```bash
source venv/bin/activate
```
5. Install all the requirements by using this command:
```bash
pip install -r requirements.txt
```
6. Download the model from [here](https://github.com/bedapudi6788/NudeNet/releases/download/v0/classifier_model) and put it in a folder like `models`.
7. Move and rename `config.py.sample` to `ndproject/config.py` and do proper changes.
8. Do migrations:
```bash
python manage.py makemigrations
python manage.py migrate
```
9. Run project:
```bash
python manage.py runserver
```
